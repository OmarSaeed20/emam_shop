class ItemsModel {
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
  final String? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesDatatime;
  final String? categoriesImage;
  const ItemsModel({
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
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDatatime,
    this.categoriesImage,
  });
  ItemsModel copyWith(
      {String? itemsId,
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
      String? categoriesId,
      String? categoriesName,
      String? categoriesNameAr,
      String? categoriesDatatime,
      String? categoriesImage}) {
    return ItemsModel(
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
        categoriesId: categoriesId ?? this.categoriesId,
        categoriesName: categoriesName ?? this.categoriesName,
        categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
        categoriesDatatime: categoriesDatatime ?? this.categoriesDatatime,
        categoriesImage: categoriesImage ?? this.categoriesImage);
  }

  Map<String, Object?> toJson() {
    return {
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
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_datatime': categoriesDatatime,
      'categories_image': categoriesImage
    };
  }

  static ItemsModel fromJson(Map<String, Object?> json) {
    return ItemsModel(
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
            json['items_cate'] == null ? null : json['items_cate'] as String,
        categoriesId: json['categories_id'] == null
            ? null
            : json['categories_id'] as String,
        categoriesName: json['categories_name'] == null
            ? null
            : json['categories_name'] as String,
        categoriesNameAr: json['categories_name_ar'] == null
            ? null
            : json['categories_name_ar'] as String,
        categoriesDatatime: json['categories_datatime'] == null
            ? null
            : json['categories_datatime'] as String,
        categoriesImage: json['categories_image'] == null
            ? null
            : json['categories_image'] as String);
  }

  @override
  String toString() {
    return '''ItemsModel(
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
categoriesId:$categoriesId,
categoriesName:$categoriesName,
categoriesNameAr:$categoriesNameAr,
categoriesDatatime:$categoriesDatatime,
categoriesImage:$categoriesImage
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ItemsModel &&
        other.runtimeType == runtimeType &&
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
        other.categoriesId == categoriesId &&
        other.categoriesName == categoriesName &&
        other.categoriesNameAr == categoriesNameAr &&
        other.categoriesDatatime == categoriesDatatime &&
        other.categoriesImage == categoriesImage;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
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
        categoriesId,
        categoriesName,
        categoriesNameAr,
        categoriesDatatime,
        categoriesImage);
  }
}
