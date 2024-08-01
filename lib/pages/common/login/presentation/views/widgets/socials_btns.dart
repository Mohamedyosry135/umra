import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/login/presentation/controllers/login_controller.dart';
import 'package:umra/widgets/custom_text.dart';

class SocialBtns extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(child: buttonWidget(() {}, Icons.facebook)),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: buttonWidget(() {}, Icons.facebook)),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: buttonWidget(() {}, Icons.facebook)),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 32,
            ),
            Expanded(
                child: Container(
              height: 1,
              color: const Color(ColorCode.greyscale200),
            )),
            const SizedBox(
              width: 16,
            ),
            CustomText(text: CommonLang.orLoginWith.tr(),textStyle: TextStyles.textLarge,),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Container(
              height: 1,
              color: const Color(ColorCode.greyscale200),
            )),
            const SizedBox(
              width: 32,
            ),
          ],
        )
      ],
    );
  }

  buttonWidget(var onTap, var icon) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(ColorCode.white2), width: 1)),
        child: Icon(icon, color: Colors.blue, size: 35),
      ),
    );
  }
}
