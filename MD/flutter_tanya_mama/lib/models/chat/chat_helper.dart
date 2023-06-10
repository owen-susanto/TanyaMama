import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tanya_mama/basics/helpers/base_http_helper.dart';
import 'package:flutter_tanya_mama/models/chat/chat.dart';
import 'package:flutter_tanya_mama/models/reply/reply.dart';
import 'package:flutter_tanya_mama/models/session/session.dart';
import 'package:flutter_tanya_mama/models/session/session_helper.dart';

class ChatHelper extends BaseHTTPHelper {
  final instance = FirebaseFirestore.instance;

  Stream<Iterable<Chat>> list(String sessionId) {
    return instance
        .collection('chats')
        .where('sessionId', isEqualTo: sessionId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => Chat.fromMap(e.data())));
  }

  Future<Iterable<Chat>> getList(String sessionId) {
    return instance
        .collection('chats')
        .where('sessionId', isEqualTo: sessionId)
        .get()
        .then((snapshot) => snapshot.docs.map((e) => Chat.fromMap(e.data())));
  }

  Future<void> create(Chat chat) async {
    await instance.collection('chats').doc(chat.id).set(chat.toVariables());
  }

  Future<Reply?> send(String chat, Session session) async {
    try {
      var result = await post(
          endpoint: "send",
          json: jsonEncode({"chat": chat, "sessionId": session.id}));
      return Reply(
        replies: result["replies"],
        mamaEmotion: result["mamaEmotion"],
        session: await SessionHelper().getSession(result["sessionId"]),
        verdict: result["verdict"],
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> update(Chat chat) async {
    await instance.collection('chats').doc(chat.id).update(chat.toVariables());
  }

  Future<void> delete(Chat chat) async {
    await instance.collection('chats').doc(chat.id).delete();
  }

  @override
  // TODO: implement modelName
  String get modelName => "Chat";

  @override
  // TODO: implement route
  String get route => throw "Chat";
}
