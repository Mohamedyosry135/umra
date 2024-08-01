import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/pages/common/support_chat/presentation/controllers/support_chat_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_form_field.dart';


class SupportChatView extends GetView<SupportChatController> {
  const SupportChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: CustomText(
          text: CommonLang.support.tr(),
          textStyle: TextStyles.textBold18.copyWith(
              color: const Color(ColorCode.white), fontWeight: FontWeight.w700),
        ),
        elevation: .5,
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        if (controller.scrollControllerChats.value.position
                            .pixels ==
                            controller.scrollControllerChats.value.position
                                .minScrollExtent) {
                          // controller.getMoreMessagesSearch(args);
                        }else{

                        }
                      }
                      return true;
                    },
                    child: ListView.separated(
                      itemCount: 10,
                      shrinkWrap: true,
                      controller: controller.scrollControllerChats.value,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: index%2==0 ?TextDirection.ltr:TextDirection.rtl,
                          child: Align(
                            alignment: (index%2==0
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Container(

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                      color: index%2==0 ?Color(ColorCode.greenLight): Color(ColorCode.pinkLight)
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        child: CustomText(
                                            text: "“Whether its a driving tour, a cruise or a bus, leaf viewing is a great way to. It’s big tour business.",
                                          maxLines: 600,
                                           textAlign: TextAlign.start,
                                           textStyle: TextStyles.textMedium18.copyWith(
                                             fontSize: 16,
                                             color: index%2==0 ?Color(ColorCode.greenTextChat): Color(ColorCode.brownTextChat)
                                           )                            ),
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(ColorCode.white),
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(color:  Color( ColorCode.whitelight) ,width: 1)

                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.network(
                                          "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 3,),
                                CustomText(text: "7:00 PM", textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(ColorCode.timeTextChat).withOpacity(.5)
                                ))
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 12,);
                    },
                    ),
                  ),),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child:
                        TextField(
                          decoration: const InputDecoration(
                              hintText: "Type someting...",
                              hintStyle: TextStyle(color:  Color(ColorCode.darkBlue)),
                              fillColor: Color(ColorCode.darkGray2),
                              border: InputBorder.none),
                          style: TextStyles.textMedium18,

                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // expands: true,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {

                        },
                        child:Image.asset(AppAssets.add()),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
