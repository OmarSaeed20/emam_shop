import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  const SignUpModel({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
  });
  SignUpModel copyWith({
    String? userName,
    String? userEmail,
    String? userPassword,
    String? userPhone,
  }) {
    return SignUpModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
      userPhone: userPhone ?? this.userPhone,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'username': userName,
      'email': userEmail,
      'password': userPassword,
      'phone': userPhone,
    };
  }

  static SignUpModel fromJson(Map<String, Object?> json) {
    return SignUpModel(
      userName: json['username'] as String,
      userEmail: json['email'] as String,
      userPassword: json['password'] as String,
      userPhone: json['phone'] as String,
    );
  }

  @override
  String toString() {
    return '''SignUpModel( 
userName:$userName,
userEmail:$userEmail,
userPassword:$userPassword,
userPhone:$userPhone, 
    ) ''';
  }

 /*  @override
  bool operator ==(Object other) {
    return other is SignUpModel &&
        other.runtimeType == runtimeType &&
        other.userName == userName &&
        other.userEmail == userEmail &&
        other.userPassword == userPassword &&
        other.userPhone == userPhone;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      userName,
      userEmail,
      userPassword,
      userPhone,
    );
  } */

  @override
  List<Object?> get props => [
        userName,
        userEmail,
        userPassword,
        userPhone,
      ];
      
  @override
  bool get stringify => true;
}
