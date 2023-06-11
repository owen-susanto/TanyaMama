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
  DateTime? createDate;

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
    this.createDate,
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
      price: data["price"] ?? 0,
      verdict: data["verdict"],
      rejectType: data["rejectType"],
      isActive: data["isActive"] ?? false,
      createDate: DateTime.tryParse(data["createDate"]) ?? DateTime.now(),
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
      "price": price,
      "verdict": verdict,
      "rejectType": rejectType,
      "isActive": isActive,
      "createDate": createDate?.toIso8601String()
    };
  }
}
