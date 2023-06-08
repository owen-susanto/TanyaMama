import 'package:cloud_firestore/cloud_firestore.dart';

extension StreamQueryExtensions on Stream<QuerySnapshot> {
  Stream<Iterable<T>> mapList<T>(T Function(Map<String, dynamic>) mapper) {
    return map((event) {
      var isEmpty = event.docs.isEmpty;
      if (isEmpty) return [];
      return event.docs
          .map((e) => mapper(e.data() as Map<String, dynamic>))
          .toList();
    });
  }
}

extension StreamDocumentExtensions on Stream<DocumentSnapshot> {
  Stream<T> mapDocStream<T>(T Function(Map<String, dynamic>) mapper, T empty) {
    return map((event) {
      if (!event.exists) return empty;
      return mapper(event.data() as Map<String, dynamic>);
    });
  }
}
