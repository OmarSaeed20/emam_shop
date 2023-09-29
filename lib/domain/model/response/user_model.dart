class UserModel {
  final String? id;
  final String? userName;
  final String? profileImg;
  final String? email;
  final String? phone;
  final String? dateCreate;
  const UserModel({
    this.id,
    this.userName,
    this.profileImg,
    this.email,
    this.phone,
    this.dateCreate,
  });
  UserModel copyWith({
    String? id,
    String? userName,
    String? profileImg,
    String? email,
    String? password,
    String? phone,
    String? userVerfiycode,
    String? userApprove,
    String? dateCreate,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      profileImg: profileImg ?? this.profileImg,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dateCreate: dateCreate ?? this.dateCreate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'user_id': id,
      'user_name': userName,
      'user_image': profileImg,
      'user_email': email,
      'user_phone': phone,
      'user_create': dateCreate
    };
  }

  static UserModel fromJson(Map<String, Object?> json) {
    return UserModel(
        id: json['user_id'] == null ? null : json['user_id'] as String,
        userName:
            json['user_name'] == null ? null : json['user_name'] as String,
        profileImg:
            json['user_image'] == null ? null : json['user_image'] as String,
        email: json['user_email'] == null ? null : json['user_email'] as String,
        phone: json['user_phone'] == null ? null : json['user_phone'] as String,
        dateCreate:
            json['user_create'] == null ? null : json['user_create'] as String);
  }

  @override
  String toString() {
    return '''UserModel(
                id:$id,
userName:$userName,
profileImg:$profileImg,
email:$email,
phone:$phone,
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.userName == userName &&
        other.profileImg == profileImg &&
        other.email == email &&
        other.phone == phone &&
        other.dateCreate == dateCreate;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, userName, profileImg, email, phone, dateCreate);
  }
}
