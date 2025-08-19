import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/signalr_service.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/chat_bubble_for_another_user.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/chat_bubble_for_ccurrent_user.dart';

class RequestChat extends StatefulWidget {
  const RequestChat({
    super.key,
    required this.complaintId,
    // required this.onMessageSent,
    required this.user,
    required this.replies,
  });

  final String complaintId;
  // final Function(Map<String, dynamic>) onMessageSent;
  final UserModel user;
  final List<MessageDto> replies;
  @override
  State<RequestChat> createState() => _RequestChatState();
}

class _RequestChatState extends State<RequestChat> {
  late SignalRService _signalRService;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController chatController = TextEditingController();

  List<MessageDto> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.addAll(widget.replies);
    _signalRService = SignalRService();
    _startSignalR();
  }

  void _startSignalR() async {
    await _signalRService.startConnection();
    await _signalRService.joinRequestGroup(widget.complaintId);

    _signalRService.registerReceiveRequestMessageHandler((data) {
      final reply = MessageDto.fromJsonRequest(data);
      setState(() {
        _messages.add(reply);
      });
    });
  }

  @override
  void dispose() {
    _signalRService.connection.stop();
    super.dispose();
  }

  String chatReplay = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request Replies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  child: const Text('+0'),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return (_messages[_messages.length - (index + 1)].createdBy ==
                          widget.user.fullName)
                      ? ChatBubbleForCurrentUser(
                          message: _messages[_messages.length - (index + 1)])
                      : ChatBubbleForAnotherUser(
                          message: _messages[_messages.length - (index + 1)]);
                }),
          ),
          const Divider(),
          CustomPlaceholderInput(
            xAxis: MainAxisAlignment.center,
            controller: _controller,
            labelText: "Type your reply...",
            width: MediaQuery.of(context).size.width * .87,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * .87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWithIcon(
                  child: 'Reply',
                  textColor: Colors.white,
                  bgColor: kBtnColor,
                  icon: Symbols.send,
                  onHoverColor: const Color.fromARGB(255, 88, 164, 250),
                  onTap: _handleSend,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _handleSend() async {
    if (_controller.text.trim().isEmpty) return;
    await _signalRService.sendRequestMessage(
        widget.complaintId, _controller.text.trim());

    _controller.clear();
  }
}
