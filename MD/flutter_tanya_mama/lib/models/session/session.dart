import 'package:flutter_tanya_mama/models/item/item.dart';

class Session {
  static Session _empty;

  String id;
  String userId;
  int quantity;
  String reason;
  bool verdict;
  int rejectType;
  Item item;

  bool isHobby;
  bool isProfession;
  bool isActive;

  static Session empty() {
    return _empty ??= Session(id: "EMPTY");
  }

  bool get isEmpty => this == Session.empty();

  Session({
    this.id,
    this.userId,
    this.quantity,
    this.item,
    this.reason,
    this.verdict,
    this.rejectType,
    this.isHobby,
    this.isProfession,
    this.isActive,
  });

  static Session fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Session(
            id: data["id"] ?? "",
            userId: data["userId"] ?? "",
            quantity: data["quantity"] ?? 0,
            item: Item.fromMap(data["item"]),
            reason: data["reason"] ?? "",
            verdict: data["verdict"],
            rejectType: data["rejectType"] ?? 0,
            isHobby: data["isHobby"] ?? false,
            isProfession: data["isProfession"] ?? false,
            isActive: data["isActive"] ?? false,
          );
  }

  static List<Session> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "userId": userId,
      "quantity": quantity,
      "item": item?.toVariables(),
      "reason": reason,
      "verdict": verdict,
      "rejectType": rejectType,
      "isHobby": isHobby,
      "isProfession": isProfession,
      "isActive": isActive,
    };
  }
}
