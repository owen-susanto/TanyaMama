import 'package:flutter_tanya_mama/enums/item_category.dart';
import 'package:flutter_tanya_mama/enums/item_type.dart';
import 'package:flutter_tanya_mama/enums/user_hobby.dart';
import 'package:flutter_tanya_mama/enums/user_profession.dart';
import 'package:flutter_tanya_mama/functions/enum_parser.dart';

class Item {
  static Item _empty;

  final ItemCategory itemCategory;
  final int itemPrice;
  final int itemRanking;
  final int itemDuration;
  final List<UserHobby> itemHobbies;
  final UserProfession itemProfession;
  final String itemData;
  final ItemType itemType;

  const Item({
    this.itemCategory,
    this.itemPrice,
    this.itemRanking,
    this.itemDuration,
    this.itemHobbies,
    this.itemProfession,
    this.itemData,
    this.itemType,
  });

  static Item empty() {
    return _empty ??= Item(itemData: "EMPTY");
  }

  bool get isEmpty => this == Item.empty();

  static Item fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Item(
            itemCategory: EnumParser.getEnum<ItemCategory>(
                ItemCategory.values, data["itemCategory"]),
            itemPrice: data["itemPrice"] ?? 0,
            itemRanking: data["itemRanking"] ?? 0,
            itemDuration: data["itemDuration"] ?? 0,
            itemHobbies: data["itemHobbies"] != null
                ? List.from(data["itemHobbies"]
                    .map((e) =>
                        EnumParser.getEnum<UserHobby>(UserHobby.values, e))
                    .toList())
                : [],
            itemProfession: EnumParser.getEnum<UserProfession>(
                UserProfession.values, data["itemProfession"]),
            itemData: data["itemData"] ?? "",
            itemType:
                EnumParser.getEnum<ItemType>(ItemType.values, data["itemType"]),
          );
  }

  static List<Item> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "itemCategory": EnumParser.getString(itemCategory),
      "itemPrice": itemPrice,
      "itemRanking": itemRanking,
      "itemDuration": itemDuration,
      "itemHobbies": itemHobbies.map((e) => EnumParser.getString(e)).toList(),
      "itemProfession": EnumParser.getString(itemProfession),
      "itemData": itemData,
      "itemType": EnumParser.getString(itemType),
    };
  }
}
