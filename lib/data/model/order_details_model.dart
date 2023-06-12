class OrderDetailsModel {
  final String? discountPrice;
  final String? countitems;
  final String? cartId;
  final String? cartUsersid;
  final String? cartItemsid;
  final String? cartOrders;
  final String? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDesc;
  final String? itemsDessAr;
  final String? itemsImage;
  final String? itemsCount;
  final String? itemsActive;
  final String? price;
  final String? itemsDiscount;
  final String? itemsDate;
  final String? itemsCate;
  const OrderDetailsModel({
    this.discountPrice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.cartOrders,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDessAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.price,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCate,
  });
  OrderDetailsModel copyWith(
      {String? discountPrice,
      String? countitems,
      String? cartId,
      String? cartUsersid,
      String? cartItemsid,
      String? cartOrders,
      String? itemsId,
      String? itemsName,
      String? itemsNameAr,
      String? itemsDesc,
      String? itemsDessAr,
      String? itemsImage,
      String? itemsCount,
      String? itemsActive,
      String? price,
      String? itemsDiscount,
      String? itemsData,
      String? itemsCate}) {
    return OrderDetailsModel(
        discountPrice: discountPrice ?? this.discountPrice,
        countitems: countitems ?? this.countitems,
        cartId: cartId ?? this.cartId,
        cartUsersid: cartUsersid ?? this.cartUsersid,
        cartItemsid: cartItemsid ?? this.cartItemsid,
        cartOrders: cartOrders ?? this.cartOrders,
        itemsId: itemsId ?? this.itemsId,
        itemsName: itemsName ?? this.itemsName,
        itemsNameAr: itemsNameAr ?? this.itemsNameAr,
        itemsDesc: itemsDesc ?? this.itemsDesc,
        itemsDessAr: itemsDessAr ?? this.itemsDessAr,
        itemsImage: itemsImage ?? this.itemsImage,
        itemsCount: itemsCount ?? this.itemsCount,
        itemsActive: itemsActive ?? this.itemsActive,
        price: price ?? this.price,
        itemsDiscount: itemsDiscount ?? this.itemsDiscount,
        itemsDate: itemsData ?? this.itemsDate,
        itemsCate: itemsCate ?? this.itemsCate);
  }

  Map<String, Object?> toJson() {
    return {
      'itemsprice': discountPrice,
      'countitems': countitems,
      'cart_id': cartId,
      'cart_usersid': cartUsersid,
      'cart_itemsid': cartItemsid,
      'cart_orders': cartOrders,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_dess_ar': itemsDessAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': price,
      'items_discount': itemsDiscount,
      'items_data': itemsDate,
      'items_cate': itemsCate
    };
  }

  static OrderDetailsModel fromJson(Map<String, Object?> json) {
    return OrderDetailsModel(
        discountPrice:
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
        cartOrders:
            json['cart_orders'] == null ? null : json['cart_orders'] as String,
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
        price:
            json['items_price'] == null ? null : json['items_price'] as String,
        itemsDiscount: json['items_discount'] == null
            ? null
            : json['items_discount'] as String,
        itemsDate:
            json['items_data'] == null ? null : json['items_data'] as String,
        itemsCate:
            json['items_cate'] == null ? null : json['items_cate'] as String);
  }

  @override
  String toString() {
    return '''OrderDetailsModel(
                itemsprice:$discountPrice,
countitems:$countitems,
cartId:$cartId,
cartUsersid:$cartUsersid,
cartItemsid:$cartItemsid,
cartOrders:$cartOrders,
itemsId:$itemsId,
itemsName:$itemsName,
itemsNameAr:$itemsNameAr,
itemsDesc:$itemsDesc,
itemsDessAr:$itemsDessAr,
itemsImage:$itemsImage,
itemsCount:$itemsCount,
itemsActive:$itemsActive,
itemsPrice:$price,
itemsDiscount:$itemsDiscount,
itemsData:$itemsDate,
itemsCate:$itemsCate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDetailsModel &&
        other.runtimeType == runtimeType &&
        other.discountPrice == discountPrice &&
        other.countitems == countitems &&
        other.cartId == cartId &&
        other.cartUsersid == cartUsersid &&
        other.cartItemsid == cartItemsid &&
        other.cartOrders == cartOrders &&
        other.itemsId == itemsId &&
        other.itemsName == itemsName &&
        other.itemsNameAr == itemsNameAr &&
        other.itemsDesc == itemsDesc &&
        other.itemsDessAr == itemsDessAr &&
        other.itemsImage == itemsImage &&
        other.itemsCount == itemsCount &&
        other.itemsActive == itemsActive &&
        other.price == price &&
        other.itemsDiscount == itemsDiscount &&
        other.itemsDate == itemsDate &&
        other.itemsCate == itemsCate;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        discountPrice,
        countitems,
        cartId,
        cartUsersid,
        cartItemsid,
        cartOrders,
        itemsId,
        itemsName,
        itemsNameAr,
        itemsDesc,
        itemsDessAr,
        itemsImage,
        itemsCount,
        itemsActive,
        price,
        itemsDiscount,
        itemsDate,
        itemsCate);
  }
}
