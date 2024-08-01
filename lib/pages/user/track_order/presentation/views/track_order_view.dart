import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';
import 'package:umra/pages/user/track_order/presentation/views/widgtes/provider_info.dart';
import 'package:umra/pages/user/track_order/presentation/views/widgtes/status_widget.dart';
import 'package:umra/resources/common_assets.dart';

class TrackOrderView extends GetView<TrackOrderController> {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(ColorCode.primary),
          title: Text(UserLang.trackOrder.tr()),
          centerTitle: true,
          bottom:  PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: ProviderInfo(
              providerName: controller.umrahDetailsModel.data?.providerAppUserName ?? "",
            ),
          )),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: controller.obx((state){
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.umrahDetailsModel.data?.requestUmrahPackageSteps?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    RequestUmrahPackageSteps umrahStep = controller.umrahDetailsModel.data?.requestUmrahPackageSteps?[index] ?? RequestUmrahPackageSteps();
                    return TimelineTile(
                      nodeAlign: TimelineNodeAlign.start,
                      contents: StatusWidget(
                        attachment: umrahStep.attachment,
                        mediaType: umrahStep.step?.mediaType ?? 0,
                        title: umrahStep.step?.title ?? "",
                        description: umrahStep.step?.description ?? ""
                      ),
                      node: TimelineNode(
                        indicator: Image.asset(umrahStep.isComplate ?? false ? AppAssets.completedTask() : AppAssets.pendingTask()),
                        startConnector: DashedLineConnector(color:umrahStep.isComplate ?? false ? const Color(ColorCode.primary) : const Color(ColorCode.seperatorColor),dash: 10,gap: 3),
                        endConnector: DashedLineConnector(color:umrahStep.isComplate ?? false ? const Color(ColorCode.primary) : const Color(ColorCode.seperatorColor),dash: 10,gap: 3),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 12,); },),
              );
            },onLoading: const Center(child: SpinKitCircle(color: Color(ColorCode.primary)),)),
        ),
      ),
    );
  }
}
