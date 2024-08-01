import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/next_signup/presentation/controllers/next_signup_controller.dart';
import 'package:umra/pages/common/signup/model/image_response_model.dart';
import 'package:umra/pages/common/signup/presentation/controllers/signup_controller.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/end_umrah_dialog.dart';
import 'package:umra/pages/provider/track_order/data/provider_track_order_repository.dart';
import 'package:umra/pages/provider/track_order/model/update_step_model.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/track_order/data/track_order_repository.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/audio_preview_widget.dart';
import 'package:umra/widgets/image_preview_widget.dart';
import 'package:umra/widgets/video_preview_widget.dart';
import 'package:umra/widgets/warning_bottom_sheet.dart';
import 'package:video_player/video_player.dart';


class ProviderTrackOrderController extends SuperController<bool> {
  final IProviderTrackOrderRepository providerTrackOrderRepository;
  ProviderTrackOrderController({required this.providerTrackOrderRepository});

  TextEditingController commentController = TextEditingController();

  UmrahDetailsModel umrahDetailsModel = UmrahDetailsModel();

  String umrahId = "";
  getUmrahDetails() async{
    change(false, status: RxStatus.loading());
    umrahDetailsModel = await providerTrackOrderRepository.getUmrahDetails(umrahId);
    setFilesList();
    change(true, status: RxStatus.success());
  }
  RxBool isEndUmrahLoading = false.obs;
  endUmrah()async{
    isEndUmrahLoading.value = true;
    await providerTrackOrderRepository.endUmrah(umrahId);
    Get.find<MyOrdersController>().onInit();
    Get.back();
    isEndUmrahLoading.value = false;
    update();
  }
  updateUmrahStep(PlatformFile file,RequestUmrahPackageSteps umrahPackageSteps,int index)async{
    // change(false, status: RxStatus.loading());
    fileUploaded[index] = true;
    update();
    var response = await providerTrackOrderRepository.uploadPhoto(File(file.path ?? ""));
    await providerTrackOrderRepository.updateUmrahStep(setUmrahStepModel(response,umrahPackageSteps)).then((value){
      fileUploaded[index] = false;
      getUmrahDetails();
    });
    update();
    // change(true, status: RxStatus.success());
  }
  UpdateStepModel setUmrahStepModel(ImageResponseModel attachmentModel,RequestUmrahPackageSteps umrahPackageSteps){
    return UpdateStepModel(
      attachmentId: attachmentModel.data?.first.id ?? -1,
      requestUmrahId: umrahPackageSteps.requestUmrahId,
      rowVersion: umrahPackageSteps.rowVersion,
      umrahPackageStepsId: umrahPackageSteps.umrahPackageStepsId,
      uniqueId: umrahPackageSteps.uniqueId,
      id: umrahPackageSteps.id,
    );
  }
  @override
  void onInit() {
    umrahId = Get.rootDelegate.arguments()['id'] ?? "-1";
    getUmrahDetails();
    super.onInit();
  }
  setFilesList(){
    List<RequestUmrahPackageSteps> requestUmrahPackageSteps = umrahDetailsModel.data?.requestUmrahPackageSteps ?? [];
    for(int i = 0; i < requestUmrahPackageSteps.length; i++){
      if(!(requestUmrahPackageSteps[i].isComplate ?? true)){
        fileSelected.add(false);
      }else{
        fileSelected.add(true);
      }
      fileUploaded.add(false);
      platformFile?.add(PlatformFile(name: "name", size: 0));
    }
  }
  List<PlatformFile>? platformFile = [];
  List<bool> fileSelected = [];
  List<bool> fileUploaded = [];

  getImage({required FileType fileType,required int index}) async {
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          withData: true,
          type: fileType,
          allowMultiple: false
      );
      if (result != null) {
        platformFile?[index] = result.files.first;
        fileSelected[index] = true;
        update();
      } else {
        platformFile?[index] = PlatformFile(name: "name", size: 0);
        fileSelected[index] = false;
        update();
      }
    } catch (e) {
      print("Erroaar ${e}");
    }
  }
  late VideoPlayerController controller;
  Widget getAttachmentCell(int mediaType,String attachment){
    switch(mediaType){
      case MediaTypeEnum.photo:
        return InkWell(
          onTap: (){
            Get.to(ImagePreviewWidget(attachment: attachment));
          },
          child: Image.network(
            attachment,
            height: 95,
            width: 95,
            errorBuilder: (_,err,trace) => Container(
              height: 95,
              width: 95,
              color: const Color(ColorCode.background),
            ),
            // loadingBuilder: (context,_,loading) => const Center(child: CircularProgressIndicator(),),
          ),
        );
      case MediaTypeEnum.video:
        return InkWell(
          onTap: (){
            Get.to(VideoPreviewWidget(attachment: attachment));
          },
          child: Container(
            height: 95,
            width: 95,
            color: const Color(ColorCode.background),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(ColorCode.black).withOpacity(.2),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Color(ColorCode.white),
                  size: 25,
                ),
              ),
            ),
          )
        );
      case MediaTypeEnum.record:
        return InkWell(
          onTap: (){
            Get.to(AudioPreviewWidget(attachment: attachment));
          },
            child: Container(
              height: 95,
              width: 95,
              color: const Color(ColorCode.background),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(ColorCode.black).withOpacity(.2),
                  ),
                  child: const Icon(
                    Icons.audiotrack_outlined,
                    color: Color(ColorCode.white),
                    size: 25,
                  ),
                ),
              ),
            )
        );
      default:
        return Container(color: Colors.yellow,);
    }
  }


  RxString getUmrahStatus(int umrahStatus){
    switch(umrahStatus){
      case RequestStatusEnum.notStarted:
        return CommonLang.startUmra.tr().obs;
      case RequestStatusEnum.completed:
        return CommonLang.startUmra.tr().obs;
      case RequestStatusEnum.inProgress:
        return CommonLang.endUmrah.tr().obs;
      case RequestStatusEnum.cancelFromAdmin:
        return CommonLang.umrahCanceledByAdmin.tr().obs;
      case RequestStatusEnum.cancelFromProvider:
        return CommonLang.umrahCanceledByProvider.tr().obs;
      default:
        return "".obs;
    }
    update();
  }

  Function() getUmrahAction(int umrahStatus,BuildContext context){
    switch(umrahStatus){
      case RequestStatusEnum.inProgress:
        return (){
          if(umrahDetailsModel.data?.requestUmrahPackageSteps?.where((e) => e.isComplate ?? false).toList().length !=  (umrahDetailsModel.data?.requestUmrahPackageSteps?.length ?? -1)){
            warningBottomSheet(
              context: context,
              content: ProviderLang.endUmrahError.tr(),
            );
          }else{
            Get.dialog(
              EndUmrahDialog(
                name: umrahDetailsModel.data?.umrahAppUserName ?? '',
                onCancel: (){
                  Get.back();
                },
                onEnd: (){
                  endUmrah();
                  Get.back();
                },
              ),
            );
          }

        };
      case RequestStatusEnum.completed:
        return (){};

      case RequestStatusEnum.notStarted:
        return (){};
      case RequestStatusEnum.cancelFromAdmin:
        return (){};
      case RequestStatusEnum.cancelFromProvider:
        return (){};
      default:
        return (){};
    }
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


