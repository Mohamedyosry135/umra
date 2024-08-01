import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/track_order/data/track_order_repository.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/audio_preview_widget.dart';
import 'package:umra/widgets/image_preview_widget.dart';
import 'package:umra/widgets/video_preview_widget.dart';
import 'package:video_player/video_player.dart';


class TrackOrderController extends SuperController<bool> {
  final ITrackOrderRepository trackOrderRepository;
  TrackOrderController({required this.trackOrderRepository});

  TextEditingController commentController = TextEditingController();

  UmrahDetailsModel umrahDetailsModel = UmrahDetailsModel();

  String umrahId = "";
  getUmrahDetails() async{
    change(false, status: RxStatus.loading());
    umrahDetailsModel = await trackOrderRepository.getUmrahDetails(umrahId);
    change(true, status: RxStatus.success());
  }
  @override
  void onInit() {
    umrahId = Get.rootDelegate.arguments()['id'] ?? "-1";
    getUmrahDetails();
    super.onInit();
  }

  late VideoPlayerController controller;
  Widget getAttachmentCell(int mediaType,String attachment){
    switch(mediaType){
      case MediaTypeEnum.photo:
        return  InkWell(
          onTap: attachment.isEmpty? null : (){
            Get.to(ImagePreviewWidget(attachment: attachment));
          },
          child: Image.network(
            attachment,
            height: 100,
            width: 150,
            errorBuilder: (_,err,trace) => Center(
              child: Text(
                UserLang.pendingImages.tr()
              ),
            )
          ),
        );
      case MediaTypeEnum.video:
        return InkWell(
          onTap: attachment.isEmpty? null :(){
            Get.to(VideoPreviewWidget(attachment: attachment));
          },
          child: attachment.isEmpty? Center(
            child: Text(
                UserLang.pendingVideos.tr()
            ),
          ):Container(
            height: 100,
            width: 150,
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
          onTap: attachment.isEmpty? null :(){
            Get.to(AudioPreviewWidget(attachment: attachment));
          },
            child: attachment.isEmpty? Center(
              child: Text(
                  UserLang.pendingRecords.tr()
              ),
            ):Container(
              height: 100,
              width: 150,
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
