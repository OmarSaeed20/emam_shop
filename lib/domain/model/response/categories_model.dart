class CategoriesModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? datatime;
  final String? image;
  const CategoriesModel({
    this.id,
    this.name,
    this.nameAr,
    this.datatime,
    this.image,
  });
  CategoriesModel copyWith({
    String? id,
    String? name,
    String? nameAr,
    String? datatime,
    String? image,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      datatime: datatime ?? this.datatime,
      image: image ?? this.image,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'categories_id': id,
      'categories_name': name,
      'categories_name_ar': nameAr,
      'categories_datatime': datatime,
      'categories_image': image
    };
  }

  static CategoriesModel fromJson(Map<String, Object?> json) {
    return CategoriesModel(
        id: json['categories_id'] == null
            ? null
            : json['categories_id'] as String,
        name: json['categories_name'] == null
            ? null
            : json['categories_name'] as String,
        nameAr: json['categories_name_ar'] == null
            ? null
            : json['categories_name_ar'] as String,
        datatime: json['categories_datatime'] == null
            ? null
            : json['categories_datatime'] as String,
        image: json['categories_image'] == null
            ? null
            : json['categories_image'] as String);
  }

  @override
  String toString() {
    return '''CategoriesModel(
                id:$id,
name:$name,
nameAr:$nameAr,
datatime:$datatime,
image:$image
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.datatime == datatime &&
        other.image == image;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, nameAr, datatime, image);
  }
}
