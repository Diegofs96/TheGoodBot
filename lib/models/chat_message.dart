import 'dart:convert';

enum ChatMessageType { sent, received }

class ChatMessage {
  final String name;
  final String text;
  final ChatMessageType type;

  ChatMessage({
    this.name,
    this.text,
    this.type = ChatMessageType.sent,
  });


  factory ChatMessage.fromJson(String str) => ChatMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromMap(Map<String, dynamic> json) => ChatMessage(
        name: json["name"],
        text: json["text"],
        type: json["type"],
  );
       
  Map<String, dynamic> toMap() => {
        "name": name,
        "text": text,
        "type": type,
    };


}