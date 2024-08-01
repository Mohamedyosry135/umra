

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_payment_method.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/beneficiary_with_cell_widget.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/resources/common_assets.dart';

class SelectPaymentMethodWidget extends StatefulWidget {
  @override
  State<SelectPaymentMethodWidget> createState() => _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  PaymentMethods _method = PaymentMethods.None;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UmrahAddRequestController>(
      builder: (snap) => Column(
        children: [
          ListTile(
            leading: Radio<PaymentMethods>(
              value: PaymentMethods.Wallet,
              groupValue: _method,
              activeColor: Color(ColorCode.primary),
              onChanged: (PaymentMethods? v) {
                setState(() {
                  _method = v!;
                  Get.find<UmrahAddRequestController>().paymentMethodId = 2;
                });

              },
            ),
            title: CustomText(
              text: UserLang.payWithWallet.tr(),
              textStyle: TextStyles.textSmall,
              textAlign: TextAlign.start,
            ),
          ),
          ListTile(
            leading: Radio<PaymentMethods>(
              value: PaymentMethods.PaymentCard,
              groupValue: _method,
              activeColor: Color(ColorCode.primary),

              onChanged: (PaymentMethods? v) {
                setState(() {
                  _method = v!;
                  Get.find<UmrahAddRequestController>().paymentMethodId = 1;
                  print(Get.find<UmrahAddRequestController>().paymentMethodId);
                });

              },
            ),
            title: CustomText(
              text: UserLang.payWithCard.tr(),
              textStyle: TextStyles.textSmall,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
    // return BeneficiaryWithCellWidget(
    //   customWidget: Row(
    //     children: [
    //
    //       const SizedBox(
    //         width: 12,
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           CustomText(
    //               text: "Mastercard",
    //               textStyle: TextStyles.textMedium18.copyWith(
    //                   fontWeight: FontWeight.w600,
    //                   fontSize: 12,
    //                   color: const Color(ColorCode.darkBlack))),
    //           const SizedBox(
    //             height: 8,
    //           ),
    //           CustomText(
    //               text: "*********",
    //               textStyle: TextStyles.textMedium18.copyWith(
    //                   fontWeight: FontWeight.w600,
    //                   fontSize: 12,
    //                   color: const Color(ColorCode.darkBlack))),
    //         ],
    //       ),
    //     ],
    //   ),
    //   cellTitle: UserLang.selectBeneficiary.tr(),
    //   cellWidget: Container(
    //     padding: const EdgeInsets.all(15),
    //     child: Column(
    //       children: [
    //         CustomText(
    //             text: UserLang.selectBeneficiary.tr(),
    //             textStyle: TextStyles.textMedium18.copyWith(
    //                 fontWeight: FontWeight.w700,
    //                 color: const Color(ColorCode.darkGray2))),
    //         const SizedBox(
    //           height: 22,
    //         ),
    //         Expanded(
    //             child: ListView.separated(
    //                 itemBuilder: (context, index) {
    //                   return InkWell(
    //                     onTap: () {},
    //                     child: Container(
    //                       padding: const EdgeInsets.all(18),
    //                       decoration: BoxDecoration(
    //                           color: const Color(ColorCode.white),
    //                           borderRadius: BorderRadius.circular(12),
    //                           border: Border.all(
    //                               color: const Color(true
    //                                   ? ColorCode.orangeFaded
    //                                   : ColorCode.whitelight),
    //                               width: 1)),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Container(
    //                                 decoration: BoxDecoration(
    //                                     color: const Color(ColorCode.white),
    //                                     borderRadius:
    //                                         BorderRadius.circular(15.0),
    //                                     border: Border.all(
    //                                         color: Color(controller
    //                                                     .reasonSelected.value ==
    //                                                 "Dead"
    //                                             ? ColorCode.orangeFaded
    //                                             : ColorCode.whitelight),
    //                                         width: 1)),
    //                                 child: ClipRRect(
    //                                   borderRadius: BorderRadius.circular(15.0),
    //                                   child:
    //                                       Image.asset(AppAssets.masterCard()),
    //                                 ),
    //                               ),
    //                               const SizedBox(
    //                                 width: 12,
    //                               ),
    //                               Column(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   CustomText(
    //                                       text: "Mastercard",
    //                                       textStyle: TextStyles.textMedium18
    //                                           .copyWith(
    //                                               fontWeight: FontWeight.w600,
    //                                               fontSize: 12,
    //                                               color: const Color(
    //                                                   ColorCode.darkBlack))),
    //                                   const SizedBox(
    //                                     height: 8,
    //                                   ),
    //                                   CustomText(
    //                                       text: "*********",
    //                                       textStyle: TextStyles.textMedium18
    //                                           .copyWith(
    //                                               fontWeight: FontWeight.w600,
    //                                               fontSize: 12,
    //                                               color: const Color(
    //                                                   ColorCode.darkBlack))),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                           if (true)
    //                             Container(
    //                               padding: const EdgeInsets.all(8),
    //                               decoration: BoxDecoration(
    //                                   color: const Color(ColorCode.primary),
    //                                   borderRadius: BorderRadius.circular(7)),
    //                               child: Image.asset(AppAssets.right()),
    //                             )
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 separatorBuilder: (context, index) {
    //                   return const SizedBox(
    //                     height: 20,
    //                   );
    //                 },
    //                 itemCount: 2)),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         CustomButton(
    //           onPressed: () {
    //             Get.back();
    //           },
    //           backGroundColor: const Color(ColorCode.primary),
    //           child: Text(
    //             CommonLang.select.tr(),
    //             style: TextStyles.textMedium18
    //                 .copyWith(color: const Color(ColorCode.white)),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

enum PaymentMethods { Wallet, PaymentCard , None }
