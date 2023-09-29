class CheckoutResquest {
  final String usersId;
  final String addressId;
  final String couponId;
  final String couponDicount;
  final String deliveryPrice;
  final String ordersPrice;
  final String ordersType;
  final String paymentMethod;
  const CheckoutResquest({
    required this.usersId,
    required this.addressId,
    required this.couponId,
    required this.couponDicount,
    required this.deliveryPrice,
    required this.ordersPrice,
    required this.ordersType,
    required this.paymentMethod,
  });

  Map<String, Object?> toJson() {
    return {
      'users_id': usersId,
      'address_id': addressId,
      'coupon_id': couponId,
      'coupon_dicount': couponDicount,
      'delivery_price': deliveryPrice,
      'orders_price': ordersPrice,
      'orders_type': ordersType,
      'payment_method': paymentMethod
    };
  }

  @override
  String toString() {
    return '''CheckoutResquest(
                usersId:$usersId,
addressId:$addressId,
couponId:$couponId,
couponDicount:$couponDicount,
deliveryPrice:$deliveryPrice,
ordersPrice:$ordersPrice,
ordersType:$ordersType,
paymentMethod:$paymentMethod
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CheckoutResquest &&
        other.runtimeType == runtimeType &&
        other.usersId == usersId &&
        other.addressId == addressId &&
        other.couponId == couponId &&
        other.couponDicount == couponDicount &&
        other.deliveryPrice == deliveryPrice &&
        other.ordersPrice == ordersPrice &&
        other.ordersType == ordersType &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, usersId, addressId, couponId, couponDicount,
        deliveryPrice, ordersPrice, ordersType, paymentMethod);
  }
}
