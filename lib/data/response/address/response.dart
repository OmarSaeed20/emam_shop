import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "address_id")
  String? addressId;
  @JsonKey(name: "address_usersid")
  String? usersid;
  @JsonKey(name: "full_address")
  String? fullAddress;
  @JsonKey(name: "address_landmark")
  String? landmark;
  @JsonKey(name: "address_lat")
  String? lat;
  @JsonKey(name: "address_long")
  String? long;
  @JsonKey(name: "address_title")
  String? title;
  @JsonKey(name: "full_name")
  String? fullName;

  AddressResponse(this.addressId, this.usersid, this.fullAddress, this.landmark,
      this.lat, this.long, this.title, this.fullName);

  // from json
  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}
