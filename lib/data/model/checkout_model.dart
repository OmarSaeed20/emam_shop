class CheckoutModel {
  final String? ordersId;
  final String? userid;
  final String? addressid;
  final String? ordersType;
  final String? deliveryPrice;
  final String? ordersPrice;
  final String? couponId;
  final String? paymentMethod;
  final String? ordersDatetime;
  const CheckoutModel({
    this.ordersId,
    this.userid,
    this.addressid,
    this.ordersType,
    this.deliveryPrice,
    this.ordersPrice,
    this.couponId,
    this.paymentMethod,
    this.ordersDatetime,
  });
  CheckoutModel copyWith({
    String? ordersId,
    String? userid,
    String? addressid,
    String? ordersType,
    String? deliveryPrice,
    String? ordersPrice,
    String? couponId,
    String? paymentMethod,
    String? ordersDatetime,
  }) {
    return CheckoutModel(
      ordersId: ordersId ?? this.ordersId,
      userid: userid ?? this.userid,
      addressid: addressid ?? this.addressid,
      ordersType: ordersType ?? this.ordersType,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      ordersPrice: ordersPrice ?? this.ordersPrice,
      couponId: couponId ?? this.couponId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      ordersDatetime: ordersDatetime ?? this.ordersDatetime,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'orders_id': ordersId,
      'orders_userid': userid,
      'orders_addressid': addressid,
      'orders_type': ordersType,
      'orders_price_delivery': deliveryPrice,
      'orders_price': ordersPrice,
      'orders_coupon': couponId,
      'orders_payment_method': paymentMethod,
      'orders_datetime': ordersDatetime
    };
  }

  static CheckoutModel fromJson(Map<String, Object?> json) {
    return CheckoutModel(
        ordersId:
            json['orders_id'] == null ? null : json['orders_id'] as String,
        userid: json['orders_userid'] == null
            ? null
            : json['orders_userid'] as String,
        addressid: json['orders_addressid'] == null
            ? null
            : json['orders_addressid'] as String,
        ordersType:
            json['orders_type'] == null ? null : json['orders_type'] as String,
        deliveryPrice: json['orders_price_delivery'] == null
            ? null
            : json['orders_price_delivery'] as String,
        ordersPrice: json['orders_price'] == null
            ? null
            : json['orders_price'] as String,
        couponId: json['orders_coupon'] == null
            ? null
            : json['orders_coupon'] as String,
        paymentMethod: json['orders_payment_method'] == null
            ? null
            : json['orders_payment_method'] as String,
        ordersDatetime: json['orders_datetime'] == null
            ? null
            : json['orders_datetime'] as String);
  }

  @override
  String toString() {
    return '''CheckoutModel(
                ordersId:$ordersId,
ordersUserid:$userid,
ordersAddressid:$addressid,
ordersType:$ordersType,
ordersPriceDelivery:$deliveryPrice,
ordersPrice:$ordersPrice,
ordersCoupon:$couponId,
ordersPaymentMethod:$paymentMethod,
ordersDatetime:$ordersDatetime
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CheckoutModel &&
        other.runtimeType == runtimeType &&
        other.ordersId == ordersId &&
        other.userid == userid &&
        other.addressid == addressid &&
        other.ordersType == ordersType &&
        other.deliveryPrice == deliveryPrice &&
        other.ordersPrice == ordersPrice &&
        other.couponId == couponId &&
        other.paymentMethod == paymentMethod &&
        other.ordersDatetime == ordersDatetime;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      ordersId,
      userid,
      addressid,
      ordersType,
      deliveryPrice,
      ordersPrice,
      couponId,
      paymentMethod,
      ordersDatetime,
    );
  }
}
