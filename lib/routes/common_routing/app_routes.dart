part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const BOARDING= '/boarding';
  static const PENDING= '/pending';
  static const LANGUAGE= '/language_view';
  static const LOGIN = '/login';
  static const FORGETPASSWORD = '/forget_password';
  static const HOME = '/home';
  static const NOTIFICATION = '/notification';
  static const signupView = '/signupView';
  static const nextsignupView = '/next-signup';
  static const applyagentView = '/apply-agent';
  static const WALLET = '/wallet';
  static const ChangeDay = '/change_day';
  static const myProfile = '/my-profile';
  static var SETTINGS ='/settings';
  static var SUPPORT_CHAT ='/support-chat';
  static var TERMS_CONDITION ='/terms-condition';
  static var VERFICATION_CODE ='/verification-code';
  static var PRIVACY_POLICY ='/privacy-policy';


  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
