class AddressModel {
  String addressId;
  String usersid;
  String fullAddress;
  String landmark;
  String lat;
  String long;
  String title;
  String fullName;
  AddressModel(
    this.addressId,
    this.usersid,
    this.fullAddress,
    this.landmark,
    this.lat,
    this.long,
    this.title,
    this.fullName,
  );
  @override
  String toString() {
    return '''AddressModel(
                addressId:$addressId,
usersid:$usersid,
fullAddress:$fullAddress,
landmark:$landmark,
lat:$lat,
long:$long,
title:$title,
fullName:$fullName
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AddressModel &&
        other.runtimeType == runtimeType &&
        other.addressId == addressId &&
        other.usersid == usersid &&
        other.fullAddress == fullAddress &&
        other.landmark == landmark &&
        other.lat == lat &&
        other.long == long &&
        other.title == title &&
        other.fullName == fullName;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, addressId, usersid, fullAddress, landmark,
        lat, long, title, fullName);
  }
}
