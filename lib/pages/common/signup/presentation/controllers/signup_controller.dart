import 'dart:io';

import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/data/login_repository.dart';
 
import 'package:get/get.dart';
import 'package:umra/routes/common_routing/app_pages.dart';

import '../../data/signup_repository.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends SuperController<bool> {
  SignupController({required this.signupRepository});

  final IsignupRepository signupRepository;

  RxBool isHiddenPassword = true.obs;
  RxBool isHiddenPassword1 = true.obs;

  String email = "";
      String fullName = "";
  String userName = "";
  String  password = "";
  String  confirmPassword = "";

  File? image;
  changeIsHiddenPassword() => isHiddenPassword.toggle();
  changeIsHiddenPassword1() => isHiddenPassword1.toggle();



  bool? providerType;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    providerType = Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider;
    change(null, status: RxStatus.success());
  }

  onAddUser() async{
    change(false, status: RxStatus.loading());
   await signupRepository.addUser(fullName, userName, email, password).then((value) async{
     print("email ${email}");
     if(image == null){
       print("Image = null");
       Get.rootDelegate.offNamed(Routes.VERFICATION_CODE,arguments: [{"resetPassword":false},{"email":email}]);
       change(true, status: RxStatus.success());
     }else{
       await signupRepository.uploadPhoto(image!, value.data?.token ??"").then((value){
         print("image ${value.data?[0].id}");
         Get.rootDelegate.offNamed(Routes.VERFICATION_CODE,arguments: [{"resetPassword":false},{"email":email}]);
         change(true, status: RxStatus.success());
       }).onError((error, stackTrace){
         print( "error${error.toString()}");
         //use success status to display the login button again
         Get.snackbar("", error.toString());

         change(false, status: RxStatus.success());
       });
     }

    }, onError: (err) {
      print( "error${err}");
      //use success status to display the login button again
      Get.snackbar("", err);
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

  Future<void> imagePick(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final pickedImage = (await _picker.pickImage(source: source));
    if(pickedImage !=null){
      image = File(pickedImage.path);
    }
    update();
  }

}
