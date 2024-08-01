import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      final userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;

      print("tloldsa");
      if (userInfo != null &&( userInfo.data?.token?.isNotEmpty ?? false)) {
        print(userInfo.data?.token);
        request.headers.putIfAbsent(
            "Authorization", () => ('Bearer ${userInfo.data!.token ?? ""}'));
      }
print('Bearer ${userInfo?.data?.token ?? ""}');
      request.headers
          .putIfAbsent("Lang", () => AuthService.to.language ?? 'ar');

      request.headers.putIfAbsent("Content-Type", () => 'application/json');
      request.headers.putIfAbsent("Accept", () => 'text/plain');

      print(request.url);
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      if (response.unauthorized || response.status.code == 401) {
        AuthService.to.logout();
        Get.rootDelegate.offNamed(Routes.LOGIN);
      }
      return response;
    });
  }
}
