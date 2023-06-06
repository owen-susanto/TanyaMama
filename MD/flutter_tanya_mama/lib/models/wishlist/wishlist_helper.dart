import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tanya_mama/models/wishlist/wishlist.dart';

class WishlistHelper {
  final instance = FirebaseFirestore.instance;

  Future<void> create(Wishlist wishlist) async {
    await instance.collection('wishlists').doc().set(wishlist.toVariables());
  }

  Future<void> update(Wishlist wishlist) async {
    await instance
        .collection('wishlists')
        .doc(wishlist.id)
        .update(wishlist.toVariables());
  }

  Future<void> delete(Wishlist wishlist) async {
    await instance.collection('wishlists').doc(wishlist.id).delete();
  }

  Future<List<Wishlist>> getWishlists(String id) async {
    final snapshot = await instance
        .collection('wishlists')
        .where("userId", isEqualTo: id)
        .get();
    return Wishlist.fromMapList(snapshot.docs.map((e) => e.data()).toList());
  }

  Stream<Iterable<Wishlist>> getWishlistsStream(String id) {
    return instance
        .collection('wishlists')
        .where("userId", isEqualTo: id)
        .snapshots()
        .map((e) => Wishlist.fromMapList(e.docs.map((e) => e.data()).toList()));
  }
}
