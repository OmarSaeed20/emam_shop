class OrdersModel {
  final String? id;
  final String? userId;
  final String? ordersAddressid;
  final String? type;
  final String? deliveryPrice;
  final String? price;
  final String? totalPrice;
  final String? ordersCoupon;
  final String? paymentMethod;
  final String? datetime;
  final String? status;
  final String? addressId;
  final String? addressUsersid;
  final String? fullAddress;
  final String? addressLandmark;
  final String? addressLat;
  final String? addressLong;
  final String? addressTitle;

  final String? fullName;
  const OrdersModel({
    this.id,
    this.userId,
    this.ordersAddressid,
    this.type,
    this.deliveryPrice,
    this.price,
    this.totalPrice,
    this.ordersCoupon,
    this.paymentMethod,
    this.datetime,
    this.status,
    this.addressId,
    this.addressUsersid,
    this.fullAddress,
    this.addressLandmark,
    this.addressLat,
    this.addressLong,
    this.addressTitle,
    this.fullName,
  });
  OrdersModel copyWith({
    String? id,
    String? userId,
    String? ordersAddressid,
    String? type,
    String? deliveryPrice,
    String? price,
    String? totalPrice,
    String? ordersCoupon,
    String? paymentMethod,
    String? datetime,
    String? status,
    String? addressId,
    String? addressUsersid,
    String? fullAddress,
    String? addressLandmark,
    String? addressLat,
    String? addressLong,
    String? addressTitle,
    String? fullName,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      ordersAddressid: ordersAddressid ?? this.ordersAddressid,
      type: type ?? this.type,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
      ordersCoupon: ordersCoupon ?? this.ordersCoupon,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      datetime: datetime ?? this.datetime,
      status: status ?? this.status,
      addressId: addressId ?? this.addressId,
      addressUsersid: addressUsersid ?? this.addressUsersid,
      fullAddress: fullAddress ?? this.fullAddress,
      addressLandmark: addressLandmark ?? this.addressLandmark,
      addressLat: addressLat ?? this.addressLat,
      addressLong: addressLong ?? this.addressLong,
      addressTitle: addressTitle ?? this.addressTitle,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'orders_id': id,
      'orders_userid': userId,
      'orders_addressid': ordersAddressid,
      'orders_type': type,
      'orders_price_delivery': deliveryPrice,
      'orders_price': price,
      'orders_totalprice': totalPrice,
      'orders_coupon': ordersCoupon,
      'orders_payment_method': paymentMethod,
      'orders_datetime': datetime,
      'orders_status': status,
      'address_id': addressId,
      'address_usersid': addressUsersid,
      'full_address': fullAddress,
      'address_landmark': addressLandmark,
      'address_lat': addressLat,
      'address_long': addressLong,
      'address_title': addressTitle,
      'full_name': fullName
    };
  }

  static OrdersModel fromJson(Map<String, Object?> json) {
    return OrdersModel(
      id: json['orders_id'] == null ? null : json['orders_id'] as String,
      userId: json['orders_userid'] == null
          ? null
          : json['orders_userid'] as String,
      ordersAddressid: json['orders_addressid'] == null
          ? null
          : json['orders_addressid'] as String,
      type: json['orders_type'] == null ? null : json['orders_type'] as String,
      deliveryPrice: json['orders_price_delivery'] == null
          ? null
          : json['orders_price_delivery'] as String,
      price:
          json['orders_price'] == null ? null : json['orders_price'] as String,
      totalPrice: json['orders_totalprice'] == null
          ? null
          : json['orders_totalprice'] as String,
      ordersCoupon: json['orders_coupon'] == null
          ? null
          : json['orders_coupon'] as String,
      paymentMethod: json['orders_payment_method'] == null
          ? null
          : json['orders_payment_method'] as String,
      datetime: json['orders_datetime'] == null
          ? null
          : json['orders_datetime'] as String,
      status: json['orders_status'] == null
          ? null
          : json['orders_status'] as String,
      addressId:
          json['address_id'] == null ? null : json['address_id'] as String,
      addressUsersid: json['address_usersid'] == null
          ? null
          : json['address_usersid'] as String,
      fullAddress:
          json['full_address'] == null ? null : json['full_address'] as String,
      addressLandmark: json['address_landmark'] == null
          ? null
          : json['address_landmark'] as String,
      addressLat:
          json['address_lat'] == null ? null : json['address_lat'] as String,
      addressLong:
          json['address_long'] == null ? null : json['address_long'] as String,
      addressTitle: json['address_title'] == null
          ? null
          : json['address_title'] as String,
      fullName: json['full_name'] == null ? null : json['full_name'] as String,
    );
  }

  @override
  String toString() {
    return '''MyOrdersModel(
                id:$id,
userId:$userId,
ordersAddressid:$ordersAddressid,
type:$type,
deliveryPrice:$deliveryPrice,
price:$price,
totalPrice:$totalPrice,
ordersCoupon:$ordersCoupon,
paymentMethod:$paymentMethod,
datetime:$datetime,
status:$status,
addressId:$addressId,
addressUsersid:$addressUsersid,
fullAddress:$fullAddress,
addressLandmark:$addressLandmark,
addressLat:$addressLat,
addressLong:$addressLong,
addressTitle:$addressTitle,
fullName:$fullName
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.userId == userId &&
        other.ordersAddressid == ordersAddressid &&
        other.type == type &&
        other.deliveryPrice == deliveryPrice &&
        other.price == price &&
        other.totalPrice == totalPrice &&
        other.ordersCoupon == ordersCoupon &&
        other.paymentMethod == paymentMethod &&
        other.datetime == datetime &&
        other.status == status &&
        other.addressId == addressId &&
        other.addressUsersid == addressUsersid &&
        other.fullAddress == fullAddress &&
        other.addressLandmark == addressLandmark &&
        other.addressLat == addressLat &&
        other.addressLong == addressLong &&
        other.addressTitle == addressTitle &&
        other.fullName == fullName;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      userId,
      ordersAddressid,
      type,
      deliveryPrice,
      price,
      totalPrice,
      ordersCoupon,
      paymentMethod,
      datetime,
      status,
      addressId,
      addressUsersid,
      fullAddress,
      addressLandmark,
      addressLat,
      addressLong,
      addressTitle,
      fullName,
    );
  }
}
