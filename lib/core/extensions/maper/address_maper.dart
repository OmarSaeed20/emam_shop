import '/index.dart';

extension AddressResponseMaper on AddressResponse? {
  AddressModel toDomain() {
    return AddressModel(
      this?.addressId.orEmpty() ?? AppStrings.empty,
      this?.usersid.orEmpty() ?? AppStrings.empty,
      this?.fullAddress.orEmpty() ?? AppStrings.empty,
      this?.fullName.orEmpty() ?? AppStrings.empty,
      this?.landmark.orEmpty() ?? AppStrings.empty,
      this?.lat.orEmpty() ?? AppStrings.empty,
      this?.long.orEmpty() ?? AppStrings.empty,
      this?.title.orEmpty() ?? AppStrings.empty,
    );
  }
}
