class ItemsModel {
  final String? itemsId;
  final String? name;
  final String? nameAr;
  final String? describtion;
  final String? describtionAr;
  final String? itemsImage;
  final String? itemsCount;
  final String? itemsActive;
  final String? price;
  final String? discount;
  final String? dateCreate;
  final String? itemsCate;
  const ItemsModel({
    this.itemsId,
    this.name,
    this.nameAr,
    this.describtion,
    this.describtionAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.price,
    this.discount,
    this.dateCreate,
    this.itemsCate,
  });
  ItemsModel copyWith({
    String? itemsId,
    String? name,
    String? nameAr,
    String? describtion,
    String? describtionAr,
    String? itemsImage,
    String? itemsCount,
    String? itemsActive,
    String? price,
    String? discount,
    String? dateCreate,
    String? itemsCate,
  }) {
    return ItemsModel(
      itemsId: itemsId ?? this.itemsId,
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      describtion: describtion ?? this.describtion,
      describtionAr: describtionAr ?? this.describtionAr,
      itemsImage: itemsImage ?? this.itemsImage,
      itemsCount: itemsCount ?? this.itemsCount,
      itemsActive: itemsActive ?? this.itemsActive,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      dateCreate: dateCreate ?? this.dateCreate,
      itemsCate: itemsCate ?? this.itemsCate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'items_id': itemsId,
      'items_name': name,
      'items_name_ar': nameAr,
      'items_desc': describtion,
      'items_dess_ar': describtionAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': price,
      'items_discount': discount,
      'items_data': dateCreate,
      'items_cate': itemsCate,
    };
  }

  static ItemsModel fromJson(Map<String, Object?> json) {
    return ItemsModel(
      itemsId: json['items_id'] == null ? null : json['items_id'] as String,
      name: json['items_name'] == null ? null : json['items_name'] as String,
      nameAr: json['items_name_ar'] == null
          ? null
          : json['items_name_ar'] as String,
      describtion:
          json['items_desc'] == null ? null : json['items_desc'] as String,
      describtionAr: json['items_dess_ar'] == null
          ? null
          : json['items_dess_ar'] as String,
      itemsImage:
          json['items_image'] == null ? null : json['items_image'] as String,
      itemsCount:
          json['items_count'] == null ? null : json['items_count'] as String,
      itemsActive:
          json['items_active'] == null ? null : json['items_active'] as String,
      price: json['items_price'] == null ? null : json['items_price'] as String,
      discount: json['items_discount'] == null
          ? null
          : json['items_discount'] as String,
      dateCreate:
          json['items_data'] == null ? null : json['items_data'] as String,
      itemsCate:
          json['items_cate'] == null ? null : json['items_cate'] as String,
    );
  }

  @override
  String toString() {
    return '''ItemsModel(
                itemsId:$itemsId,
name:$name,
nameAr:$nameAr,
describtion:$describtion,
describtionAr:$describtionAr,
itemsImage:$itemsImage,
itemsCount:$itemsCount,
itemsActive:$itemsActive,
price:$price,
discount:$discount,
dateCreate:$dateCreate,
itemsCate:$itemsCate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ItemsModel &&
        other.runtimeType == runtimeType &&
        other.itemsId == itemsId &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.describtion == describtion &&
        other.describtionAr == describtionAr &&
        other.itemsImage == itemsImage &&
        other.itemsCount == itemsCount &&
        other.itemsActive == itemsActive &&
        other.price == price &&
        other.discount == discount &&
        other.dateCreate == dateCreate &&
        other.itemsCate == itemsCate;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      itemsId,
      name,
      nameAr,
      describtion,
      describtionAr,
      itemsImage,
      itemsCount,
      itemsActive,
      price,
      discount,
      dateCreate,
      itemsCate,
    );
  }
}
