import 'package:ecommerce/index.dart';

extension UserResponseMaper on UserModel? {
  UserModel toDomain() {
    return UserModel(
      id: this?.id.orEmpty() ?? AppStrings.empty,
      email: this?.email.orEmpty() ?? AppStrings.empty,
      phone: this?.phone.orEmpty() ?? AppStrings.empty,
      profileImg: this?.profileImg.orEmpty() ?? AppStrings.empty,
      userName: this?.userName.orEmpty() ?? AppStrings.empty,
      dateCreate: this?.dateCreate.orEmpty() ?? AppStrings.empty,
    );
  }
}
