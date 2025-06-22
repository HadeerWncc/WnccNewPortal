import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class CustomPhoneInputList extends StatefulWidget {
  const CustomPhoneInputList({
    super.key,
    required this.phonesController,
  });

  final List<TextEditingController> phonesController;

  @override
  State<CustomPhoneInputList> createState() => _CustomPhoneInputListState();
}

class _CustomPhoneInputListState extends State<CustomPhoneInputList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.phonesController.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CustomPlaceholderInput(
              labelText: 'Phone',
              controller: widget.phonesController[index],
              width: MediaQuery.of(context).size.width * .5,
              actions: [
                IconButton(
                  onPressed: widget.phonesController.length == 1
                      ? null
                      : () {
                          widget.phonesController
                              .remove(widget.phonesController[index]);
                          setState(() {});
                        },
                  icon: Icon(
                    FontAwesomeIcons.trashCan,
                    size: widget.phonesController.length == 1 ? 0 : 22,
                    color: Colors.redAccent,
                  ),
                ),
                IconButton(
                  onPressed: (index != (widget.phonesController.length - 1))
                      ? null
                      : () {
                          widget.phonesController.add(
                            TextEditingController(),
                          );
                          setState(() {});
                        },
                  icon: Icon(
                    FontAwesomeIcons.plus,
                    size: (index != (widget.phonesController.length - 1))
                        ? 0
                        : 22,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
