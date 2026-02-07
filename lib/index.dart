library index;

// packages

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get/get.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:flutter_animate/flutter_animate.dart';

//  Controller

export "controller/onboarding_controller.dart";

export 'controller/auth/signup_controller.dart';
export 'controller/auth/forget_controller.dart';
export 'controller/auth/phone_controller.dart';
export 'controller/auth/signin_controller.dart';
export 'controller/main_controller.dart';
export "controller/test_controller.dart";
export "controller/home_controller.dart";
export 'controller/items_controller.dart';
export 'controller/favorit_controller.dart';
export 'controller/cart_controller.dart';
export 'controller/setting_controller.dart';
export 'controller/address/address_controller.dart';
export 'controller/address/get_address_data_conreoller.dart';
export 'controller/coupon_controller.dart';
export 'controller/payment_controller.dart';
export 'controller/orders_controller.dart';

export "core/localization/locale_controller.dart";
export 'core/localization/locale.dart';
// repo
export 'data/api/api_client.dart';
export "data/repository/home_repo.dart";

export 'data/repository/auth_repo.dart';
export 'data/repository/items_repo.dart';
export 'data/repository/favorite_repo.dart';
export 'data/repository/cart_repo.dart';
export 'data/repository/address_repo.dart';
export 'data/repository/coupon_repo.dart';
export 'data/repository/my_orders_repo.dart';

export 'data/api/api_end_point.dart';

// model
export 'data/model/auth/user_model.dart';
export 'data/model/auth/signup_model.dart';
export 'data/model/categories_model.dart';
export 'data/model/items_model.dart';
export 'data/model/favorite_model.dart';
export 'data/model/cart_model.dart';
export 'data/model/count_price_model.dart';
export 'data/model/coupon_model.dart';
export 'data/model/address_model.dart';
export 'data/model/checkout_model.dart';
export 'data/model/my_orders_model.dart';

// helper
export 'routes/routes_helper.dart';
export 'data/datasource/locale/database_helper.dart';

//  screens

export 'view/screens/onboarding/onboarding_screen.dart';
export 'view/screens/auth/login/login_screen.dart';
export 'view/screens/splash/splash_screen.dart';
export 'view/screens/auth/wellcom/wellcom_screen.dart';
export 'view/screens/auth/register/sign_up_screen.dart';
export 'view/screens/auth/register/widget/text_form_signup_body.dart';
export 'view/screens/auth/phone/phone_screen.dart';
export 'view/screens/auth/forget_password/forget_password.dart';
export 'view/screens/auth/forget_password/reset_password.dart';
export 'view/screens/auth/verification/verification_screen.dart';
export 'view/screens/auth/register/verfiy_signup.dart';
export 'view/screens/main/main_screen.dart';
export 'view/screens/auth/forget_password/forget_verfiy_code.dart';
export 'view/screens/categorie/categories_screen.dart';
export 'view/screens/item/item_screen.dart';
export 'view/screens/home/home_screen.dart';
export 'view/screens/product_detailes/product_details_screen.dart';
export 'view/screens/favorite/favorite_screen.dart';
export 'view/screens/setting/setting_screen.dart';
export 'view/screens/cart/cart_screen.dart';
export 'view/screens/notification/notification_screen.dart';
export 'view/screens/coupon/coupon_screen.dart';
export 'view/screens/checkout/checkout_screen.dart';

// widget

export 'view/screens/splash/widget/splash_view_body.dart';
export 'view/screens/onboarding/widget/lang/choose_lang_screen.dart';
export 'view/screens/onboarding/widget/onboarding_body.dart';

export 'view/screens/auth/wellcom/widget/sign_with_body.dart';
export 'view/screens/auth/widget/sign_here_text.dart';
export 'view/screens/auth/login/widget/text_form_login_body.dart';
export 'view/screens/auth/widget/icon_and_text_back.dart';
export 'view/screens/auth/phone/widget/sign_phone_body.dart';
export 'view/screens/auth/widget/auth_logo_and_name.dart';
export 'view/screens/auth/widget/auth_title.dart';
export 'view/screens/auth/forget_password/widget/text_form_forg_pass_body.dart';
export 'view/screens/auth/verification/widget/pain_code_widget.dart';
export 'view/screens/auth/widget/screen_pick.dart';
export 'view/screens/auth/widget/verfiy_screen_header.dart';
export 'view/screens/auth/forget_password/widget/text_form_reset_pass_body.dart';
export 'view/screens/auth/widget/auth_app_bar.dart';

export 'view/screens/main/widget/main_material_button.dart';
export 'view/screens/main/widget/bottom_navigation_bar.dart';
export 'view/screens/home/widget/home_bonner.dart';
export 'view/screens/home/widget/categories_card.dart';
export 'view/screens/home/widget/home_app_bar.dart';
export 'view/screens/home/widget/welcome_user.dart';
export 'view/screens/home/widget/for_you_card.dart';
export 'view/screens/categorie/widget/card_stak_icon.dart';
export 'view/screens/categorie/widget/product_title.dart';
export 'view/screens/home/widget/search_bar.dart';
export 'view/screens/categorie/widget/product_card_body.dart';
export 'view/screens/categorie/widget/product_image.dart';
export 'view/screens/categorie/widget/product_grid_view.dart';
export 'view/screens/categorie/widget/list_tile_items.dart';
export 'view/screens/categorie/widget/discount_positioned.dart';
export 'view/screens/product_detailes/widget/plus_icon_btn.dart';
export 'view/screens/product_detailes/widget/product_detailes_img.dart';
export 'view/screens/product_detailes/widget/list_animated_contaier.dart';
export 'view/screens/product_detailes/widget/product_information.dart';
export 'view/screens/product_detailes/widget/similar_products.dart';
export 'view/screens/product_detailes/widget/bottom_navi_bar.dart';
export 'view/screens/product_detailes/widget/reviews_widget.dart';
export 'view/screens/setting/widget/user_profile_image.dart';
export 'view/screens/setting/widget/setting_header.dart';
export 'view/screens/setting/widget/setting_list_tile.dart';
export 'view/screens/address/my_address_screen.dart';
export 'view/screens/address/add_address_screen.dart';
export 'view/screens/edit_profile/edit_profile_page.dart';
export 'view/screens/setting/pages/help_support/help_support_page.dart';
export 'view/screens/orders/my_orders_page.dart';
export 'view/screens/payment/paymen_page.dart';
export 'view/screens/setting/pages/report/report_page.dart';
export 'view/screens/setting/pages/terms_policies/terms_policies_page.dart';
export 'view/screens/cart/widget/bottom_sheet.dart';
export 'view/screens/cart/widget/cart_and_favorie_card.dart';
export 'view/screens/cart/widget/checkout_list_tile.dart';
export 'view/screens/address/widget/bottm_navi_bar.dart';
export 'view/screens/address/widget/bottom_navi_address_edit.dart';
export 'view/screens/coupon/widget/coupon_appbar.dart';
export 'view/screens/checkout/widget/order_product.dart';
export 'view/screens/checkout/widget/order_details.dart';
export 'view/screens/checkout/widget/chose_payment_type.dart';
export 'view/screens/checkout/widget/chose_dilvery_type.dart';
export 'view/screens/checkout/widget/select_user_data.dart';
export 'view/screens/checkout/widget/bottom__navi_bar_checkout.dart';

// core

///// constant

export 'data/model/onboarding/onboarding_model.dart';
export 'core/constant/app_strings.dart';
export 'core/constant/dimensions.dart';
export 'core/constant/static.dart';
export 'core/constant/app_images.dart';
export 'core/constant/app_color.dart';
export 'core/constant/app_dialog.dart';
export 'core/function/handling_response.dart';
export 'core/function/translate_database.dart';
export 'core/function/check_model.dart';
export 'core/function/convert_date.dart';

export 'data/datasource/locale/local_end_point.dart';
export 'core/theme/app_theme.dart';
export 'core/shared/dependencies.dart';
export 'core/shared/serves.dart';

export 'core/function/valied_input.dart';
export 'core/function/calculating_oldprice.dart';
export 'core/function/pop_dialogs/alert_exit_app_dialog.dart';
export "core/function/chick_internet_coniction.dart";
export 'core/function/statuse_request.dart';
export 'routes/middleware/route_welcome_middleware.dart';
export 'core/function/handling_requset_view.dart';

// app Widget
export 'view/widgets/text_widget.dart';
export 'view/widgets/size_box_widget.dart';
export 'view/widgets/btn_widget.dart';
export 'view/widgets/text_input_widget.dart';
export 'view/widgets/loading_widget.dart';
export 'view/widgets/snack_bar.dart';
export 'core/function/pop_dialogs/pop_loading.dart';
export 'view/widgets/title_row.dart';
export 'view/widgets/payment_form_failed.dart';
export 'view/widgets/handling_view_widgets/costum_bage_state_widget.dart';

export 'view/widgets/radio_list_tile_wiget.dart';
export 'view/widgets/list_tile.dart';
export 'view/widgets/checkbox_listtile_widget.dart';
export 'view/widgets/divider.dart';
