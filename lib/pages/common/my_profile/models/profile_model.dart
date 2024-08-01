class ProfileModel {
  Result? result;
  int? id;
  dynamic? exception;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;
  dynamic? asyncState;
  bool? isFaulted;

  ProfileModel(
      {this.result,
        this.id,
        this.exception,
        this.status,
        this.isCanceled,
        this.isCompleted,
        this.isCompletedSuccessfully,
        this.creationOptions,
        this.asyncState,
        this.isFaulted});

  ProfileModel.fromJson( json) {
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    id = json['Id'];
    exception = json['Exception'];
    status = json['Status'];
    isCanceled = json['IsCanceled'];
    isCompleted = json['IsCompleted'];
    isCompletedSuccessfully = json['IsCompletedSuccessfully'];
    creationOptions = json['CreationOptions'];
    asyncState = json['AsyncState'];
    isFaulted = json['IsFaulted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    data['Id'] = this.id;
    data['Exception'] = this.exception;
    data['Status'] = this.status;
    data['IsCanceled'] = this.isCanceled;
    data['IsCompleted'] = this.isCompleted;
    data['IsCompletedSuccessfully'] = this.isCompletedSuccessfully;
    data['CreationOptions'] = this.creationOptions;
    data['AsyncState'] = this.asyncState;
    data['IsFaulted'] = this.isFaulted;
    return data;
  }
}

class Result {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic? filter;
  Data? data;
  // List<Null>? messages;
  bool? isSuccess;
  dynamic? exception;

  Result(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        // this.messages,
        this.isSuccess,
        this.exception});

  Result.fromJson(Map<String, dynamic> json) {
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
  dynamic? firstName;
  dynamic? secondName;
  dynamic? thirdName;
  String? verificationCode;
  String? fullName;
  dynamic? fullNameEn;
  String? email;
  dynamic? password;
  String? userName;
  bool? isActive;
  int? totalNotifications;
  String? phoneNumber;
  String? extension;
  dynamic? uRN;
  bool? isSelected;
  String? uniqueId;
  bool? isExternal;
  String? userId;
  dynamic? titleId;
  dynamic? userRoles;
  dynamic? userRoleNames;
  dynamic? title;
  int? profileAttachmentId;
  dynamic? path;
  ProfileAttachment? profileAttachment;
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
        this.idFrontAttachment});

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
    profileAttachment = json['ProfileAttachment'] != null
        ? new ProfileAttachment.fromJson(json['ProfileAttachment'])
        : null;
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
    if (this.profileAttachment != null) {
      data['ProfileAttachment'] = this.profileAttachment!.toJson();
    }
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
    return data;
  }
}

class ProfileAttachment {
  int? id;
  dynamic? uniqueId;
  String? fileName;
  String? fileDownloadName;
  String? fileType;
  int? fileSize;
  String? filePath;
  String? path;

  ProfileAttachment(
      {this.id,
        this.uniqueId,
        this.fileName,
        this.fileDownloadName,
        this.fileType,
        this.fileSize,
        this.filePath,
        this.path});

  ProfileAttachment.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    fileName = json['FileName'];
    fileDownloadName = json['FileDownloadName'];
    fileType = json['FileType'];
    fileSize = json['FileSize'];
    filePath = json['FilePath'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['FileName'] = this.fileName;
    data['FileDownloadName'] = this.fileDownloadName;
    data['FileType'] = this.fileType;
    data['FileSize'] = this.fileSize;
    data['FilePath'] = this.filePath;
    data['Path'] = this.path;
    return data;
  }
}
