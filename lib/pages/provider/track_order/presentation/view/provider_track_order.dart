import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/end_umrah_dialog.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/status_track_widget.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/user_info.dart';
import 'package:umra/pages/provider/track_order/presentation/controllers/provider_track_order_controller.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/custom_button.dart';

class ProviderTrackOrderView extends GetView<ProviderTrackOrderController>{
  const ProviderTrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(ColorCode.primary),
          centerTitle: true,
          bottom:  PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: controller.obx((state) => UserInfoWidget(
              name: controller.umrahDetailsModel.data?.umrahAppUserName ?? '',
              date: controller.umrahDetailsModel.data?.requestDate ?? "",
              imageUrl: "",
              price: controller.umrahDetailsModel.data?.umrahPackagePrice.toString() ?? "",
            )),
          )),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                controller.obx((state){
                  return Expanded(
                    child: ListView.separated(
                      itemCount: controller.umrahDetailsModel.data?.requestUmrahPackageSteps?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        RequestUmrahPackageSteps umrahStep = controller.umrahDetailsModel.data?.requestUmrahPackageSteps?[index] ?? RequestUmrahPackageSteps();
                        return TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: StatusTrackWidget(
                            attachment: umrahStep.attachment,
                           index: index,
                           umrahStepModel: umrahStep,
                          ),
                          node: TimelineNode(
                            indicator: Image.asset(umrahStep.isComplate?? false ? AppAssets.completedTask() : AppAssets.pendingTask()),
                            startConnector: DashedLineConnector(color:umrahStep.isComplate?? false ? const Color(ColorCode.primary) : const Color(ColorCode.seperatorColor),dash: 10,gap: 3),
                            endConnector: DashedLineConnector(color:umrahStep.isComplate?? false ? const Color(ColorCode.primary) : const Color(ColorCode.seperatorColor),dash: 10,gap: 3),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 12,); },),
                  );
                },onLoading: const Center(child: SpinKitCircle(color: Color(ColorCode.primary)),)),
                const SizedBox(height: 12,),
                GetBuilder<ProviderTrackOrderController>(
                  builder: (control){
                    return Obx(() {
                      if(control.isEndUmrahLoading.value){
                        return const Center(child: SpinKitCircle(color: Color(ColorCode.primary)),);
                      }else{
                        return CustomButton(
                          onPressed: control.getUmrahAction(control.umrahDetailsModel.data?.requestStatus ?? -1,context),
                          backGroundColor: (control.umrahDetailsModel.data?.requestStatus  == RequestStatusEnum.inProgress)? const Color(ColorCode.red2) : const Color(ColorCode.primary),
                          child: Text(
                            control.getUmrahStatus(control.umrahDetailsModel.data?.requestStatus ?? -1).value,
                            style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
                          ),
                        );
                      }
                    });
                  },
                )
              ],
            )),
      ),
    );
  }
}