class Session {
  static Session? _empty;

  String? id;
  String? userId;
  int? price;
  String? promotion;
  int? rejectType;
  bool? verdict;
  String? item;
  bool? isActive;

  static Session empty() {
    return _empty ??= Session(id: "EMPTY");
  }

  bool get isEmpty => this == Session.empty();

  Session({
    this.id,
    this.userId,
    this.item,
    this.price,
    this.promotion,
    this.verdict,
    this.rejectType,
    this.isActive,
  });

  static Session? fromMap(Map<String, dynamic> data) {
    return Session(
      id: data["id"] ?? "",
      userId: data["userId"] ?? "",
      item: data['item'],
      promotion: data['promotion'],
      price: data["prices"] ?? "",
      verdict: data["verdict"],
      rejectType: data["rejectType"] ?? 0,
      isActive: data["isActive"] ?? false,
    );
  }

  static List<Session?> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "userId": userId,
      "item": item,
      "promotion": promotion,
      "prices": price,
      "verdict": verdict,
      "rejectType": rejectType,
      "isActive": isActive,
    };
  }
}
