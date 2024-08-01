import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/resources/common_assets.dart';


class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  final bool readOnly;

  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final String? label;
  final double verticalPadding;
  final double horizontalPadding;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function()? onTap;

  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int?maxLength;
  bool enabled;
  List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.inputType,
        this.onTap,
       this.label,
        this.onChange,
        this.nextFocus,
      this.validator,
      this.controller,
      this.obscureText = false,
        this.readOnly = false,
      this.decoration,
        this.enabled = true,
        this.focusNode,
      this.maxLines = 1,
      this.isHiddenPassword = false,
      this.obscuringCharacter = " ",
      this.verticalPadding =  14,
      this.horizontalPadding =  20,
      this.inputFormatters,
      this.onTapShowHidePassword,
        this.textInputAction,
      this.suffixIcon,
        this.maxLength,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      onTap: onTap,
      validator: validator,
      cursorColor: const Color(ColorCode.darkGray),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      enabled: enabled,
      focusNode: focusNode,
      readOnly: readOnly,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
        textInputAction: textInputAction,
      maxLength: maxLength,
      onFieldSubmitted: nextFocus,
      style: TextStyles.textNormal18.copyWith(
        color: const Color(ColorCode.black),

      ),
      decoration: decoration ??
          InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.textNormal18.copyWith(
              color: const Color(ColorCode.black).withOpacity(.5),
              fontSize: 12,
            ),
            labelText: label,
            labelStyle: TextStyles.textNormal18.copyWith(
              color: const Color(ColorCode.darkGray).withOpacity(.6),

            ),
            counterText: "",

            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: Color(ColorCode.whitelight), width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: Color(ColorCode.whitelight), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: Color(ColorCode.whitelight), width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: Color(ColorCode.whitelight), width: 1),
            ),

            fillColor: Colors.white,
            filled: true,
            contentPadding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding).r,
            prefixIcon: prefixIcon,
            suffixIcon: obscureText
                ? GestureDetector(
                    onTap: onTapShowHidePassword,
                    child: isHiddenPassword
                        ? Image.asset(AppAssets.eyeOff())
                        : Image.asset(AppAssets.eyeOff()))//AppSVGAssets.getWidget(AppSVGAssets.showPassword))
                : suffixIcon,
          ),
    );
  }
}
