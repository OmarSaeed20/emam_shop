class UserModel {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final String? userPhone;
  final String? userVerfiycode;
  final String? userApprove;
  final String? userCreate;
  const UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userPhone,
    this.userVerfiycode,
    this.userApprove,
    this.userCreate,
  });
  UserModel copyWith({
    String? userId,
    String? userName,
    String? userEmail,
    String? userPassword,
    String? userPhone,
    String? userVerfiycode,
    String? userApprove,
    String? userCreate,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
      userPhone: userPhone ?? this.userPhone,
      userVerfiycode: userVerfiycode ?? this.userVerfiycode,
      userApprove: userApprove ?? this.userApprove,
      userCreate: userCreate ?? this.userCreate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_phone': userPhone,
      'user_verfiycode': userVerfiycode,
      'user_approve': userApprove,
      'user_create': userCreate
    };
  }

  static UserModel fromJson(Map<String, Object?> json) {
    return UserModel(
      userId: json['user_id'] == null ? null : json['user_id'] as String,
      userName: json['user_name'] == null ? null : json['user_name'] as String,
      userEmail:
          json['user_email'] == null ? null : json['user_email'] as String,
      userPassword: json['user_password'] == null
          ? null
          : json['user_password'] as String,
      userPhone:
          json['user_phone'] == null ? null : json['user_phone'] as String,
      userVerfiycode: json['user_verfiycode'] == null
          ? null
          : json['user_verfiycode'] as String,
      userApprove:
          json['user_approve'] == null ? null : json['user_approve'] as String,
      userCreate:
          json['user_create'] == null ? null : json['user_create'] as String,
    );
  }

  @override
  String toString() {
    return '''UserModel(
                userId:$userId,
userName:$userName,
userEmail:$userEmail,
userPassword:$userPassword,
userPhone:$userPhone,
userVerfiycode:$userVerfiycode,
userApprove:$userApprove,
userCreate:$userCreate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        other.runtimeType == runtimeType &&
        other.userId == userId &&
        other.userName == userName &&
        other.userEmail == userEmail &&
        other.userPassword == userPassword &&
        other.userPhone == userPhone &&
        other.userVerfiycode == userVerfiycode &&
        other.userApprove == userApprove &&
        other.userCreate == userCreate;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      userId,
      userName,
      userEmail,
      userPassword,
      userPhone,
      userVerfiycode,
      userApprove,
      userCreate,
    );
  }
}
