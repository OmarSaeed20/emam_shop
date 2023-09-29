import 'package:ecommerce/data/response/cart/cart_response.dart';
import 'package:ecommerce/index.dart';

extension CartResponseMaper on CartResponse? {
  CartModel toDomain() {
    return CartModel(
      this?.descountPrice.orEmpty() ?? AppStrings.empty,
      this?.countitems.orEmpty() ?? AppStrings.empty,
      this?.cartId.orEmpty() ?? AppStrings.empty,
      this?.cartUsersid.orEmpty() ?? AppStrings.empty,
      this?.cartItemsid.orEmpty() ?? AppStrings.empty,
      this?.itemsId.orEmpty() ?? AppStrings.empty,
      this?.itemsName.orEmpty() ?? AppStrings.empty,
      this?.itemsNameAr.orEmpty() ?? AppStrings.empty,
      this?.itemsDesc.orEmpty() ?? AppStrings.empty,
      this?.itemsDessAr.orEmpty() ?? AppStrings.empty,
      this?.itemsImage.orEmpty() ?? AppStrings.empty,
      this?.itemsCount.orEmpty() ?? AppStrings.empty,
      this?.itemsActive.orEmpty() ?? AppStrings.empty,
      this?.itemsPrice.orEmpty() ?? AppStrings.empty,
      this?.itemsDiscount.orEmpty() ?? AppStrings.empty,
      this?.itemsData.orEmpty() ?? AppStrings.empty,
      this?.itemsCate.orEmpty() ?? AppStrings.empty,
    );
  }
}
