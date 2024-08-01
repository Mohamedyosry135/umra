import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/pages/user/payment/presentation/controllers/payment_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../lang/user_translation_service.dart';

class TransactionView extends GetView<PaymentController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(
            UserLang.transactions.tr()
        ),
        centerTitle: true,

      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(ColorCode.whitelight),width: 1)
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color(ColorCode.white),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color:  const Color(ColorCode.whitelight) ,width: 1)

                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(15.0),
                        //   child: Image.network(
                        //     "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                        //     height: 40,
                        //     width: 40,
                        //   ),
                        // ),
                      ),
                      const SizedBox(width: 11,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Payment Done", textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 16,
                                  color: const Color(ColorCode.darkBlue),
                                  fontWeight: FontWeight.w700
                              )),
                              CustomText(text: '\$303.41', textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 16,
                                  color: const Color(ColorCode.primary),
                                  fontWeight: FontWeight.w700
                              ))
                            ],
                          ),
                          const SizedBox(height: 11,),

                          Row(
                            children: [
                              CustomText(text: "1 Dec 2020", textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 12,
                                  color: const Color(ColorCode.gray4),

                              )),
                              const SizedBox(width: 19,),
                              CustomText(text: '10:00 PM', textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 12,
                                  color: const Color(ColorCode.gray4),
                              ))
                            ],
                          )

                        ],
                      ))
                    ],
                  ),
                );
              },
              separatorBuilder: (context,inedx){
                return const SizedBox(height: 12,);
              },
              itemCount: 5),
        ),
      ),
    );
  }

}