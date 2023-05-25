class CartModel {
  final String? itemsprice;
  final String? countitems;
  final String? cartId;
  final String? cartUsersid;
  final String? cartItemsid;
  final String? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDesc;
  final String? itemsDessAr;
  final String? itemsImage;
  final String? itemsCount;
  final String? itemsActive;
  final String? itemsPrice;
  final String? itemsDiscount;
  final String? itemsData;
  final String? itemsCate;
  const CartModel({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDessAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsData,
    this.itemsCate,
  });
  CartModel copyWith({
    String? itemsprice,
    String? countitems,
    String? cartId,
    String? cartUsersid,
    String? cartItemsid,
    String? itemsId,
    String? itemsName,
    String? itemsNameAr,
    String? itemsDesc,
    String? itemsDessAr,
    String? itemsImage,
    String? itemsCount,
    String? itemsActive,
    String? itemsPrice,
    String? itemsDiscount,
    String? itemsData,
    String? itemsCate,
  }) {
    return CartModel(
      itemsprice: itemsprice ?? this.itemsprice,
      countitems: countitems ?? this.countitems,
      cartId: cartId ?? this.cartId,
      cartUsersid: cartUsersid ?? this.cartUsersid,
      cartItemsid: cartItemsid ?? this.cartItemsid,
      itemsId: itemsId ?? this.itemsId,
      itemsName: itemsName ?? this.itemsName,
      itemsNameAr: itemsNameAr ?? this.itemsNameAr,
      itemsDesc: itemsDesc ?? this.itemsDesc,
      itemsDessAr: itemsDessAr ?? this.itemsDessAr,
      itemsImage: itemsImage ?? this.itemsImage,
      itemsCount: itemsCount ?? this.itemsCount,
      itemsActive: itemsActive ?? this.itemsActive,
      itemsPrice: itemsPrice ?? this.itemsPrice,
      itemsDiscount: itemsDiscount ?? this.itemsDiscount,
      itemsData: itemsData ?? this.itemsData,
      itemsCate: itemsCate ?? this.itemsCate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'itemsprice': itemsprice,
      'countitems': countitems,
      'cart_id': cartId,
      'cart_usersid': cartUsersid,
      'cart_itemsid': cartItemsid,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_dess_ar': itemsDessAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': itemsPrice,
      'items_discount': itemsDiscount,
      'items_data': itemsData,
      'items_cate': itemsCate,
    };
  }

  static CartModel fromJson(Map<String, Object?> json) {
    return CartModel(
        itemsprice:
            json['itemsprice'] == null ? null : json['itemsprice'] as String,
        countitems:
            json['countitems'] == null ? null : json['countitems'] as String,
        cartId: json['cart_id'] == null ? null : json['cart_id'] as String,
        cartUsersid: json['cart_usersid'] == null
            ? null
            : json['cart_usersid'] as String,
        cartItemsid: json['cart_itemsid'] == null
            ? null
            : json['cart_itemsid'] as String,
        itemsId: json['items_id'] == null ? null : json['items_id'] as String,
        itemsName:
            json['items_name'] == null ? null : json['items_name'] as String,
        itemsNameAr: json['items_name_ar'] == null
            ? null
            : json['items_name_ar'] as String,
        itemsDesc:
            json['items_desc'] == null ? null : json['items_desc'] as String,
        itemsDessAr: json['items_dess_ar'] == null
            ? null
            : json['items_dess_ar'] as String,
        itemsImage:
            json['items_image'] == null ? null : json['items_image'] as String,
        itemsCount:
            json['items_count'] == null ? null : json['items_count'] as String,
        itemsActive: json['items_active'] == null
            ? null
            : json['items_active'] as String,
        itemsPrice:
            json['items_price'] == null ? null : json['items_price'] as String,
        itemsDiscount: json['items_discount'] == null
            ? null
            : json['items_discount'] as String,
        itemsData:
            json['items_data'] == null ? null : json['items_data'] as String,
        itemsCate:
            json['items_cate'] == null ? null : json['items_cate'] as String);
  }

  @override
  String toString() {
    return '''CartModel(
                itemsprice:$itemsprice,
countitems:$countitems,
cartId:$cartId,
cartUsersid:$cartUsersid,
cartItemsid:$cartItemsid,
itemsId:$itemsId,
itemsName:$itemsName,
itemsNameAr:$itemsNameAr,
itemsDesc:$itemsDesc,
itemsDessAr:$itemsDessAr,
itemsImage:$itemsImage,
itemsCount:$itemsCount,
itemsActive:$itemsActive,
itemsPrice:$itemsPrice,
itemsDiscount:$itemsDiscount,
itemsData:$itemsData,
itemsCate:$itemsCate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CartModel &&
        other.runtimeType == runtimeType &&
        other.itemsprice == itemsprice &&
        other.countitems == countitems &&
        other.cartId == cartId &&
        other.cartUsersid == cartUsersid &&
        other.cartItemsid == cartItemsid &&
        other.itemsId == itemsId &&
        other.itemsName == itemsName &&
        other.itemsNameAr == itemsNameAr &&
        other.itemsDesc == itemsDesc &&
        other.itemsDessAr == itemsDessAr &&
        other.itemsImage == itemsImage &&
        other.itemsCount == itemsCount &&
        other.itemsActive == itemsActive &&
        other.itemsPrice == itemsPrice &&
        other.itemsDiscount == itemsDiscount &&
        other.itemsData == itemsData &&
        other.itemsCate == itemsCate;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      itemsprice,
      countitems,
      cartId,
      cartUsersid,
      cartItemsid,
      itemsId,
      itemsName,
      itemsNameAr,
      itemsDesc,
      itemsDessAr,
      itemsImage,
      itemsCount,
      itemsActive,
      itemsPrice,
      itemsDiscount,
      itemsData,
      itemsCate,
    );
  }
}

class CountPriceModel {
  final String? totalprice;
  final String? totalcount;
  final String? totalitems;
  const CountPriceModel({this.totalprice, this.totalcount, this.totalitems});
  CountPriceModel copyWith(
          {String? totalprice, String? totalcount, String? totalitems}) =>
      CountPriceModel(
        totalprice: totalprice ?? this.totalprice,
        totalcount: totalcount ?? this.totalcount,
        totalitems: totalitems ?? this.totalitems,
      );

  Map<String, Object?> toJson() {
    return {
      'totalprice': totalprice,
      'totalcount': totalcount,
      'totalitems': totalitems,
    };
  }

  static CountPriceModel fromJson(Map<String, Object?> json) {
    return CountPriceModel(
      totalprice:
          json['totalprice'] == null ? null : json['totalprice'] as String,
      totalcount:
          json['totalcount'] == null ? null : json['totalcount'] as String,
      totalitems:
          json['totalitems'] == null ? null : json['totalitems'] as String,
    );
  }

  @override
  String toString() {
    return '''CountPriceModel(
                totalprice:$totalprice,
totalcount:$totalcount,
totalitems:$totalitems
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CountPriceModel &&
        other.runtimeType == runtimeType &&
        other.totalprice == totalprice &&
        other.totalcount == totalcount &&
        other.totalitems == totalitems;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalprice, totalcount, totalitems);
  }
}
