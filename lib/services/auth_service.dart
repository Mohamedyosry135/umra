import 'package:umra/consts/storage.dart';
 
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/pages/common/signup/model/image_response_model.dart';


class AuthService extends GetxService {
  static AuthService get to => Get.find();
  GetStorage box = GetStorage(StorageKeys.userDataBox);
  GetStorage box2 = GetStorage(StorageKeys.appLanguage);
  GetStorage box3 = GetStorage(StorageKeys.userImageDataBox);

  final isLoggedIn = false.obs;
  final isSelectedLanguage = false.obs;
  LoginResponseModel? userInfo;
  ImageModel? imageModel;
    String? language = 'en';
  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData(StorageKeys.userDataKey)) {
      print("isLoggedInValue ${isLoggedInValue}");
      isLoggedIn.value = true;
      userInfo = LoginResponseModel.fromJson(box.read(StorageKeys.userDataKey));
    }
    print("box2.hasData ${box2.hasData(StorageKeys.appLanguage)}");
    if (box2.hasData(StorageKeys.appLanguage)) {
      isSelectedLanguage.value = true;
      language = box2.read(StorageKeys.appLanguage);
    }
    if (box3.hasData(StorageKeys.userImageDataKey)) {
      imageModel =ImageModel.fromJson( box3.read(StorageKeys.userImageDataKey));
    }
  }

  void login(LoginResponseModel userInfo) {
    box.remove(StorageKeys.userDataKey);
    isLoggedIn.value = true;
    this.userInfo = userInfo;

    box.write(StorageKeys.userDataKey, userInfo.toJson());
  }
  void addImage(ImageModel imageModel) {
    if (box3.hasData(StorageKeys.userImageDataKey)) {
      box3.remove(StorageKeys.userImageDataKey);
    }
    this.imageModel = imageModel;
    box3.write(StorageKeys.userImageDataKey, imageModel.toJson());
  }

  void logout() {
    isLoggedIn.value = false;
    userInfo = null;
    box.remove(StorageKeys.userDataKey);
    box3.remove(StorageKeys.userImageDataKey);

  }

  void selectLanguage(languag) {
    isSelectedLanguage.value = true;
    language = languag;
    box2.write(StorageKeys.appLanguage, languag);
    print("selectLanguage ${(box2.hasData(StorageKeys.appLanguage))}");
  }
}
