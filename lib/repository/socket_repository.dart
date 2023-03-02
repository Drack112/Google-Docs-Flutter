import 'package:socket_io_client/socket_io_client.dart';
import 'package:docs_google/clients/socket_client.dart';

class SocketRepository {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  void joinRoom(String documentId) {
    _socketClient.emit("join", documentId);
  }
}
