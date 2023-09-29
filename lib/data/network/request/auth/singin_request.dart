class SignInRequest {
  final String email;
  final String password;
  const SignInRequest({required this.email, required this.password});

  Map<String, Object?> toJson() {
    return {'email': email, 'password': password};
  }

  static SignInRequest fromJson(Map<String, Object?> json) {
    return SignInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  @override
  String toString() {
    return '''SignInRequest(
                userEmail:$email,
userPassword:$password
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SignInRequest &&
        other.runtimeType == runtimeType &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, email, password);
  }
}
