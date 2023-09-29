// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['cart_id'] as String?,
      json['items_data'] as String?,
      json['items_desc'] as String?,
      json['items_dess_ar'] as String?,
      json['items_discount'] as String?,
      json['items_id'] as String?,
      json['items_image'] as String?,
      json['items_name'] as String?,
      json['items_name_ar'] as String?,
      json['items_price'] as String?,
      json['cart_itemsid'] as String?,
      json['cart_usersid'] as String?,
      json['countitems'] as String?,
      json['itemsprice'] as String?,
      json['items_active'] as String?,
      json['items_cate'] as String?,
      json['items_count'] as String?,
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'itemsprice': instance.descountPrice,
      'countitems': instance.countitems,
      'cart_id': instance.cartId,
      'cart_usersid': instance.cartUsersid,
      'cart_itemsid': instance.cartItemsid,
      'items_id': instance.itemsId,
      'items_name': instance.itemsName,
      'items_name_ar': instance.itemsNameAr,
      'items_desc': instance.itemsDesc,
      'items_dess_ar': instance.itemsDessAr,
      'items_image': instance.itemsImage,
      'items_count': instance.itemsCount,
      'items_active': instance.itemsActive,
      'items_price': instance.itemsPrice,
      'items_discount': instance.itemsDiscount,
      'items_data': instance.itemsData,
      'items_cate': instance.itemsCate,
    };
