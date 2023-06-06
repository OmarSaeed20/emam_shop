calculatingPrice(String price, String dicount) {
  double oldprice = double.parse(price);
  double dicountprice = double.parse(dicount);
  double discount = oldprice - (oldprice * dicountprice) / 100;
  int endDicount = discount.toInt();
  return "$endDicount";
}
