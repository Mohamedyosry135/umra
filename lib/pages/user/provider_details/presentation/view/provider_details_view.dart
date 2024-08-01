import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/provider_details/model/provider_rate_model.dart';
import 'package:umra/pages/user/provider_details/presentation/controllers/provider_details_controller.dart';
import 'package:umra/pages/user/provider_details/presentation/view/widgets/review_cell.dart';
import 'package:umra/pages/user/provider_list/presentation/view/widgets/provider_info_cell.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';

class ProviderDetailsView extends GetView<ProviderDetailsController> {
  const ProviderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorCode.primary),
        title: Text(
            CommonLang.personalInfo.tr()
        ),
        centerTitle: true,
        bottom:  PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              color: const Color(ColorCode.white),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   [
                  Expanded(
                    child: ProviderInfoCell(
                      numOfOrders: controller.providerData.providerNoOfOrders.toString() ,
                      country: "Saudi",
                      name: controller.providerData.providerAppName.toString() ,
                      availableDate: controller.providerData.availableDate.toString() ,
                      imageUrl: "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              controller.obx((state){
                return Expanded(
                  child: controller.providerRateModel.data?.isEmpty ?? false ? Center(child: Text(UserLang.noReviews.tr()),) : ListView.separated(
                itemCount: controller.providerRateModel.data?.length ?? 0,
                  itemBuilder: (context,index){
                    return  ReviewCell(rateModel: controller.providerRateModel.data?[index] ?? RateModel(),);
                  },
                  separatorBuilder: (context,index) => const SizedBox(height: 10,),
                ),
                );
              },onLoading: const Center(child: SpinKitCircle(color: Color(ColorCode.primary)),)),
              CustomButton(
                onPressed: (){
                  Get.rootDelegate.toNamed(UserRoutes.UMRAH_ADD_REQUEST, arguments: [
                    controller.umrahPackageModel,
                    controller.providerData
                  ]);
                  // Get.rootDelegate.toNamed(UserRoutes.UMRAH_ADD_REQUEST);
                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  CommonLang.select.tr(),
                  style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
