import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';

extension LangEx on ProviderLang {
  String tr() {
    return name.tr;
  }
}

enum ProviderLang {
  test,
  TodayRequests,
  AhmedAdel,
  Date,
  July,
  IDFront,
  IDBack,
  yourAvailableDays,
  yourDaysHint,
  selectAllMonth,
  myRequests,
  urTask,
  uploadVideo,
  uploadPhoto,
  uploadAudio,
  cancel,
   willEndUmraFor,
  total,
  youHave,
  requests,
  finishStepAlert,
  endUmrahError,
  addDay,
  numUmraPerDay,
  enterNumOfUmrah,
  add

}

class ProviderLanguages extends MyLanguages {
  @override
  Map<String, Map<String, String>> get keys {
    super.keys;
    addString(key: ProviderLang.addDay.name, enValue: "Add Day", arValue: "اضف يوم");
    addString(key: ProviderLang.numUmraPerDay.name, enValue: "Number of umrah per day", arValue: "عدد العمرات في اليوم الواحد");
    addString(key: ProviderLang.enterNumOfUmrah.name, enValue: "Enter the number of umrah", arValue: "أدخل عدد العمرات");
    addString(key: ProviderLang.add.name, enValue: "Add", arValue: "أضف");

    addString(key: ProviderLang.test.name, enValue: "info", arValue: "معلومات");
    addString(key: CommonLang.appName.name, enValue: "Provider App", arValue: "ابلكيشن المعتمر");
    addString(key: ProviderLang.TodayRequests.name, enValue: "Today Requests", arValue: "طلبات اليوم");
    addString(key: ProviderLang.AhmedAdel.name, enValue: "Ahmed Adel", arValue: "احمد كامل");
    addString(key: ProviderLang.Date.name, enValue: "Date:", arValue: "تاريخ:");
    addString(key: ProviderLang.July.name, enValue: "15 July", arValue: "15 يوليو");
    addString(key: ProviderLang.IDBack.name, enValue: "ID Back", arValue: "معرف العودة");
    addString(key: ProviderLang.total.name, enValue: "total", arValue: "مجموع");
    addString(key: ProviderLang.IDFront.name, enValue: "ID Front", arValue: "معرف الجبهة");
    addString(key: ProviderLang.yourAvailableDays.name, enValue: "Your Days available", arValue: "أيامك متاحة");
    addString(key: ProviderLang.selectAllMonth.name, enValue: "Select all days from these month", arValue: "حدد كل الأيام من هذا الشهر");
    addString(key: ProviderLang.yourDaysHint.name, enValue: "You can select your availability days from calendar and you can cancel these day before 4 days your booking", arValue: "يمكنك تحديد أيام التوفر الخاصة بك من التقويم ويمكنك إلغاء هذه الأيام قبل 4 أيام من الحجز");
    addString(key: ProviderLang.myRequests.name, enValue: "MyRequests", arValue: "طلباتي");
    addString(key: ProviderLang.urTask.name, enValue: "Your Task:", arValue: "مهمتك:");
    addString(key: ProviderLang.uploadVideo.name, enValue: "Upload Video", arValue: "حمل الفيديو");
    addString(key: ProviderLang.uploadPhoto.name, enValue: "Upload Photo", arValue: "حمل صورة");
    addString(key: ProviderLang.uploadAudio.name, enValue: "Upload Audio", arValue: "حمل صوت");
    addString(key: ProviderLang.cancel.name, enValue: "Cancel", arValue: "الغاء");
     addString(key: ProviderLang.willEndUmraFor.name, enValue: "You will end the umra for", arValue: "ستنتهي العمرة");
    addString(key: ProviderLang.youHave.name, enValue: "You have", arValue: "لديك");
    addString(key: ProviderLang.requests.name, enValue: "requests", arValue: "طلبات");
    addString(key: ProviderLang.finishStepAlert.name, enValue: "You must finish dependency steps first:\n", arValue: "يجب عليك إنهاء خطوات التبعية أولاً:\n");
    addString(key: ProviderLang.endUmrahError.name, enValue: "You must finish all umrah steps first", arValue: "يجب عليك إنهاء كل خطوات العمره أولا");


    return {
      MyLanguages.arKey: enStrings,
      MyLanguages.enKey: arStrings
    };
  }
}
