class OnBoardingModel {
  final String? title;
  final String? supTitle;
  final String? image;
  const OnBoardingModel({this.title, this.supTitle, this.image});
  OnBoardingModel copyWith({String? title, String? supTitle, String? image}) {
    return OnBoardingModel(
        title: title ?? this.title,
        supTitle: supTitle ?? this.supTitle,
        image: image ?? this.image);
  }

  Map<String, Object?> toJson() {
    return {'title': title, 'supTitle': supTitle, 'image': image};
  }

  static OnBoardingModel fromJson(Map<String, Object?> json) {
    return OnBoardingModel(
        title: json['title'] == null ? null : json['title'] as String,
        supTitle: json['supTitle'] == null ? null : json['supTitle'] as String,
        image: json['image'] == null ? null : json['image'] as String);
  }

  @override
  String toString() {
    return '''OnBoardingModel(
                title:$title,
supTitle:$supTitle,
image:$image
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OnBoardingModel &&
        other.runtimeType == runtimeType &&
        other.title == title &&
        other.supTitle == supTitle &&
        other.image == image;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, title, supTitle, image);
  }
}
