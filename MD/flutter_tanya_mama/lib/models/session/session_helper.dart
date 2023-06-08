import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tanya_mama/models/session/session.dart';
import 'package:flutter_tanya_mama/extensions/future_extensions.dart';
import 'package:flutter_tanya_mama/extensions/stream_extensions.dart';

class SessionHelper {
  final instance = FirebaseFirestore.instance;

  Stream<Session> getSessionStream(String id) {
    return instance
        .collection('sessions')
        .where("userId", isEqualTo: id)
        .where("isActive", isEqualTo: true)
        .snapshots()
        .mapList(Session.fromMap)
        .map((e) => e.first ?? Session.empty());
  }

  Future<Session> getSession(String id) async {
    final snapshot = await instance
        .collection('sessions')
        .where("userId", isEqualTo: id)
        .where("isActive", isEqualTo: true)
        .get()
        .mapQuery<Session>(Session.fromMap, [Session.empty()]);

    return snapshot.first;
  }

  void endSession(String id) {
    instance
        .collection('sessions')
        .doc(id)
        .update({'isActive': false, 'endTime': DateTime.now()});
  }

  Future<void> create(Session session) async {
    await instance
        .collection('sessions')
        .doc(session.id)
        .set(session.toVariables());
  }

  Future<void> update(Session session) async {
    await instance
        .collection('sessions')
        .doc(session.id)
        .update(session.toVariables());
  }
}
