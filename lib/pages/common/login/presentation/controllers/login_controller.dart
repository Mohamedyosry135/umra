import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/data/login_repository.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:get/get.dart';


class LoginController extends SuperController<bool> {
  LoginController({required this.loginRepository});

  final ILoginRepository loginRepository;

  RxBool isHiddenPassword = true.obs;
  String email = "", password = "";
  changeIsHiddenPassword() => isHiddenPassword.toggle();

  bool? userType;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userType = Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user;
    change(null, status: RxStatus.success());
  }

  onLoginClicked() {
    change(false, status: RxStatus.loading());
   var apiResp = loginRepository.login(email, password).then((value) {

      final thenTo = Get
          .rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
      Get.rootDelegate.offNamed(thenTo ?? Routes.HOME);
     // Get.rootDelegate.toNamed(Routes.nextsignupView);
      change(true, status: RxStatus.success());
    }, onError: (err) {
      print( "error ${err}");
      Get.snackbar("", err.toString());
      change(false, status: RxStatus.success());
    });
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
