import 'package:flutter_tanya_mama/functions/enum_parser.dart';

class Chat {
  final String? id;
  final String? userId;
  final String? sessionId;
  final String? content;

  Chat({
    this.id,
    this.userId,
    this.sessionId,
    this.content,
  });

  static Chat fromMap(Map<String, dynamic> data) {
    return Chat(
      id: data['id'],
      userId: data['userId'],
      sessionId: data['sessionId'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      'id': id,
      'userId': userId,
      'sessionId': sessionId,
      'content': content,
    };
  }
}
