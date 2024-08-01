import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/notification/presentation/controller/notification_controller.dart';
import 'package:umra/pages/common/notification/presentation/view/widgets/notification_cell.dart';
import 'package:umra/pages/user/user_home/presentation/controller/user_home_controller.dart';
import 'package:umra/pages/user/user_home/presentation/view/widgets/home_header_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/home_controll_cell.dart';


class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorCode.primary),
        title: Text(
          CommonLang.notifications.tr()
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.background),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (context,index) {
                    return const NotificationCell(
                      title: "Mohamed",
                      imageUrl: "",
                      date: "7:00 PM",
                      subtitle: "educational institution designed to provide learning spaces ",
                    );
                  },
                  separatorBuilder: (context,index) => const SizedBox(height: 10,),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
