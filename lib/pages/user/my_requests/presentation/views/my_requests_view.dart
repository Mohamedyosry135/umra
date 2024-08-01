import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/user/my_requests/presentation/views/widgtes/request_card_widget.dart';

class MyRequestsView extends GetView<MyRequestsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(CommonLang.myRequests.tr()),
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: controller.obx((state) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return RequestCardWidget(
                      model: controller.requestsList![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: controller.requestsList!.length);
          },
              onLoading: const SizedBox(
                child: Center(
                    child: SpinKitCircle(color: Color(ColorCode.primary))),
              )),
        ),
      ),
    );
  }
}
