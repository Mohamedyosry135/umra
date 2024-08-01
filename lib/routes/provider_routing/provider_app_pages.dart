import 'package:get/get.dart';
import 'package:umra/pages/common/settings/bindings/settings_bindings.dart';
import 'package:umra/pages/common/settings/presentation/views/settings_views.dart';
import 'package:umra/pages/common/splash/bindings/splash_binding.dart';
import 'package:umra/pages/common/splash/presentation/views/splash_view.dart';
import 'package:umra/pages/provider/my_days/bindings/my_days_binding.dart';
import 'package:umra/pages/provider/my_days/presentation/view/my_days_view.dart';
import 'package:umra/pages/provider/my_requests/bindings/my_requests_binding.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/my_orders_view.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/my_orders_view.dart';
import 'package:umra/pages/provider/provider_home/bindings/provider_home_binding.dart';
import 'package:umra/pages/provider/track_order/bindings/provider_track_order_binding.dart';
import 'package:umra/pages/provider/track_order/presentation/view/provider_track_order.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import '../../pages/provider/provider_home/presentation/view/provider_home_view.dart';
part 'provider_app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class ProviderAppPages {
  static const INITIAL = Routes.SPLASH;

  static List<GetPage> routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()
    ),
    GetPage(
        name: ProviderRoutes.MY_DAYS,
        page: () =>  MyDaysView(),
        binding: MyDaysBinding()
    ),
    GetPage(
        name: ProviderRoutes.MY_REQUESTS,
        page: () => const MyOrdersView(),
        binding: MyRequestsBinding()
    ),
    GetPage(
        name: ProviderRoutes.PROVIDER_TRACK_ORDER,
        page: () =>  ProviderTrackOrderView(),
        binding: ProviderTrackOrderBinding()
    ),
  ];
}
