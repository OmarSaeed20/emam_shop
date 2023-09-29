class CouponModel {
  final String? couponId;
  final String? couponName;
  final String? couponImage;
  final String? couponDiscount;
  final String? couponExpireDate;
  final String? couponCount;
  const CouponModel(
      {this.couponId,
      this.couponName,
      this.couponImage,
      this.couponDiscount,
      this.couponExpireDate,
      this.couponCount});
  CouponModel copyWith(
      {String? couponId,
      String? couponName,
      String? couponImage,
      String? couponDiscount,
      String? couponExpireDate,
      String? couponCount}) {
    return CouponModel(
        couponId: couponId ?? this.couponId,
        couponName: couponName ?? this.couponName,
        couponImage: couponImage ?? this.couponImage,
        couponDiscount: couponDiscount ?? this.couponDiscount,
        couponExpireDate: couponExpireDate ?? this.couponExpireDate,
        couponCount: couponCount ?? this.couponCount);
  }

  Map<String, Object?> toJson() {
    return {
      'coupon_id': couponId,
      'coupon_name': couponName,
      'coupon_image': couponImage,
      'coupon_discount': couponDiscount,
      'coupon_expire_date': couponExpireDate,
      'coupon_count': couponCount
    };
  }

  static CouponModel fromJson(Map<String, Object?> json) {
    return CouponModel(
        couponId:
            json['coupon_id'] == null ? null : json['coupon_id'] as String,
        couponName:
            json['coupon_name'] == null ? null : json['coupon_name'] as String,
        couponImage: json['coupon_image'] == null
            ? null
            : json['coupon_image'] as String,
        couponDiscount: json['coupon_discount'] == null
            ? null
            : json['coupon_discount'] as String,
        couponExpireDate: json['coupon_expire_date'] == null
            ? null
            : json['coupon_expire_date'] as String,
        couponCount: json['coupon_count'] == null
            ? null
            : json['coupon_count'] as String);
  }

  @override
  String toString() {
    return '''CouponModel(
                couponId:$couponId,
couponName:$couponName,
couponImage:$couponImage,
couponDiscount:$couponDiscount,
couponExpireDate:$couponExpireDate,
couponCount:$couponCount
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CouponModel &&
        other.runtimeType == runtimeType &&
        other.couponId == couponId &&
        other.couponName == couponName &&
        other.couponImage == couponImage &&
        other.couponDiscount == couponDiscount &&
        other.couponExpireDate == couponExpireDate &&
        other.couponCount == couponCount;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, couponId, couponName, couponImage,
        couponDiscount, couponExpireDate, couponCount);
  }
}
