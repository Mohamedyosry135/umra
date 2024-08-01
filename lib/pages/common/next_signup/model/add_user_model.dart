class AddUserModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic? filter;
  Data? data;
  List<dynamic>? messages;
  bool? isSuccess;
  dynamic? exception;

  AddUserModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  AddUserModel.fromJson( json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    // if (json['Messages'] != null) {
    //   messages = <Null>[];
    //   json['Messages'].forEach((v) {
    //     messages!.add(new Null.fromJson(v));
    //   });
    // }
    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    data['Filter'] = this.filter;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    // if (this.messages != null) {
    //   data['Messages'] = this.messages!.map((v) => v.toJson()).toList();
    // }
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? secondName;
  String? thirdName;
  dynamic? verificationCode;
  String? fullName;
  String? fullNameEn;
  String? email;
  String? password;
  String? userName;
  bool? isActive;
  int? totalNotifications;
  String? phoneNumber;
  String? extension;
  String? uRN;
  bool? isSelected;
  String? uniqueId;
  bool? isExternal;
  String? userId;
  String? titleId;
  String? userRoles;
  String? userRoleNames;
  String? title;
  dynamic? profileAttachmentId;
  String? path;
  dynamic? profileAttachment;
  int? residenceCountryId;
  int? cityId;
  String? address;
  dynamic? nationalityId;
  int? identityType;
  dynamic? identityNumber;
  dynamic? expireDate;
  dynamic? idBackAttachmentId;
  dynamic? idBackAttachment;
  dynamic? idFrontAttachmentId;
  dynamic? idFrontAttachment;
  String? cityName;
  String? countryName;
  String? nationalityName;
  String? identityTypeName;
  int? providerStatus;
  String? providerStatusName;
  dynamic? providerStatusReason;

  Data(
      {this.id,
        this.firstName,
        this.secondName,
        this.thirdName,
        this.verificationCode,
        this.fullName,
        this.fullNameEn,
        this.email,
        this.password,
        this.userName,
        this.isActive,
        this.totalNotifications,
        this.phoneNumber,
        this.extension,
        this.uRN,
        this.isSelected,
        this.uniqueId,
        this.isExternal,
        this.userId,
        this.titleId,
        this.userRoles,
        this.userRoleNames,
        this.title,
        this.profileAttachmentId,
        this.path,
        this.profileAttachment,
        this.residenceCountryId,
        this.cityId,
        this.address,
        this.nationalityId,
        this.identityType,
        this.identityNumber,
        this.expireDate,
        this.idBackAttachmentId,
        this.idBackAttachment,
        this.idFrontAttachmentId,
        this.idFrontAttachment,
        this.cityName,
        this.countryName,
        this.nationalityName,
        this.identityTypeName,
        this.providerStatus,
        this.providerStatusName,
        this.providerStatusReason});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    secondName = json['SecondName'];
    thirdName = json['ThirdName'];
    verificationCode = json['VerificationCode'];
    fullName = json['FullName'];
    fullNameEn = json['FullNameEn'];
    email = json['Email'];
    password = json['Password'];
    userName = json['UserName'];
    isActive = json['IsActive'];
    totalNotifications = json['TotalNotifications'];
    phoneNumber = json['PhoneNumber'];
    extension = json['Extension'];
    uRN = json['URN'];
    isSelected = json['IsSelected'];
    uniqueId = json['UniqueId'];
    isExternal = json['IsExternal'];
    userId = json['UserId'];
    titleId = json['TitleId'];
    userRoles = json['UserRoles'];
    userRoleNames = json['UserRoleNames'];
    title = json['Title'];
    profileAttachmentId = json['ProfileAttachmentId'];
    path = json['Path'];
    profileAttachment = json['ProfileAttachment'];
    residenceCountryId = json['ResidenceCountryId'];
    cityId = json['CityId'];
    address = json['Address'];
    nationalityId = json['NationalityId'];
    identityType = json['IdentityType'];
    identityNumber = json['IdentityNumber'];
    expireDate = json['ExpireDate'];
    idBackAttachmentId = json['IdBackAttachmentId'];
    idBackAttachment = json['IdBackAttachment'];
    idFrontAttachmentId = json['IdFrontAttachmentId'];
    idFrontAttachment = json['IdFrontAttachment'];
    cityName = json['CityName'];
    countryName = json['CountryName'];
    nationalityName = json['NationalityName'];
    identityTypeName = json['IdentityTypeName'];
    providerStatus = json['ProviderStatus'];
    providerStatusName = json['ProviderStatusName'];
    providerStatusReason = json['ProviderStatusReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FirstName'] = this.firstName;
    data['SecondName'] = this.secondName;
    data['ThirdName'] = this.thirdName;
    data['VerificationCode'] = this.verificationCode;
    data['FullName'] = this.fullName;
    data['FullNameEn'] = this.fullNameEn;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['UserName'] = this.userName;
    data['IsActive'] = this.isActive;
    data['TotalNotifications'] = this.totalNotifications;
    data['PhoneNumber'] = this.phoneNumber;
    data['Extension'] = this.extension;
    data['URN'] = this.uRN;
    data['IsSelected'] = this.isSelected;
    data['UniqueId'] = this.uniqueId;
    data['IsExternal'] = this.isExternal;
    data['UserId'] = this.userId;
    data['TitleId'] = this.titleId;
    data['UserRoles'] = this.userRoles;
    data['UserRoleNames'] = this.userRoleNames;
    data['Title'] = this.title;
    data['ProfileAttachmentId'] = this.profileAttachmentId;
    data['Path'] = this.path;
    data['ProfileAttachment'] = this.profileAttachment;
    data['ResidenceCountryId'] = this.residenceCountryId;
    data['CityId'] = this.cityId;
    data['Address'] = this.address;
    data['NationalityId'] = this.nationalityId;
    data['IdentityType'] = this.identityType;
    data['IdentityNumber'] = this.identityNumber;
    data['ExpireDate'] = this.expireDate;
    data['IdBackAttachmentId'] = this.idBackAttachmentId;
    data['IdBackAttachment'] = this.idBackAttachment;
    data['IdFrontAttachmentId'] = this.idFrontAttachmentId;
    data['IdFrontAttachment'] = this.idFrontAttachment;
    data['CityName'] = this.cityName;
    data['CountryName'] = this.countryName;
    data['NationalityName'] = this.nationalityName;
    data['IdentityTypeName'] = this.identityTypeName;
    data['ProviderStatus'] = this.providerStatus;
    data['ProviderStatusName'] = this.providerStatusName;
    data['ProviderStatusReason'] = this.providerStatusReason;
    return data;
  }
}
