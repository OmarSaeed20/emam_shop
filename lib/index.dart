library index;

// packages

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get/get.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:pin_code_fields/pin_code_fields.dart';


//  Controller

export "controller/onboarding_controller.dart";

export 'controller/auth/signup_controller.dart';
export 'controller/auth/forget_controller.dart';
export 'controller/auth/phone_controller.dart';
export 'controller/auth/signin_controller.dart';

export "core/localization/locale_controller.dart";
export 'core/localization/locale.dart';

// repo

export "data/repository/auth_repo.dart";

// helper
export 'package:ecommerce/routes/routes_helper.dart';
export 'core/shared/dependencies.dart';
export 'core/shared/locale/database_helper.dart';

//  screens

export 'view/screens/onboarding/onboarding_screen.dart';
export 'view/screens/auth/login/login_screen.dart';
export 'view/screens/splash/splash_screen.dart';
export 'view/screens/auth/wellcom/wellcom_screen.dart';
export 'view/screens/auth/register/sign_up_screen.dart';
export 'view/screens/auth/register/text_form_body.dart/text_form_signup_body.dart';
export 'view/screens/auth/phone/phone_screen.dart';
export 'view/screens/auth/forget_password/forget_password.dart';
export 'view/screens/auth/forget_password/reset_password.dart';
export 'view/screens/auth/verification/verification_screen.dart';


///// constant

export 'data/model/onboarding/onboarding_model.dart';
export 'core/constant/app_strings.dart';
export 'core/constant/dimensions.dart';
export 'core/constant/app_color.dart';

// widget

export 'view/screens/splash/widget/splash_view_body.dart';
export 'view/screens/onboarding/widget/lang/choose_lang_screen.dart';
export 'view/screens/onboarding/widget/onboarding_body.dart';

export 'view/screens/auth/wellcom/widget/sign_with_body.dart';
export 'view/screens/auth/widget/sign_here_widget.dart';
export 'view/screens/auth/login/widget/text_form_body.dart';
export 'view/screens/auth/widget/icon_and_text_back.dart';
export 'view/screens/auth/phone/widget/sign_phone_body.dart';
export 'view/screens/auth/widget/auth_logo_and_name.dart';
export 'view/screens/auth/widget/auth_title.dart';
export 'view/screens/auth/forget_password/widget/text_form_forg_pass_body.dart';
export 'view/screens/auth/verification/widget/pain_code_widget.dart';
export 'view/screens/auth/widget/screen_pick.dart';
export 'view/screens/auth/forget_password/widget/text_form_reset_pass_body.dart';

// core
export 'core/constant/static.dart';
export 'core/constant/app_images.dart';
export 'core/shared/locale/local_end_point.dart';

// app Widget
export '/view/widgets/text_widget.dart';
export '/view/widgets/size_box_widget.dart';
export 'view/widgets/btn_widget.dart';
export 'view/widgets/text_input_widget.dart';
export 'view/widgets/loading_widget.dart';
