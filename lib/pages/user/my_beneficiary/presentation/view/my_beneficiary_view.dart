import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/view/widgets/beneficiary_cell.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';

class MyBeneficiaryView extends GetView<MyBeneficiaryController> {
  const MyBeneficiaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(
            CommonLang.myBeneficiary.tr()
        ),
        centerTitle: true,
        // actions: [
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Image.asset(
          //     AppAssets.editIcon(),
          //     height: 20,
          //     width: 20,
          //   ),
          // )
        // ],
      ),
      backgroundColor: const Color(ColorCode.white),
      body: controller.obx((state) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: controller.beneficiaryDetilsList?.length ?? 0,
                  separatorBuilder: (context,index) => const SizedBox(height: 15.0,),
                  itemBuilder: (context,index){
                    return  BeneficiaryCell(
                      imageUrl: "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                      name:  controller.beneficiaryDetilsList?[index].legalName ?? "",
                      relationship: controller.relationships?.firstWhere((element) => element.id ==  controller.beneficiaryDetilsList?[index].relationShip).name ?? "",
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  backGroundColor: const Color(ColorCode.primary),
                  onPressed: ()async{
                   await Get.rootDelegate.toNamed(UserRoutes.ADD_BENEFICIARY,arguments: [
                      {"relationships":controller.relationships},
                      {"genders":controller.genders},
                      {"countries":controller.countries},
                      {"isFromMyBeneficiary":true}
                    ]).then((value){
                     controller.getBeneficiary();

                   });
                  },
                  child: Text(
                    UserLang.addBeneficiary.tr(),
                    style: TextStyles.textMedium18.copyWith(color: Color(ColorCode.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary))),
    );
  }
}