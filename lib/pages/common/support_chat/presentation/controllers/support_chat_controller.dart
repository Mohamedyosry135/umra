import 'package:flutter/material.dart';
import 'package:umra/pages/common/splash/data/splash_repository.dart';
import 'package:umra/pages/common/support_chat/data/support_chat_repository.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SupportChatController extends SuperController<dynamic> {
  SupportChatController({required this.supportChatRepository});

  final ISupportChatRepository supportChatRepository;

  Rx<ScrollController> scrollControllerChats = ScrollController().obs;

  @override
  void onInit() async {
    super.onInit();


  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
