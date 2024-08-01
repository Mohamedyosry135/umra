import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/apply_agent/bindings/apply_agent_binding.dart';
import 'package:umra/pages/common/apply_agent/presentation/views/apply_agent_view.dart';
import 'package:umra/pages/common/boarding/bindings/boarding_binding.dart';
import 'package:umra/pages/common/boarding/presentation/views/boarding_view.dart';
import 'package:umra/pages/common/boarding/presentation/views/language_view.dart';
import 'package:umra/pages/common/change_day/bindings/change_day_binding.dart';
import 'package:umra/pages/common/change_day/presentation/views/change_day_view.dart';
import 'package:umra/pages/common/login/bindings/login_binding.dart';
import 'package:umra/pages/common/login/presentation/views/login_view.dart';
import 'package:umra/pages/common/my_profile/bindings/my_profile_binding.dart';
import 'package:umra/pages/common/my_profile/presentation/view/my_profile_view.dart';
import 'package:umra/pages/common/next_signup/bindings/next_signup_binding.dart';
import 'package:umra/pages/common/next_signup/presentation/views/next_signup_view.dart';
import 'package:umra/pages/common/notification/bindings/notification_binding.dart';
import 'package:umra/pages/common/notification/presentation/view/notification_view.dart';
import 'package:umra/pages/common/pending_screen/bindings/pending_bindings.dart';
import 'package:umra/pages/common/pending_screen/presentation/view/pending_screen.dart';
import 'package:umra/pages/common/privacy_policy/bindings/privacy_policy_binding.dart';
import 'package:umra/pages/common/privacy_policy/presentation/views/privacy_policy_view.dart';
import 'package:umra/pages/common/settings/bindings/settings_bindings.dart';
import 'package:umra/pages/common/settings/presentation/views/settings_views.dart';
import 'package:umra/pages/common/signup/bindings/signup_binding.dart';
import 'package:umra/pages/common/signup/presentation/views/signup_view.dart';
import 'package:umra/pages/common/splash/bindings/splash_binding.dart';
import 'package:umra/pages/common/splash/presentation/views/splash_view.dart';
import 'package:umra/pages/common/support_chat/bindings/support_chat_binding.dart';
import 'package:umra/pages/common/support_chat/presentation/views/support_chat_view.dart';
import 'package:umra/pages/common/terms_conditions/bindings/terms_condition_binding.dart';
import 'package:umra/pages/common/terms_conditions/presentation/views/terms_condition_view.dart';
import 'package:umra/pages/common/verification_code/bindings/verfication_code_binding.dart';
import 'package:umra/pages/common/verification_code/presentation/views/verfication_code_view.dart';
import 'package:umra/pages/common/wallet/bindings/wallet_binding.dart';
import 'package:umra/pages/common/wallet/presentation/views/wallet_view.dart';
import 'package:umra/pages/provider/provider_home/bindings/provider_home_binding.dart';
import 'package:umra/pages/provider/provider_home/presentation/view/provider_home_view.dart';
import 'package:umra/pages/user/user_home/bindings/user_home_binding.dart';
import 'package:umra/pages/user/user_home/presentation/view/user_home_view.dart';

import '../../pages/common/forget_password/bindings/forget_password_binding.dart';
import '../../pages/common/forget_password/presentation/views/forget_password_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.BOARDING,
        page: () => BoardingView(),
        binding: BoardingBinding()),
    GetPage(
      name: Routes.PENDING,
      page: () => PendingView(),
      binding: PendingBining()
    ),
    if (Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user)
      GetPage(
        name: Routes.HOME,
        page: () => UserHomeView(),
        binding: UserHomeBinding(),
      ),
    if (Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider)
      GetPage(
        name: Routes.HOME,
        page: () => const ProviderHomeView(),
        binding: ProviderHomeBinding(),
      ),
    GetPage(
        name: Routes.LANGUAGE,
        page: () => LanguageView(),
        binding: BoardingBinding()),
    GetPage(
        name: Routes.SETTINGS,
        page: () => const SettingsView(),
        binding: SettingsBinding()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.signupView,
      page: () => SignupView(),
      binding: signupBinding(),
    ),
    GetPage(
      name: Routes.nextsignupView,
      page: () => NextSignupView(),
      binding: nextsignupBinding(),
    ),
    GetPage(
      name: Routes.applyagentView,
      page: () => ApplyAgentView(),
      binding: ApplyAgentBinding(),
    ),
    GetPage(
        name: Routes.WALLET,
        page: () => const WalletView(),
        binding: WalletBinding()),
    GetPage(
        name: Routes.ChangeDay,
        page: () => const ChangeDayView(),
        binding: ChangeDayBinding()),
    GetPage(
        name: Routes.myProfile,
        page: () => const MyProfileView(),
        binding: MyProfileBinding()),
    GetPage(
        name: Routes.SUPPORT_CHAT,
        page: () => SupportChatView(),
        binding: SupportChatBinding()),
    GetPage(
        name: Routes.TERMS_CONDITION,
        page: () => TermsConditionView(),
        binding: TermsConditionBinding()),
    GetPage(
        name: Routes.VERFICATION_CODE,
        page: () => VerificationCodeView(),
        binding: VerificationCodeBinding()),

    GetPage(
        name: Routes.PRIVACY_POLICY,
        page: () => PrivacyPolicyView(),
        binding: PrivacyPolicyBinding()),
  ];
}
