import 'package:signalr_core/signalr_core.dart';
import 'package:wncc_portal/core/constants/links.dart';
import 'package:wncc_portal/core/utils/shared_preferences.dart';

class SignalRService {
  late HubConnection _hubConnection;

  SignalRService() {
    _hubConnection = HubConnectionBuilder()
        .withUrl(
          '${baseUrl}chatHub',
          HttpConnectionOptions(
            accessTokenFactory: () async {
              String? token = await getToken();
              return token ?? '';
            },
            transport: HttpTransportType.webSockets,
          ),
        )
        .withAutomaticReconnect()
        .build();
  }

  Future<void> startConnection() async {
    try {
      await _hubConnection.start();
    } catch (e) {
      print('❌ Connection failed: $e');
    }
  }

  Future<void> joinRequestGroup(String requestId) async {
    try {
      await _hubConnection.invoke('JoinRequestGroup', args: [requestId]);
    } catch (e) {
      print("❌ Failed to join group: $e");
    }
  }

  Future<void> sendRequestMessage(String complaintId, String reply) async {
    if (_hubConnection.state == HubConnectionState.connected) {
      try {
        await _hubConnection
            .invoke('SendRequestMessage', args: [complaintId, reply]);
      } catch (e) {
        print('❌ Error sending message: $e');
      }
    } else {
      print('❌ Hub connection is not active');
    }
  }

  void registerReceiveRequestMessageHandler(
      Function(Map<String, dynamic>) onMessageReceived) {
    _hubConnection.on('ReceiveRequestMessage', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = Map<String, dynamic>.from(arguments[0] as Map);
        onMessageReceived(data);
      }
    });
  }

  HubConnection get connection => _hubConnection;
}
