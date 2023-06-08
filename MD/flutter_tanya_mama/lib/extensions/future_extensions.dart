import 'package:cloud_firestore/cloud_firestore.dart';

extension FutureDocumentExtension on Future<DocumentSnapshot> {
  Future<T> mapDoc<T>(Function(Map<String, dynamic>) mapper, T empty) async {
    var doc = await this;
    if (!doc.exists) return empty;
    return mapper(doc.data() as Map<String, dynamic>);
  }
}

extension FutureQueryExtension on Future<QuerySnapshot> {
  Future<Iterable<T>> mapQuery<T>(
      Function(Map<String, dynamic>) mapper, Iterable<T> empty) async {
    var snapshot = await this;
    if (snapshot.docs.isEmpty) return empty;
    return snapshot.docs.map((e) => mapper(e.data() as Map<String, dynamic>));
  }
}
