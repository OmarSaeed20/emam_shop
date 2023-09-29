// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      json['address_id'] as String?,
      json['address_usersid'] as String?,
      json['full_address'] as String?,
      json['address_landmark'] as String?,
      json['address_lat'] as String?,
      json['address_long'] as String?,
      json['address_title'] as String?,
      json['full_name'] as String?,
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'address_usersid': instance.usersid,
      'full_address': instance.fullAddress,
      'address_landmark': instance.landmark,
      'address_lat': instance.lat,
      'address_long': instance.long,
      'address_title': instance.title,
      'full_name': instance.fullName,
    };
