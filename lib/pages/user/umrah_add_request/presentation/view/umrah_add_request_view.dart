import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/apply_code_widget.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/beneficiary_reason_widget.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/beneficiary_schedule_widget.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/provider_info_request.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/select_beneficiary_widget.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/select_payment_methods.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

class UmrahAddRequestView extends GetView<UmrahAddRequestController> {
  const UmrahAddRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(UserLang.requestUmrah.tr()),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: ProviderInfoRequestWidget(
              numOfOrders: controller.providerData!.providerNoOfOrders.toString(),
              country: "Saudi",
              name: controller.providerData!.providerAppName.toString(),
              rate: controller.providerData!.providerRate.toString(),
              availableDate: controller.providerData!.availableDate.toString(),
              imageUrl:  "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
            )),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: controller.obx((state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const BeneficiaryScheduleWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SelectBeneficiaryWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const BeneficiaryReasonWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text: UserLang.addComments.tr(),
                        textStyle:
                            TextStyles.textMedium18.copyWith(fontSize: 14),
                      ),
                      CustomTextFieldContainer(CustomTextFormField(
                        hint: UserLang.addComments.tr(),
                        onSave: (String? val) {},
                        inputType: TextInputType.multiline,
                        maxLines: 5,
                        controller: controller.commentController,
                      )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SelectPaymentMethodWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: UserLang.applyCoupon.tr(),
                        textStyle:
                            TextStyles.textMedium18.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ApplyCoupon(),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                  color: const Color(ColorCode.pale).withOpacity(.4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: UserLang.priceUmrah.tr(),
                              textStyle: TextStyles.textMedium18.copyWith(
                                  color: const Color(ColorCode.onCardColor),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                         Row(
                           children: [
                             Obx(
                                   () => CustomText(
                                   text:
                                   '${controller.oldPrice} USD',
                                   textStyle: TextStyles.textMedium25.copyWith(
                                       color: const Color(ColorCode.onCardColor),
                                       fontWeight: FontWeight.w700,
                                       decoration: controller.promoCodeValid.value ?TextDecoration.lineThrough : TextDecoration.none,

                                       fontSize: 24)),
                             ),
                             SizedBox(width: 10,),
                             Obx(
                                   () =>controller.promoCodeValid.value ? CustomText(
                                   text:
                                   '${controller.packageData!.price - (controller.promoCodeModel.value.data?.discountValue ?? 0)} USD',
                                   textStyle: TextStyles.textMedium25.copyWith(
                                       color: const Color(ColorCode.onCardColor),
                                       fontWeight: FontWeight.w700,
                                       fontSize: 24)) : SizedBox(),
                             ),
                           ],
                         )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        onPressed: () {
                          controller.sendRequest();
                        },
                        backGroundColor: const Color(ColorCode.primary),
                        child: Text(
                          UserLang.sendRequest.tr(),
                          style: TextStyles.textMedium18
                              .copyWith(color: const Color(ColorCode.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
            onLoading: const SizedBox(
              child:
                  Center(child: SpinKitCircle(color: Color(ColorCode.primary))),
            )),
      ),
    );
  }
}
