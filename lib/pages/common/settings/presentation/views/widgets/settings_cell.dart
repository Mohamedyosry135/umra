import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';


class SettingsCell extends StatelessWidget {
  const SettingsCell(
      {Key? key,
    required this.prefixIcon,
    required this.onTap,
    required this.title,}) : super(key: key);

final String prefixIcon;
final String title;
final Function() onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 15.h,
            width: 15.w,
            child: Image.asset(
              prefixIcon,
            ),
            ),

          SizedBox(
            width: 16.w,
          ),
          SizedBox(
            width: 300.w,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: title,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          SizedBox(
            height:8.h,
            width: 4.w,
            child:  Image.asset(AppAssets.goArrow(),),
            ),
        ],

      ),
    );
  }
}
