import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/consts/colors.dart';

class TextStyles {
  // static TextStyle textXLargeOrange = const TextStyle(
  //     fontSize: 29,
  //     fontWeight: FontWeight.bold,
  //     color: Color(ColorCode.orangeFaded));
  // static const  textMedium = TextStyle(
  //   color: Color(ColorCode.greyscale500),
  //   fontSize: 19,
  //   fontWeight: FontWeight.normal,
  // );
  static TextStyle textButton = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(ColorCode.white));

  //OLD TEXTSTYLES
  static TextStyle textLarge = const TextStyle(
      fontSize: 18,
      color: Color(ColorCode.greyscale400),
      fontWeight: FontWeight.normal,
      fontFamily: "DIN Arabic Light");
  static TextStyle textSmall = TextStyle(
      fontSize: 16,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w400,
      fontFamily: "DIN Arabic Light");
  static TextStyle textXSmall = TextStyle(
      fontSize: 11.sp,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w600,
      fontFamily: "DIN Arabic Light");
  static TextStyle bottomNavBarItemStyle =
      TextStyle(fontFamily: "DIN Arabic Light", height: 1, fontSize: 13.sp);


  static TextStyle textBold25 = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      );
  static TextStyle textBold22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textBold20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textBold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textMedium25 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMedium22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMedium20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMedium18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textNormal25 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textNormal22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textNormal20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textNormal18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
}
