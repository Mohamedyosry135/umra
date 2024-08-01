import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/resources/common_assets.dart';

class BeneficiaryImageCell extends GetView<AddBeneficiaryController> {
  const BeneficiaryImageCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15,right: 9,left: 9),
            decoration: BoxDecoration(
              color: const Color(ColorCode.orangeFaded),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Image.asset(
              AppAssets.userAvatar(),
              height: 65,
              width: 70,
            ),
          ),
          PositionedDirectional(
            end: -15,
            top: 15,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(ColorCode.primary),
                border: Border.all(color: Color( ColorCode.white),width: 1.5)
              ),
              child: const Icon(
                Icons.add,
                color: Color(ColorCode.white),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
