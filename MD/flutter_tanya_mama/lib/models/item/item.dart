class Item {
  static Item? _empty;

  final int? itemPrice;
  final int? itemRanking;
  final int? itemDuration;
  // final List<UserHobby> itemHobbies;
  // final UserProfession itemProfession;
  final String? itemData;
  // final ItemType itemType;

  const Item({
    // this.itemCategory,
    this.itemPrice,
    this.itemRanking,
    this.itemDuration,
    // this.itemHobbies,
    // this.itemProfession,
    this.itemData,
    // this.itemType,
  });

  static Item empty() {
    return _empty ??= Item(itemData: "EMPTY");
  }

  bool get isEmpty => this == Item.empty();

  static Item? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Item(
            itemPrice: data["itemPrice"] ?? 0,
            itemRanking: data["itemRanking"] ?? 0,
            itemDuration: data["itemDuration"] ?? 0,
            itemData: data["itemData"] ?? "",
          );
  }

  static List<Item?>? fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "itemPrice": itemPrice,
      "itemRanking": itemRanking,
      "itemDuration": itemDuration,
      "itemData": itemData,
    };
  }
}
