import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:umra/pages/common/splash/data/splash_repository.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends SuperController<dynamic> {
  SplashController({required this.splashRepository});

  final ISplashRepository splashRepository;
  var token;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void requestPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings setting = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print('authorized');
    } else if (setting.authorizationStatus == AuthorizationStatus.provisional) {
      print('provisional');
    } else {
      // Permission.photos.request();
      // Permission.videos.request();
      // Permission.audio.request();

      NotificationPermissions.requestNotificationPermissions(
          openSettings: false);
      print('declined or not accepted');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((value) async {
      print(value.toString());
      await FirebaseFirestore.instance
          .collection('tokens')
          .doc()
          .set({'token': value});
      return token = value;
    });
  }

  initInfo() {
    var androidInitialize =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const DarwinInitializationSettings();
    var initializationSetting =
    InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification?.title.toString(),
          htmlFormatContentTitle: true);
      AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('dbmazad', 'dbmazad',
          importance: Importance.max,
          styleInformation: bigTextStyleInformation,
          priority: Priority.max,
          playSound: true);
      NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, notificationDetails,
          payload: message.data['title']);
    });
  }
  @override
  void onInit() async {
    requestPermissions();
    getToken();
    initInfo();
    super.onInit();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Future.delayed(const Duration(seconds: 2)).then((value) {
      final isLoggedIn = AuthService.to.isLoggedIn.value;
      final isSelectedLanguage = AuthService.to.isSelectedLanguage.value;
      if(isLoggedIn){
        Get.rootDelegate.offNamed(Routes.HOME);
      }else{
        Get.rootDelegate.offNamed(Routes.BOARDING);
      }


    });
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
