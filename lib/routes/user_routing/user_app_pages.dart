import 'package:get/get.dart';
import 'package:umra/pages/common/splash/bindings/splash_binding.dart';
import 'package:umra/pages/common/splash/presentation/views/splash_view.dart';
import 'package:umra/pages/user/add_beneficiary/bindings/add_beneficiary_binding.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/add_beneficiary_view.dart';
import 'package:umra/pages/user/my_beneficiary/bindings/my_beneficiary_binding.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/view/my_beneficiary_view.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/add_bank_account_view.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/add_credit_card_view.dart';
import 'package:umra/pages/user/provider_details/bindings/provider_details_binding.dart';
import 'package:umra/pages/user/provider_details/presentation/view/provider_details_view.dart';
import 'package:umra/pages/user/my_requests/bindings/my_requests_binding.dart';
import 'package:umra/pages/user/my_requests/presentation/views/my_requests_view.dart';
import 'package:umra/pages/user/payment/bindings/payment_binding.dart';
import 'package:umra/pages/user/payment/presentation/views/payment_view.dart';
import 'package:umra/pages/user/payment/presentation/views/transaction_view.dart';
import 'package:umra/pages/user/payment_methods/bindings/payment_methods_binding.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/payment_methods_view.dart';
import 'package:umra/pages/user/provider_list/bindings/provider_list_binding.dart';
import 'package:umra/pages/user/provider_list/presentation/view/provider_list_view.dart';
import 'package:umra/pages/user/rate_provider/bindings/rate_provider_binding.dart';
import 'package:umra/pages/user/rate_provider/presentation/views/rate_provider_view.dart';
import 'package:umra/pages/user/track_order/bindings/track_order_binding.dart';
import 'package:umra/pages/user/track_order/presentation/views/track_order_view.dart';
import 'package:umra/pages/user/track_order/presentation/views/umra_done_view.dart';
import 'package:umra/pages/user/umrah_add_request/bindings/umrah_add_request_binding.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/umrah_add_request_view.dart';
import 'package:umra/pages/user/urmah_list/bindings/umrah_list_binding.dart';
import 'package:umra/pages/user/urmah_list/presentation/view/umrah_list_view.dart';
import 'package:umra/routes/common_routing/app_pages.dart';

part 'user_app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class UserAppPages {
  static const INITIAL = Routes.SPLASH;

  static List<GetPage> routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()
    ),
    GetPage(
      name: UserRoutes.ADD_BENEFICIARY,
      page: () => AddBeneficiaryView(),
      binding: AddBeneficiaryBinding(),
    ),
    GetPage(
      name: UserRoutes.MY_BENEFICIARY,
      page: () => MyBeneficiaryView(),
      binding: MyBeneficiaryBinding(),
    ),
    GetPage(
      name: UserRoutes.UMRAH_LIST,
      page: () => UmrahListView(),
      binding: UmrahListBinding(),
    ),
    GetPage(
      name: UserRoutes.PROVIDER_LIST,
      page: () => ProviderListView(),
      binding: ProviderListBinding(),
    ),
    GetPage(
      name: UserRoutes.PROVIDER_DETAILS,
      page: () => ProviderDetailsView(),
      binding: ProviderDetailsBinding(),
    ),
  GetPage(
      name: UserRoutes.UMRAH_ADD_REQUEST,
      page: () => UmrahAddRequestView(),
      binding: UmrahAddRequestBinding(),
    ),
    GetPage(
      name: UserRoutes.MY_REQUESTS,
      page: () => MyRequestsView(),
      binding: MyRequestsBinding(),
    ),
    GetPage(
      name: UserRoutes.TRACK_ORDER,
      page: () => TrackOrderView(),
      binding: TrackOrderBinding(),
    ),
    GetPage(
      name: UserRoutes.UMRA_DONE,
      page: () => UmraDoneView(),
      binding: TrackOrderBinding(),
    ),
    GetPage(
      name: UserRoutes.RATE_PROVIDER,
      page: () => RateProviderView(),
      binding: RateProivderBinding(),
    ),
    GetPage(
      name: UserRoutes.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: UserRoutes.TRANACTIONS,
      page: () => TransactionView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: UserRoutes.PAYMENT_METHODS,
      page: () => PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: UserRoutes.ADD_BANK_ACCOUNT,
      page: () => AddBankAccountView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: UserRoutes.ADD_CREDIT_CARD,
      page: () => AddCreditCardView(),
      binding: PaymentMethodsBinding(),
    ),
  ];
}
