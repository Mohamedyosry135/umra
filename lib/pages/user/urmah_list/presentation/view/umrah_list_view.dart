import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/urmah_list/presentation/controllers/umrah_list_controller.dart';
import 'package:umra/pages/user/urmah_list/presentation/view/widgets/umrah_cell.dart';

class UmrahListView extends GetView<UmrahListController> {
  const UmrahListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(UserLang.requestUmrah.tr()),
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.obx((state) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: controller.umrahPackageListModel!.data!.length,
                    itemBuilder: (context, index) {
                      return UmrahCell(
                        packageData:
                            controller.umrahPackageListModel!.data![index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                );
              },
                  onLoading: const Expanded(
                    child: SizedBox(
                      child: Center(
                          child:
                              SpinKitCircle(color: Color(ColorCode.primary))),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
