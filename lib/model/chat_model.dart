// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String? name;
  final String? msg;
  final String? time;
  ChatModel({
    this.name,
    this.msg,
    this.time,
  });
}

class ChatListModel {
  final String? name;
  final String? imagePath;
  final String? lastSeen;
  final String? lastMessage;
  final String? messageTime;

  ChatListModel(
      {this.name,
      this.imagePath,
      this.lastSeen,
      this.lastMessage,
      this.messageTime});
}
