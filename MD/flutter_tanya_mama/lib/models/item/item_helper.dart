import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tanya_mama/models/item/item.dart';
import 'package:flutter_tanya_mama/extensions/future_extensions.dart';

class ItemHelper {
  final instance = FirebaseFirestore.instance;

  Future<Item> getItem(String itemData) async {
    final snapshot = await instance
        .collection('items')
        .where("itemData", isEqualTo: itemData)
        .get()
        .mapQuery<Item>(Item.fromMap, [Item.empty()]);

    return snapshot.first;
  }
}
