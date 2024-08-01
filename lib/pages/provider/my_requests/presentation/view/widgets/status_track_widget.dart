import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/provider/track_order/presentation/controllers/provider_track_order_controller.dart';
import 'package:umra/pages/provider/track_order/presentation/view/widgets/attachment_file_widget.dart';
import 'package:umra/pages/provider/track_order/presentation/view/widgets/empty_attachment_widget.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/warning_bottom_sheet.dart';

class StatusTrackWidget extends GetView<ProviderTrackOrderController> {
  final int index;
  final Attachment? attachment;
  final RequestUmrahPackageSteps umrahStepModel;
  const StatusTrackWidget({super.key, this.attachment,required this.umrahStepModel,required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 24),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: const Color(ColorCode.whitelight), width: 1)),
      child:GetBuilder<ProviderTrackOrderController>(
        builder: (control){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: umrahStepModel.step?.title ?? "",
                    textStyle: TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  umrahStepModel.isComplate ?? false
                      ? control.getAttachmentCell(umrahStepModel.step?.mediaType ?? -1, umrahStepModel.attachment?.filePath ?? "")
                      : control.fileSelected[index]
                      ? AttachmentFileWidget(
                    mediaType: umrahStepModel.step?.mediaType ?? -1,
                    filePath: control.platformFile?[index].path ?? "",
                    onRemove: (){
                      control.fileSelected[index] = false;
                      control.platformFile?[index] = PlatformFile(name: "", size: 0);
                      control.update();
                    },
                  ): EmptyAttachmentWidget(
                      mediaType: umrahStepModel.step?.mediaType ?? -1,
                      index: index
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: ProviderLang.urTask.tr(),
                        textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(ColorCode.black2)
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomText(
                        text: umrahStepModel.step?.description ?? "",
                        textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(ColorCode.dateColor)
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                    control.fileUploaded[index] ? const Center(child: CircularProgressIndicator(),) : CustomButton(
                      onPressed: (umrahStepModel.isComplate ?? false) ? null:(){
                        if(control.fileSelected[index]){
                          String dependenceSteps = "";
                          if(!(umrahStepModel.step?.isRequied ?? true)){
                            control.updateUmrahStep((control.platformFile?[index])!,umrahStepModel,index);
                          }else{
                            if(umrahStepModel.step?.dependenceIds?.isNotEmpty ?? false) {
                              for (int i = 0; i < (umrahStepModel.step?.dependenceIds?.length ?? 0); i++) {
                                for(int j = 0; j < (controller.umrahDetailsModel.data?.requestUmrahPackageSteps?.length ?? 0); j++){
                                  var stepModel = controller.umrahDetailsModel.data?.requestUmrahPackageSteps?[j];
                                  if ((stepModel?.step?.id ?? -1) == (umrahStepModel.step?.dependenceIds?[i] ?? -1) && (!(stepModel?.isComplate ?? true)) ) {
                                    dependenceSteps += "${stepModel?.step?.title}" ;
                                  }
                                }
                              }
                              if(dependenceSteps.isNotEmpty){
                                warningBottomSheet(
                                  context: context,
                                  content: ProviderLang.finishStepAlert.tr() + dependenceSteps,
                                );
                              }else{
                                control.updateUmrahStep((control.platformFile?[index])!,umrahStepModel,index);
                              }
                            }else{
                              control.updateUmrahStep((control.platformFile?[index])!,umrahStepModel,index);
                            }
                          }
                        }
                      },
                      width: 100,
                      height: 45,
                      backGroundColor: umrahStepModel.isComplate ?? false ? const Color(ColorCode.primary).withOpacity(.3) : const Color(ColorCode.primary).withOpacity(control.fileSelected[index] ? 1 : .3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(umrahStepModel.isComplate ?? false)
                            Container(
                              margin: const EdgeInsetsDirectional.only(end: 5,top: 2),
                              child: const Icon(
                                Icons.check,
                                color: Color(ColorCode.primary),
                                size: 13,
                              ),
                            ),
                          Text(
                            CommonLang.done.tr(),
                            style: TextStyles.textMedium18.copyWith(
                                color: umrahStepModel.isComplate ?? false ? const Color(ColorCode.primary) : const Color(ColorCode.white),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
