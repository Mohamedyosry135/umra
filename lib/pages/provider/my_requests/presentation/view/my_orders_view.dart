import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/order_card_widget.dart';
import 'package:umra/pages/provider/my_requests/presentation/view/widgets/select_date.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:umra/routes/provider_routing/provider_app_pages.dart';
import 'package:umra/widgets/custom_text.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(ColorCode.primary),
          title: Text(ProviderLang.myRequests.tr()),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SelectDateWidget()),
        ),
        backgroundColor: const Color(ColorCode.white),
        body: controller.obx(
          (state) => SafeArea(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text:
                          "${ProviderLang.total.tr()} ${controller.myUmraRequestsModel?.data?.length ?? 0} ${ProviderLang.requests.tr()}`",
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(ColorCode.textLight))),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.myUmraRequestsModel != null ||
                      (controller.myUmraRequestsModel?.data?.isNotEmpty ??
                          false))
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Get.rootDelegate.toNamed(
                                      ProviderRoutes.PROVIDER_TRACK_ORDER,
                                      arguments: {
                                        "id": controller.myUmraRequestsModel!
                                            .data![index].id
                                            .toString()
                                      });
                                },
                                child: OrderCardWidget(controller.myUmraRequestsModel?.data?[index] ?? UmraRequestData()));
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          itemCount:
                              controller.myUmraRequestsModel?.data?.length ??
                                  0),
                    )
                ],
              ),
            ),
          ),
          onLoading: const SpinKitCircle(color: Color(ColorCode.primary)),
        ));
  }
}
