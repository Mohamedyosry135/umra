import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/apply_agent/model/identity_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/nationality_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/request_model_final_step.dart';
import 'package:umra/pages/common/signup/data/signup_repository.dart';
import 'package:umra/pages/common/signup/model/image_response_model.dart';
import 'package:umra/pages/common/pending_screen/presentation/view/pending_screen.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../lang/translation_service.dart';
import '../../data/apply_agent_repository.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ApplyAgentController extends SuperController<bool> {
  ApplyAgentController(
      {required this.applyagentRepository, required this.signupRepository});

  final IapplyagentRepository applyagentRepository;
  final IsignupRepository signupRepository;

  IdentityTypeModel? identityTypeModel;
  NationalityTypeModel? nationalityTypeModel;
  RxInt currentIndex = 0.obs;
  DateTime? expiredDate;
  File? frontIdImage;
  File? backIdImage;
  RequestModelFinalStep requestModelFinalStep = RequestModelFinalStep();
  List<String> items = [
    CommonLang.Residencecountry.tr(),
    'egypt',
    'iran',
  ];

  List<String> CITYitems = [
    CommonLang.Afghanistan.tr(),
    'iran',
  ];
  List<String> typeitems = [
    CommonLang.Passport.tr(),
    'iran',
  ];
  List<String> identityitems = [
    CommonLang.identitynumber.tr(),
    'iran',
  ];
  List<String> expairyitems = [
    CommonLang.identitynumber.tr(),
    'iran',
  ];

  TextEditingController expiredDateController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  bool? providerType;

  Rx<IdentityType> selectedIdentityType = IdentityType().obs;
  int? selectedIdentityTypeId;

  Rx<NationalityDetails> selectedNationality = NationalityDetails().obs;
  int? selectedNationalityId;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    change(false, status: RxStatus.loading());

    await getIdentitiesType();
    await getNationalities();

    providerType =
        Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider;
  }

  getIdentitiesType() {
    change(false, status: RxStatus.loading());
    applyagentRepository.getIdentitiesType().then((value) {
      print("value.data.getIdentitiesType ??0 ${value.data?.length ?? 0}");
      identityTypeModel = value;
      selectedIdentityType.value = value.data![0];
      selectedIdentityTypeId = selectedIdentityType.value.id;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  getNationalities() {
    change(false, status: RxStatus.loading());

    applyagentRepository.getNationalities().then((value) {
      print("value.data.getNationalities ??0 ${value.data?.length ?? 0}");

      nationalityTypeModel = value;
      selectedNationality.value = value.data![0];
      selectedNationalityId = selectedNationality.value.id;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
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

  pickDate(context) async {
    expiredDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(ColorCode.primary), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(ColorCode.primary), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (expiredDate != null) {
      expiredDateController.text =
          DateFormat('yyyy-MM-dd').format(expiredDate as DateTime).toString();
    }
  }

  openBottomSheet(context, bool value) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  imagePick(ImageSource.camera, value);
                  Get.back();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 50,
                    ),
                    CustomText(
                      text: CommonLang.camera.tr(),
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(ColorCode.primary)),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  imagePick(ImageSource.gallery, value);
                  Get.back();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.photo,
                      size: 50,
                    ),
                    CustomText(
                      text: CommonLang.gallery.tr(),
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(ColorCode.primary)),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ImageResponseModel? fronImageModel;
  ImageResponseModel? backImageModel;

  Future<void> imagePick(ImageSource source, bool value) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final pickedImage = (await _picker.getImage(source: source));
    if (pickedImage != null) {
      if (value) {
        frontIdImage = File(pickedImage.path);
      } else {
        backIdImage = File(pickedImage.path);
      }
      update();
      // setState(() {
      //   images.add(File(pickedImage.path))  ;
      // });

    }
  }

  uploadImage(File image) async {
    await signupRepository
        .uploadPhoto(image, AuthService.to.userInfo?.data?.token ?? "")
        .then((value) {
      print("image ${value.data?[0].id}");
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error${error.toString()}");
      //use success status to display the login button again
      Get.snackbar("", error.toString());

      change(false, status: RxStatus.success());
    });
  }

  onClickWaitReview() async {
    change(false, status: RxStatus.loading());
    await signupRepository
        .uploadPhoto(frontIdImage!, AuthService.to.userInfo?.data?.token ?? "")
        .then((value1) async {
      fronImageModel = value1;
      requestModelFinalStep.idFrontAttachmentId = value1.data?[0].id;
      await signupRepository
          .uploadPhoto(backIdImage!, AuthService.to.userInfo?.data?.token ?? "")
          .then((value2) async {
        backImageModel = value2;
        requestModelFinalStep.idFrontAttachmentId = value2.data?[0].id;

        await applyagentRepository
            .addUserFinalStep(requestModelFinalStep)
            .then((value) {
          AuthService.to.logout();
          Get.rootDelegate.offNamed(Routes.PENDING);

          Future.delayed(Duration(seconds: 1))
              .then((value) => Get.rootDelegate.dispose());
          change(true, status: RxStatus.success());
        }).onError((error, stackTrace) {
          print("Error lastEndPoint");
          print("error${error.toString()}");
          Get.snackbar("", error.toString());
          change(false, status: RxStatus.success());
        });
      }).onError((error, stackTrace) {
        print("Error upload second id image");
        print("error${error.toString()}");
        Get.snackbar("", error.toString());
        change(false, status: RxStatus.success());
      });
    }).onError((error, stackTrace) {
      print("Error upload first id image");
      print("error${error.toString()}");
      Get.snackbar("", error.toString());
      change(false, status: RxStatus.success());
    });
  }
}
