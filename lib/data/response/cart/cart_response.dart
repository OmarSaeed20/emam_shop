import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  @JsonKey(name: "itemsprice")
  String? descountPrice;
  @JsonKey(name: "countitems")
  String? countitems;
  @JsonKey(name: "cart_id")
  String? cartId;
  @JsonKey(name: "cart_usersid")
  String? cartUsersid;
  @JsonKey(name: "cart_itemsid")
  String? cartItemsid;
  @JsonKey(name: "items_id")
  String? itemsId;
  @JsonKey(name: "items_name")
  String? itemsName;
  @JsonKey(name: "items_name_ar")
  String? itemsNameAr;
  @JsonKey(name: "items_desc")
  String? itemsDesc;
  @JsonKey(name: "items_dess_ar")
  String? itemsDessAr;
  @JsonKey(name: "items_image")
  String? itemsImage;
  @JsonKey(name: "items_count")
  String? itemsCount;
  @JsonKey(name: "items_active")
  String? itemsActive;
  @JsonKey(name: "items_price")
  String? itemsPrice;
  @JsonKey(name: "items_discount")
  String? itemsDiscount;
  @JsonKey(name: "items_data")
  String? itemsData;
  @JsonKey(name: "items_cate")
  String? itemsCate;

  CartResponse(
    this.cartId,
    this.itemsData,
    this.itemsDesc,
    this.itemsDessAr,
    this.itemsDiscount,
    this.itemsId,
    this.itemsImage,
    this.itemsName,
    this.itemsNameAr,
    this.itemsPrice,
    this.cartItemsid,
    this.cartUsersid,
    this.countitems,
    this.descountPrice,
    this.itemsActive,
    this.itemsCate,
    this.itemsCount,
  );

  // from json
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
