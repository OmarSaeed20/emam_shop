class AddressRequest {
  String usersid;
  String fullAddress;
  String landmark;
  String lat;
  String long;
  String title;
  String fullName;
  AddressRequest({
    required this.usersid,
    required this.fullAddress,
    required this.landmark,
    required this.lat,
    required this.long,
    required this.title,
    required this.fullName,
  });

  Map<String, Object?> toJson() {
    return {
      'address_usersid': usersid,
      'full_address': fullAddress,
      'address_landmark': landmark,
      'address_lat': lat,
      'address_long': long,
      'address_title': title,
      'full_name': fullName
    };
  }

  @override
  String toString() {
    return '''AddressModel(
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
    return other is AddressRequest &&
        other.runtimeType == runtimeType &&
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
    return Object.hash(runtimeType, usersid, fullAddress, landmark, lat, long,
        title, fullName);
  }
}
