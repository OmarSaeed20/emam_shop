class ItemsModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? descreption;
  final String? descreptionAr;
  final String? image;
  final String? itemsCount;
  final String? activeUnits;
  final String? price;
  final String? discount;
  final String? dateCereate;
  final String? itemsCate;
  final String? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesDatatime;
  final String? categoriesImage;
  const ItemsModel({
    this.id,
    this.name,
    this.nameAr,
    this.descreption,
    this.descreptionAr,
    this.image,
    this.itemsCount,
    this.activeUnits,
    this.price,
    this.discount,
    this.dateCereate,
    this.itemsCate,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDatatime,
    this.categoriesImage,
  });
  ItemsModel copyWith({
    String? id,
    String? name,
    String? nameAr,
    String? descreption,
    String? descreptionAr,
    String? image,
    String? itemsCount,
    String? activeUnits,
    String? price,
    String? discount,
    String? dateCereate,
    String? itemsCate,
    String? categoriesId,
    String? categoriesName,
    String? categoriesNameAr,
    String? categoriesDatatime,
    String? categoriesImage,
  }) {
    return ItemsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameAr: nameAr ?? this.nameAr,
        descreption: descreption ?? this.descreption,
        descreptionAr: descreptionAr ?? this.descreptionAr,
        image: image ?? this.image,
        itemsCount: itemsCount ?? this.itemsCount,
        activeUnits: activeUnits ?? this.activeUnits,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        dateCereate: dateCereate ?? this.dateCereate,
        itemsCate: itemsCate ?? this.itemsCate,
        categoriesId: categoriesId ?? this.categoriesId,
        categoriesName: categoriesName ?? this.categoriesName,
        categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
        categoriesDatatime: categoriesDatatime ?? this.categoriesDatatime,
        categoriesImage: categoriesImage ?? this.categoriesImage);
  }

  Map<String, Object?> toJson() {
    return {
      'items_id': id,
      'items_name': name,
      'items_name_ar': nameAr,
      'items_desc': descreption,
      'items_dess_ar': descreptionAr,
      'items_image': image,
      'items_count': itemsCount,
      'items_active': activeUnits,
      'items_price': price,
      'items_discount': discount,
      'items_data': dateCereate,
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
        id: json['items_id'] == null ? null : json['items_id'] as String,
        name: json['items_name'] == null ? null : json['items_name'] as String,
        nameAr: json['items_name_ar'] == null
            ? null
            : json['items_name_ar'] as String,
        descreption:
            json['items_desc'] == null ? null : json['items_desc'] as String,
        descreptionAr: json['items_dess_ar'] == null
            ? null
            : json['items_dess_ar'] as String,
        image:
            json['items_image'] == null ? null : json['items_image'] as String,
        itemsCount:
            json['items_count'] == null ? null : json['items_count'] as String,
        activeUnits: json['items_active'] == null
            ? null
            : json['items_active'] as String,
        price:
            json['items_price'] == null ? null : json['items_price'] as String,
        discount: json['items_discount'] == null
            ? null
            : json['items_discount'] as String,
        dateCereate:
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
                id:$id,
name:$name,
nameAr:$nameAr,
descreption:$descreption,
descreptionAr:$descreptionAr,
image:$image,
itemsCount:$itemsCount,
activeUnits:$activeUnits,
price:$price,
discount:$discount,
dateCereate:$dateCereate,
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
        other.id == id &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.descreption == descreption &&
        other.descreptionAr == descreptionAr &&
        other.image == image &&
        other.itemsCount == itemsCount &&
        other.activeUnits == activeUnits &&
        other.price == price &&
        other.discount == discount &&
        other.dateCereate == dateCereate &&
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
        id,
        name,
        nameAr,
        descreption,
        descreptionAr,
        image,
        itemsCount,
        activeUnits,
        price,
        discount,
        dateCereate,
        itemsCate,
        categoriesId,
        categoriesName,
        categoriesNameAr,
        categoriesDatatime,
        categoriesImage);
  }
}
