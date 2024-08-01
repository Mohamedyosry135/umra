class UserEndPoints {
  static const String loginEndPoint = "AuthenticationUmrahUser/login";
  static const String addUser = "UmrahAppUser/AddUser";
  static const String verifyCode = "AuthenticationUmrahUser/Verify";
  static const String updateProfile = "UmrahAppUser/UpdateProfile";
  static const String allBeneficiary = "UmrahUserBeneficiary/GetAll";
  static const String addBeneficiary = "UmrahUserBeneficiary/Add";
  static const String getUmraPackageList = "UmrahPackage/GetAll";
  static const String getUmrahDetails = "RequestUmrah/GetUmrahUserRequestDetails/";
  static const String getSearchUmrahPackageReques = "RequestUmrah/SearchUmrahPackageRequest";
  static const String getProviderRate = "RequestUmrah/GetProviderRate";
  static const String sendUmrahRequest = "RequestUmrah/Add";
  static const String checkPromoCode = "PromoCode/CheckCode/";
  static const String getUmrahRequests = "RequestUmrah/GetUmrahUserRequests";
  static const String profile = "UmrahAppUser/GetUser";
  static const String forgetPassword = "AuthenticationUmrahUser/ForgetPassword";
  static const String termsCondition = "StaticData/GetTermsAndConditions";
  static const String privacyPolicy = "StaticData/GetPrivacyPolicy";



}

class ProviderEndPoints {
  static const String loginEndPoint = "AuthenticationProviderUser/login";
  static const String addUser = "ProviderAppUser/AddUser";
  static const String verifyCode = "AuthenticationProviderUser/Verify";
  static const String updateProfile = "ProviderAppUser/UpdateProfile";
  static const String getProviderAvailbleDates = "ProviderDatesAvailable/GetOne/";
  static const String getProviderUmraPackages = "UmrahPackage/GetAll";
  static const String postProviderUmraDays = "ProviderDatesAvailable/Add";
  static const String getProviderOrders = "RequestUmrah/GetProviderRequests";

  static const String updateProviderUmraDays = "ProviderDatesAvailable/Update";
  static const String getUmrahDetails = "RequestUmrah/GetProviderRequestDetails/";
  static const String endUmrah = "RequestUmrah/EndUmrahRequest/";
  static const String updateUmrahStep = "RequestUmrah/UpdateRequestStep";

  static const String profile = "ProviderAppUser/GetUser";
  static const String forgetPassword = "AuthenticationProviderUser/ForgetPassword";

}
