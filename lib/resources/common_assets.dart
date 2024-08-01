import 'package:get/get.dart';
import 'package:umra/flavors/flavor_config.dart';
class AppAssets {
  static String checkImage(String path, {bool user = false,bool provider = false,}) {
    MyFlavorConfig myFlavorConfig = Get.find();
    if (myFlavorConfig.appNameEnum == AppNameEnum.user && user){
      return "assets/user/images/$path";
    } else if (myFlavorConfig.appNameEnum == AppNameEnum.provider && provider) {
      return "assets/provider/images/$path";
    } else {
      return "assets/common/images/$path";
    }
  }

  static String handIcon() => checkImage("hand.png",provider: true,user: true);
  static String backgroundSplash() => checkImage("background_splash.png");
  static String board1() => checkImage("board1.png");
  static String board2() => checkImage("board2.png");
  static String board3() => checkImage("board3.png");
  static String languageBg() => checkImage("language_bg.png");
  static String logo() => checkImage("logo.png");
  static String backArrow() => checkImage("back_arrow.png");
  static String dropDown() => checkImage("dropdown.png");
  static String eyeOff() => checkImage("eye_off.png");
  static String logoWithoutName() => checkImage("logo_without_name.png");
  static String homeImage() => checkImage("home_image.png");
  static String appIcon() => checkImage("app_icon.png");
  static String notificationIcon() => checkImage("notification_icon.png");
  static String userVector() => checkImage("user_vector.png");
  static String settingIcon() => checkImage("setting_icon.png");
  static String cardIcon() => checkImage("card_icon.png");
  static String requestIcon() => checkImage("request_Icon.png");
  static String contactIcon() => checkImage("contact_icon.png");
  static String notificationEmpty() => checkImage("notification_empty.png");
  static String editIcon() => checkImage("edit_icon.png");
  static String userAvatar() => checkImage("user_avatar.png");
  static String dropIcon() => checkImage("drop_icon.png");
  static String decoration() => checkImage("decoration.png");
  static String navbar() => checkImage("nav_bar.png");
  static String avatar() => checkImage("avatar.png");
  static String add() => checkImage("add.png");
  static String homephoto() => checkImage("homephoto.png");
  static String ContactUs() => checkImage("ContactUs.png");
  static String MyOrders() => checkImage("MyOrders.png");
  static String MyProfile() => checkImage("MyProfile.png");
  static String MyWallet() => checkImage("MyWallet.png");
  static String Settings() => checkImage("Settings.png");
  static String IDBack() => checkImage("id_back.png");
  static String IDFront() => checkImage("id_front.png");
  static String wallet() => checkImage("walletPattern.png");
  static String changeDay() => checkImage("change_day.png");
  static String profileCover() => checkImage("profile_cover.png");
  static String personVector() => checkImage("person_vector.png");
  static String emailIcon() => checkImage("email_icon.png");
  static String phoneIcon() => checkImage("phone_icon.png");
  static String settingsCardImage() => checkImage("settings_card_image.png");
  static String languageCell() => checkImage("languageCell.png");
  static String myAccountCell() => checkImage("myAccountCell.png");
  static String myWalletCell() => checkImage("myWalletCell.png");
  static String notificationCell() => checkImage("notificationCell.png");
  static String privacyCell() => checkImage("privacyCell.png");
  static String reviewCell() => checkImage("reviewCell.png");
  static String supportCell() => checkImage("supportCell.png");
  static String termsCell() => checkImage("termsCell.png");
  static String yourDaysCell() => checkImage("yourDaysCell.png");
  static String goArrow() => checkImage("goArrow.png");

  static String right() => checkImage("right.png");
  static String masterCard() => checkImage("master_card.png");
  static String completedTask() => checkImage("completed_task.png");
  static String pendingTask() => checkImage("pending_task.png");
  static String date() => checkImage("date.png");
  static String umraDone() => checkImage("umra_done.png");
  static String close() => checkImage("close.png");
  static String sim() => checkImage("sim.png",user: true);
  static String visa() => checkImage("visa.png",user: true);

  static String uploadVideo() => checkImage("upload_video.png",provider: true);
  static String uploadImage() => checkImage("upload_image.png",provider: true);
  static String uploadAudio() => checkImage("upload_audio.png",provider: true);

}