import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension LangEx on CommonLang {
  String tr() {
    return this.name.tr;
  }
}

enum CommonLang {
  selectDateHint,
  selectDate,
  couponApplied,
  enterEmail,
  appName,
  language,
  pleaseSignIn,
  enterUrDipstoreAcc,
  next,
  start,
  signIn,
  signUp,
  selectLanguage,
  english,
  usernameEmail,
  password,
  forgotPassword,
  orLoginWith,
  myRequests,
  myBeneficiary,
  payment,
  paymentMethods,
  contactUs,
  settings,
  myProfile,
  notifications,
  emptyMsg,
  notificationEmptyMsg,
  startShopping,
  add,
  reserPassword,
  legalName,
  gender,
  birthDate,
  relationship,
  male,
  female,
  father,
  mother,
  son,
  friend,
  residenceCountry,
  select,
  date,
  info,
  program,
  personalInfo,
  Fullname,
  Username,
  Email,
  ConfirmPassword,
  Settings,
  MyWallet,
  MyProfile,
  ContactUs,
  MyOrders,
  Phone,
  Residencecountry,
  City,
  Address,
  Nationality,
  Afghanistan,
  identitytype,
  Passport,
  identitynumber,
  ExpiryDate,
  Uploadfile,
  WaitforReview,
  wallet,
  changeDay,
  requestWithdraw,
  yourBalance,
  change,
  changeDaySuccess,
  sar,
  selectYourMoney,
  goHome,
  yourProfile,
  request,
  logout,
  myAccount,
  genralSettings,
  other,
  yourDaysAvailable,
  support,
  termsAndconditions,
  privacyPolicy,
  reviewApp,
  sendCode,
  done,
  accept,
  enterCode,
  codeSentTo,
  verify,
  passwordNotEqual,
  fillData,
  startUmra,
  endUmrah,
  umrahCompleted,
  umrahCanceledByProvider,
  umrahCanceledByAdmin,
  validIdNumber,
  gallery,
  camera,
  linkSent,
  tryAgain
}

class MyLanguages extends Translations {
  Map<String, String> arStrings = {};
  Map<String, String> enStrings = {};

  static const enKey = 'ar';
  static const arKey = 'en';

  @override
  Map<String, Map<String, String>> get keys {

    addString(
        key: CommonLang.selectDateHint.name,
        enValue: 'You can select one day or multi days',
        arValue: 'يمكنك تحديد يوم واحد أو عدة أيام');
    addString(
        key: CommonLang.selectDate.name,
        enValue: 'Select day',
        arValue: 'اختار اليوم');
    addString(
        key: CommonLang.couponApplied.name,
        enValue: 'Coupon Applied',
        arValue: 'تم تطبيق القسيمة');
    addString(
        key: CommonLang.appName.name,
        enValue: 'Umra Aoo',
        arValue: 'إبلكيشن العمرة');
    addString(key: CommonLang.next.name, enValue: 'Next', arValue: 'التالي');
    addString(
        key: CommonLang.pleaseSignIn.name,
        enValue: 'Please Sign In',
        arValue: 'الرجاء تسجيل الدخول');
    addString(
        key: CommonLang.enterUrDipstoreAcc.name,
        enValue:
            'Enter your   account details for a personalised experience.',
        arValue: 'أدخل تفاصيل حساب   الخاص بك للحصول على تجربة شخصية');
    addString(
        key: CommonLang.reserPassword.name,
        enValue:
        'Reset Password',
        arValue: 'اعاده ضبط كلمه السر');
    addString(key: CommonLang.start.name, enValue: 'Start', arValue: 'ابدأ');
    addString(
        key: CommonLang.signIn.name,
        enValue: 'Sign In',
        arValue: 'تسجيل الدخول');
    addString(key: CommonLang.signUp.name, enValue: 'Sign Up', arValue: 'سجل');
    addString(
        key: CommonLang.selectLanguage.name,
        enValue: 'Select language',
        arValue: 'اختار اللغة');
    addString(
        key: CommonLang.english.name, enValue: 'العربية', arValue: 'English');
    addString(
        key: CommonLang.usernameEmail.name,
        enValue: 'Username or Email',
        arValue: 'اسم المستخدم أو البريد الالكتروني');
    addString(
        key: CommonLang.password.name,
        enValue: 'Password',
        arValue: 'كلمة السر');
    addString(
        key: CommonLang.forgotPassword.name,
        enValue: 'Forgot password',
        arValue: 'نسيت كلمة السر');

    addString(
        key: CommonLang.orLoginWith.name,
        enValue: 'Or Sign In with',
        arValue: 'أو تسجيل الدخول باستخدام');
    addString(
        key: CommonLang.Fullname.name,
        enValue: 'Fullname',
        arValue: 'الاسم الكامل');
    addString(
        key: CommonLang.Username.name,
        enValue: 'Username',
        arValue: 'اسم المستخدم');
    addString(
        key: CommonLang.Email.name,
        enValue: 'Email',
        arValue: 'البريد الإلكتروني');
    addString(
        key: CommonLang.ConfirmPassword.name,
        enValue: 'Confirm Password ',
        arValue: 'تأكيد كلمة المرور');
    addString(
        key: CommonLang.MyWallet.name,
        enValue: 'My Wallet ',
        arValue: 'محفظتى');
    addString(
        key: CommonLang.ContactUs.name,
        enValue: 'Contact Us ',
        arValue: 'اتصل بنا');
    addString(
        key: CommonLang.Settings.name, enValue: 'Settings', arValue: 'إعدادات');
    addString(
        key: CommonLang.MyProfile.name,
        enValue: 'My Profile ',
        arValue: 'ملفي');
    addString(
        key: CommonLang.MyOrders.name,
        enValue: 'My Orders ',
        arValue: 'طلباتي');
    addString(key: CommonLang.Phone.name, enValue: 'Phone ', arValue: 'هاتف');
    addString(key: CommonLang.sendCode.name, enValue: 'Send Code ', arValue: 'إرسل الرمز');
    addString(
        key: CommonLang.Residencecountry.name,
        enValue: 'Residence country ',
        arValue: 'بلد الإقامة');
    addString(key: CommonLang.City.name, enValue: 'City', arValue: 'مدينة');
    addString(
        key: CommonLang.Address.name, enValue: 'Address', arValue: 'العنوان');
    addString(
        key: CommonLang.Nationality.name,
        enValue: 'Nationality',
        arValue: 'جنسية');
    addString(
        key: CommonLang.Afghanistan.name,
        enValue: 'Afghanistan',
        arValue: 'أفغانستان');
    addString(
        key: CommonLang.identitynumber.name,
        enValue: 'identity number',
        arValue: 'رقم الهوية');
    addString(
        key: CommonLang.Passport.name,
        enValue: 'Passport',
        arValue: 'جواز سفر');
    addString(
        key: CommonLang.identitytype.name,
        enValue: 'identity type',
        arValue: 'نوع الهوية');
    addString(
        key: CommonLang.Uploadfile.name,
        enValue: 'Upload file',
        arValue: 'رفع ملف');
    addString(
        key: CommonLang.ExpiryDate.name,
        enValue: 'Expiry Date',
        arValue: 'تاريخ انتهاء الصلاحية');
    addString(
        key: CommonLang.WaitforReview.name,
        enValue: 'Wait for Review',
        arValue: 'انتظر المراجعة');

    addString(key: CommonLang.language.name,
        enValue: 'Language',
        arValue: 'اللغة');
    addString(key: CommonLang.yourProfile.name,
        enValue: 'Your Profile',
        arValue: 'الصفحة الشخصية');
    addString(key: CommonLang.request.name,
        enValue: 'Request',
        arValue: 'طلب');
    addString(
        key: CommonLang.myRequests.name,
        enValue: 'My Requests',
        arValue: 'طلباتي');
    addString(
        key: CommonLang.myBeneficiary.name,
        enValue: 'My Beneficiary',
        arValue: 'المستفيد الخاص بي');
    addString(
        key: CommonLang.payment.name, enValue: 'Payment', arValue: 'الدفع');
    addString(  key: CommonLang.paymentMethods.name, enValue: 'Payment Methods', arValue: 'طرق الدفع');
    addString(
        key: CommonLang.contactUs.name,
        enValue: 'Contact Us',
        arValue: 'اتصل بنا');
    addString(
        key: CommonLang.settings.name,
        enValue: 'Settings',
        arValue: 'الأعدادات');
    addString(
        key: CommonLang.myProfile.name, enValue: 'My Profile', arValue: 'ملفي');
    addString(
        key: CommonLang.notifications.name,
        enValue: 'Notifications',
        arValue: 'الإشعارات');
    addString(
        key: CommonLang.emptyMsg.name,
        enValue: 'Nothing to see yet',
        arValue: 'لا شيء لرؤيته حتى الآن');
    addString(
        key: CommonLang.notificationEmptyMsg.name,
        enValue:
            'You’ll get updates on your account and shopping activity here',
        arValue: 'ستتلقى تحديثات بشأن حسابك وأنشطة التسوق هنا');
    addString(
        key: CommonLang.startShopping.name,
        enValue: 'Start Shopping',
        arValue: 'ابدأ التسوق');
    addString(key: CommonLang.add.name, enValue: 'Add', arValue: 'إضافه');
    addString(
        key: CommonLang.legalName.name,
        enValue: 'Name',
        arValue: 'الاسم');
    addString(key: CommonLang.gender.name, enValue: 'Gender', arValue: 'النوع');
    addString(
        key: CommonLang.birthDate.name,
        enValue: 'Birth Date',
        arValue: 'تاريخ الميلاد');
    addString(key: CommonLang.select.name, enValue: 'Select', arValue: 'أختر');
    addString(
        key: CommonLang.relationship.name,
        enValue: 'Relationship',
        arValue: 'القرابه');
    addString(key: CommonLang.male.name,
        enValue: 'Male',
        arValue: 'ذكر');
    addString(key: CommonLang.female.name,
        enValue: 'Female',
        arValue: 'أنثي');
    addString(key: CommonLang.father.name,
        enValue: 'Father',
        arValue: 'أب');
    addString(key: CommonLang.mother.name,
        enValue: 'Mother',
        arValue: 'أم');
    addString(key: CommonLang.son.name,
        enValue: 'Son',
        arValue: 'أب');
    addString(key: CommonLang.friend.name,
        enValue: 'Friend',
        arValue: 'صديق');
    addString(key: CommonLang.logout.name,
        enValue: 'Log Out',
        arValue: 'تسجيل خروج');
    addString(
        key: CommonLang.residenceCountry.name,
        enValue: 'Residence Country',
        arValue: 'بلد الإقامة');
    addString(key: CommonLang.date.name,
        enValue: 'Date',
        arValue: 'التاريخ');
    addString(
        key: CommonLang.program.name,
        enValue: 'Program',
        arValue: 'البرنامج');
    addString(key: CommonLang.info.name,
        enValue: 'Info',
        arValue: 'تفاصيل');
    addString(
        key: CommonLang.personalInfo.name,
        enValue: 'Personal Info',
        arValue: 'البيانات الشخصية');
    addString(
        key: CommonLang.requestWithdraw.name,
        enValue: 'Request withdraw',
        arValue: 'طلب سحب');
    addString(
        key: CommonLang.yourBalance.name,
        enValue: 'Your balance',
        arValue: 'رصيدك');
    addString(
        key: CommonLang.wallet.name,
        enValue: 'Wallet',
        arValue: 'المحفظة');
    addString(key: CommonLang.change.name,
        enValue: 'Change',
        arValue: 'تغيير');
    addString(
        key: CommonLang.changeDay.name,
        enValue: 'Change day',
        arValue: 'تغيير اليوم');
    addString(
        key: CommonLang.changeDaySuccess.name,
        enValue: 'Change day was sent successfully',
        arValue: 'تم ارسال تغيير اليوم بنجاح');
    addString(key: CommonLang.sar.name, enValue: 'SAR', arValue: 'ر.س');
    addString(
        key: CommonLang.selectYourMoney.name,
        enValue: 'Select your money',
        arValue: 'اختر اموالك');
    addString(
        key: CommonLang.goHome.name,
        enValue: 'Go to home',
        arValue: 'الرئيسية');
    addString(
        key: CommonLang.myAccount.name,
        enValue: 'My account',
        arValue: 'حسابي');
    addString(
        key: CommonLang.genralSettings.name,
        enValue: 'General Setting',
        arValue: 'اعدادات عامة');
    addString(
        key: CommonLang.other.name,
        enValue: 'Other',
        arValue: 'أخرى');
    addString(
        key: CommonLang.yourDaysAvailable.name,
        enValue: 'Your Days available',
        arValue: 'الايام المتاحة');
    addString(
        key: CommonLang.support.name,
        enValue: 'Support',
        arValue: 'الدعم');
    addString(
        key: CommonLang.termsAndconditions.name,
        enValue: 'Terms & Conditions',
        arValue: 'الشروط و الاحكام');
    addString(
        key: CommonLang.privacyPolicy.name,
        enValue: 'Privacy policy',
        arValue: 'سياسة الخصوصية');
    addString(
        key: CommonLang.reviewApp.name,
        enValue: 'Review app',
        arValue: 'قيم التطبيق');
    addString(
        key: CommonLang.done.name,
        enValue: 'Done',
        arValue: 'تم');

    addString(
        key: CommonLang.accept.name,
        enValue: 'Accept',
        arValue: 'موافق');

    addString(
        key: CommonLang.enterCode.name,
        enValue: 'Enter the code',
        arValue: 'ادخل الرمز');
    addString(
        key: CommonLang.codeSentTo.name,
        enValue: "An authentification code has been sent to",
        arValue: 'تم إرسال رمز المصادقة إلى');
    addString(
        key: CommonLang.verify.name,
        enValue: 'Verify',
        arValue: 'تحقق');
    addString(
        key: CommonLang.passwordNotEqual.name,
        enValue: 'password does not match',
        arValue: 'كلمة السر غير متطابقة');
    addString(
        key: CommonLang.fillData.name,
        enValue: 'You must fill all data',
        arValue: 'يجب ملئ كل البيانات');
    addString(key: CommonLang.endUmrah.name, enValue: "End Umrah", arValue: "أنهاء العمرة");

    addString(key: CommonLang.startUmra.name, enValue: "Start Umrah", arValue: "ابدأ العمره");

    addString(key: CommonLang.umrahCompleted.name, enValue: "Umrah Completed", arValue: "انتهت العمرة");
    addString(key: CommonLang.umrahCanceledByProvider.name, enValue: "Umrah Canceled By Provider", arValue: "تم إلغاء العمرة عن طريق المعتمر");
    addString(key: CommonLang.umrahCanceledByAdmin.name, enValue: "Umrah Canceled By Admin", arValue: "تم إلغاء العمرة عن طريق الأدمن");
    addString(key: CommonLang.gallery.name, enValue: "Gallery", arValue: "الاستوديو");
    addString(key: CommonLang.camera.name, enValue: "Camera", arValue: "الكاميرا");
    addString(key: CommonLang.linkSent.name, enValue: "Link has sent to your email address", arValue: "تم إرسال الرابط إلى عنوان بريدك الإلكتروني");

    addString(key: CommonLang.enterEmail.name, enValue: "Enter email address", arValue: "أدخل البريد الاليكتروني");
    addString(key: CommonLang.tryAgain.name, enValue: "Try again", arValue: "حاول مرة اخرى");


    return {arKey: enStrings, enKey: arStrings};
  }

  addString({required String key, String? enValue, String? arValue}) {
    if (enValue != null) enStrings[key] = enValue;
    if (arValue != null) arStrings[key] = arValue;
  }

  static changeAppLanguage() {
    SharedPreferences.getInstance().then((pref) {
      if (Get.locale!.languageCode == MyLanguages.arKey) {
        pref.setString(CommonLang.language.name, MyLanguages.arKey);
        Get.updateLocale(const Locale(MyLanguages.arKey));
      } else {
        pref.setString(CommonLang.language.name, MyLanguages.arKey);
        Get.updateLocale(const Locale(MyLanguages.arKey));
      }
    });
  }
}
