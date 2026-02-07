class AddressModel {
  final String? addressId;
  final String? usersid;
  final String? fullAddress;
  final String? landmark;
  final String? lat;
  final String? long;
  final String? title;
  final String? fullName;
  const AddressModel({
    this.addressId,
    this.usersid,
    this.fullAddress,
    this.landmark,
    this.lat,
    this.long,
    this.title,
    this.fullName,
  });
  AddressModel copyWith(
      {String? addressId,
      String? usersid,
      String? fullAddress,
      String? landmark,
      String? lat,
      String? long,
      String? title,
      String? fullName}) {
    return AddressModel(
        addressId: addressId ?? this.addressId,
        usersid: usersid ?? this.usersid,
        fullAddress: fullAddress ?? this.fullAddress,
        landmark: landmark ?? this.landmark,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        title: title ?? this.title,
        fullName: fullName ?? this.fullName);
  }

  Map<String, Object?> toJson() {
    return {
      'address_id': addressId,
      'address_usersid': usersid,
      'full_address': fullAddress,
      'address_landmark': landmark,
      'address_lat': lat,
      'address_long': long,
      'address_title': title,
      'full_name': fullName
    };
  }

  static AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel(
        addressId:
            json['address_id'] == null ? null : json['address_id'] as String,
        usersid: json['address_usersid'] == null
            ? null
            : json['address_usersid'] as String,
        fullAddress: json['full_address'] == null
            ? null
            : json['full_address'] as String,
        landmark: json['address_landmark'] == null
            ? null
            : json['address_landmark'] as String,
        lat:
            json['address_lat'] == null ? null : json['address_lat'] as String,
        long: json['address_long'] == null
            ? null
            : json['address_long'] as String,
        title: json['address_title'] == null
            ? null
            : json['address_title'] as String,
        fullName:
            json['full_name'] == null ? null : json['full_name'] as String);
  }

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
    return Object.hash(runtimeType, addressId, usersid, fullAddress,
        landmark, lat, long, title, fullName);
  }
}
