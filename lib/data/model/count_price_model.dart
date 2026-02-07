class CountPriceModel {
  final String? totalprice;
  final String? savingPrice;
  final String? totaldiscount;
  final String? totalcount;
  final String? totalitems;
  const CountPriceModel(
      {this.totalprice,
      this.savingPrice,
      this.totaldiscount,
      this.totalcount,
      this.totalitems});
  CountPriceModel copyWith(
      {String? totalprice,
      String? savingPrice,
      String? totaldiscount,
      String? totalcount,
      String? totalitems}) {
    return CountPriceModel(
        totalprice: totalprice ?? this.totalprice,
        savingPrice: savingPrice ?? this.savingPrice,
        totaldiscount: totaldiscount ?? this.totaldiscount,
        totalcount: totalcount ?? this.totalcount,
        totalitems: totalitems ?? this.totalitems);
  }

  Map<String, Object?> toJson() {
    return {
      'totalprice': totalprice,
      'savingprice': savingPrice,
      'totaldiscount': totaldiscount,
      'totalcount': totalcount,
      'totalitems': totalitems
    };
  }

  static CountPriceModel fromJson(Map<String, Object?> json) {
    return CountPriceModel(
        totalprice:
            json['totalprice'] == null ? null : json['totalprice'] as String,
        savingPrice:
            json['savingprice'] == null ? null : json['savingprice'] as String,
        totaldiscount: json['totaldiscount'] == null
            ? null
            : json['totaldiscount'] as String,
        totalcount:
            json['totalcount'] == null ? null : json['totalcount'] as String,
        totalitems:
            json['totalitems'] == null ? null : json['totalitems'] as String);
  }

  @override
  String toString() {
    return '''CountPriceModel(
                totalprice:$totalprice,
savingprice:$savingPrice,
totaldiscount:$totaldiscount,
totalcount:$totalcount,
totalitems:$totalitems
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CountPriceModel &&
        other.runtimeType == runtimeType &&
        other.totalprice == totalprice &&
        other.savingPrice == savingPrice &&
        other.totaldiscount == totaldiscount &&
        other.totalcount == totalcount &&
        other.totalitems == totalitems;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalprice, savingPrice, totaldiscount,
        totalcount, totalitems);
  }
}
