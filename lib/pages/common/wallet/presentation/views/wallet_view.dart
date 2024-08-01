

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'dart:math' as math;



class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
         child: HomeAppBar(
           height: 100.h,
           child: Padding(
             padding: EdgeInsets.only(
                 left: 24,right: 50,  top: 16.h),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Transform(
                   alignment: Alignment.center,
                   transform: AuthService.to.language == 'ar'
                       ? Matrix4.rotationY(math.pi)
                       : Matrix4.rotationY(0),
                   child: InkWell(
                     onTap: () {
                       Get.back();
                     },
                     child: Image.asset(
                         width: 32,
                         height: 32,
                         AppAssets.backArrow(),
                         color: const Color(ColorCode.white)),
                   ),
                 ),
                 Expanded(
                   child: CustomText(
                     text: CommonLang.wallet.tr(),
                     textAlign: TextAlign.center,
                     textStyle:
                     TextStyles.textNormal18.copyWith(fontWeight: FontWeight.w700,
                         fontSize: 18,


                         color: Color(ColorCode.white)),
                   ),
                 ),

               ],
             ),
           ),
         ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 186.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(ColorCode.myWalletBackground),
                    ),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssets.wallet())
                        ),
                        PositionedDirectional(
                          top: 35.h,
                          start: 36.w,
                          child: Image(image: const AssetImage('assets/common/images/wallet.png'),
                            height: 98.h,
                            width: 87.w,
                          ),
                        ),
                        PositionedDirectional(
                          top: 52.h,
                          start: 133.w,
                          bottom: 102.h,
                          child: CustomText(
                            text: CommonLang.yourBalance.tr(),
                            textStyle:  TextStyle(
                              color: const Color(ColorCode.brown),
                              fontWeight: FontWeight.w700,
                              fontSize: 23.sp,
                              // fontFamily: DM Sans
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          top:84.h ,
                          start: 147.w,
                          child: Row(
                            children: [
                              Text(
                                '2000',
                                style: TextStyle(
                                    color: const Color(ColorCode.brown),
                                    fontWeight: FontWeight.w700,
                                    fontSize:43.sp,
                                    fontFamily: 'DMSans'
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(text: CommonLang.sar.tr(),
                                textStyle: TextStyle(
                                  color: const Color(ColorCode.brown),
                                  fontWeight: FontWeight.w700,
                                  fontSize:18.sp,
                                  // fontFamily: DM Sans
                                ),
                              ),
                            ],
                          ),


                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            CustomButton(
              backGroundColor: const Color(ColorCode.appbarGreen),
                child: CustomText(
              text: CommonLang.requestWithdraw.tr(),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,

              ),
            ),
                onPressed: (){
                showBottomSheet(context: context, 
                    builder: customBottomSheet(
                    bottomSheetBody: SingleChildScrollView(
                      child: SizedBox(
                        height:352.h ,
                        width:356.w ,
                        child: Stack(
                          children:[ Padding(
                            padding:  EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                              bottom: 17.h,
                              top: 34.h
                            ),
                            child: Column(
                              children: [
                                CustomText(text: CommonLang.requestWithdraw.tr(),
                                  textStyle: TextStyle(
                                  color: Color(ColorCode.brown),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Text('You have 2000 SAR on your balance',
                                style:
                                TextStyle(
                                  fontFamily: 'Dm sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(ColorCode.fourthGray)
                                  ),
                                ),
                                SizedBox(
                                  height: 96.h,
                                ),
                                TextFormField(
                                 decoration: InputDecoration(
                                     border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12.r),
                                       borderSide: BorderSide(
                                           color: Colors.grey,
                                           width: 1.0),
                                     ),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(12.r),
                                     borderSide: const BorderSide(
                                       color: Colors.grey,
                                     ),
                                   ),
                                   suffixText: 'SAR',
                                 ),
                                ),
                                SizedBox(
                                  height: 29.h,
                                ),
                            CustomButton(
                              backGroundColor: Color(ColorCode.appbarGreen),
                              onPressed: () {  },
                              child:
                              CustomText(text: CommonLang.change.tr(),
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,

                                ),
                              ),
                            ),


                              ],
                      ),
                          ),
                            Positioned(
                              top: 159.h,
                              left: 29.w,
                              child: CustomText(text: CommonLang.selectYourMoney.tr(),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  height: 1.4,
                                  color: Color(ColorCode.brownishGrey)

                                ),
                              ),
                            ),
                        ]
                        ),
                      ),
                    )
                    ),
                );
                }),
          ],
        ),
      ),

    );
  }
}
