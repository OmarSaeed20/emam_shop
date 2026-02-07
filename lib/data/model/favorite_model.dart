class FavoriteModel {
  final String? favoriteId;
  final String? favoriteUsersid;
  final String? favoriteItemsid;
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
  final String? userId;
  const FavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
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
    this.userId,
  });
  FavoriteModel copyWith({
    String? favoriteId,
    String? favoriteUsersid,
    String? favoriteItemsid,
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
    String? userId,
  }) {
    return FavoriteModel(
      favoriteId: favoriteId ?? this.favoriteId,
      favoriteUsersid: favoriteUsersid ?? this.favoriteUsersid,
      favoriteItemsid: favoriteItemsid ?? this.favoriteItemsid,
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
      userId: userId ?? this.userId,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'favorite_id': favoriteId,
      'favorite_usersid': favoriteUsersid,
      'favorite_itemsid': favoriteItemsid,
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
      'user_id': userId,
    };
  }

  static FavoriteModel fromJson(Map<String, Object?> json) {
    return FavoriteModel(
      favoriteId:
          json['favorite_id'] == null ? null : json['favorite_id'] as String,
      favoriteUsersid: json['favorite_usersid'] == null
          ? null
          : json['favorite_usersid'] as String,
      favoriteItemsid: json['favorite_itemsid'] == null
          ? null
          : json['favorite_itemsid'] as String,
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
      itemsActive:
          json['items_active'] == null ? null : json['items_active'] as String,
      itemsPrice:
          json['items_price'] == null ? null : json['items_price'] as String,
      itemsDiscount: json['items_discount'] == null
          ? null
          : json['items_discount'] as String,
      itemsData:
          json['items_data'] == null ? null : json['items_data'] as String,
      itemsCate:
          json['items_cate'] == null ? null : json['items_cate'] as String,
      userId: json['user_id'] == null ? null : json['user_id'] as String,
    );
  }

  @override
  String toString() {
    return '''FavoriteModel(
                favoriteId:$favoriteId,
favoriteUsersid:$favoriteUsersid,
favoriteItemsid:$favoriteItemsid,
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
itemsCate:$itemsCate,
userId:$userId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteModel &&
        other.runtimeType == runtimeType &&
        other.favoriteId == favoriteId &&
        other.favoriteUsersid == favoriteUsersid &&
        other.favoriteItemsid == favoriteItemsid &&
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
        other.itemsCate == itemsCate &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      favoriteId,
      favoriteUsersid,
      favoriteItemsid,
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
      userId,
    );
  }
}
