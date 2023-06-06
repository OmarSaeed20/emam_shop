class MyOrdersModel {
  final String? ordersId;
  final String? userid;
  final String? addressid;
  final String? ordersType;
  final String? deliveryPrice;
  final String? ordersPrice;
  final String? totalprice;
  final String? couponId;
  final String? paymentMethod;
  final String? datetime;
  final String? status;

  const MyOrdersModel({
    this.ordersId,
    this.userid,
    this.addressid,
    this.ordersType,
    this.deliveryPrice,
    this.ordersPrice,
    this.totalprice,
    this.couponId,
    this.paymentMethod,
    this.datetime,
    this.status,
  });
  MyOrdersModel copyWith({
    String? ordersId,
    String? userid,
    String? addressid,
    String? ordersType,
    String? deliveryPrice,
    String? ordersPrice,
    String? totalprice,
    String? couponId,
    String? paymentMethod,
    String? datetime,
    String? status,
  }) {
    return MyOrdersModel(
      ordersId: ordersId ?? this.ordersId,
      userid: userid ?? this.userid,
      addressid: addressid ?? this.addressid,
      ordersType: ordersType ?? this.ordersType,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      ordersPrice: ordersPrice ?? this.ordersPrice,
      totalprice: totalprice ?? this.totalprice,
      couponId: couponId ?? this.couponId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      datetime: datetime ?? this.datetime,
      status: status ?? this.status,
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
      'orders_totalprice': totalprice,
      'orders_coupon': couponId,
      'orders_payment_method': paymentMethod,
      'orders_datetime': datetime,
      'orders_status': status,
    };
  }

  static MyOrdersModel fromJson(Map<String, Object?> json) {
    return MyOrdersModel(
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
        totalprice: json['orders_totalprice'] == null
            ? null
            : json['orders_totalprice'] as String,
        couponId: json['orders_coupon'] == null
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
            : json['orders_status'] as String);
  }

  @override
  String toString() {
    return '''MyOrdersModel(
                ordersId:$ordersId,
ordersUserid:$userid,
ordersAddressid:$addressid,
ordersType:$ordersType,
ordersPriceDelivery:$deliveryPrice,
ordersPrice:$ordersPrice,
ordersTotalprice:$totalprice,
ordersCoupon:$couponId,
ordersPaymentMethod:$paymentMethod,
ordersDatetime:$datetime,
ordersStatus:$status
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is MyOrdersModel &&
        other.runtimeType == runtimeType &&
        other.ordersId == ordersId &&
        other.userid == userid &&
        other.addressid == addressid &&
        other.ordersType == ordersType &&
        other.deliveryPrice == deliveryPrice &&
        other.ordersPrice == ordersPrice &&
        other.totalprice == totalprice &&
        other.couponId == couponId &&
        other.paymentMethod == paymentMethod &&
        other.datetime == datetime &&
        other.status == status;
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
      totalprice,
      couponId,
      paymentMethod,
      datetime,
      status,
    );
  }
}
