class LoginResponseModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic? filter;
  Data? data;
  List<Null>? messages;
  bool? isSuccess;
  dynamic? exception;

  LoginResponseModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  LoginResponseModel.fromJson( json) {
    print("json ${json}");
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
  dynamic? claimsIdentity;
  AppUsers? appUsers;
  String? token;
  String? refreshToken;
  dynamic? otpCode;
  int? otpTimeOut;
  dynamic? lang;
  dynamic? needOTP;

  Data(
      {this.claimsIdentity,
        this.appUsers,
        this.token,
        this.refreshToken,
        this.otpCode,
        this.otpTimeOut,
        this.lang,
        this.needOTP});

  Data.fromJson(Map<String, dynamic> json) {
    claimsIdentity = json['claimsIdentity'];
    appUsers = json['AppUsers'] != null
        ? new AppUsers.fromJson(json['AppUsers'])
        : null;
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    otpCode = json['OtpCode'];
    otpTimeOut = json['OtpTimeOut'];
    lang = json['Lang'];
    needOTP = json['NeedOTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['claimsIdentity'] = this.claimsIdentity;
    if (this.appUsers != null) {
      data['AppUsers'] = this.appUsers!.toJson();
    }
    data['Token'] = this.token;
    data['RefreshToken'] = this.refreshToken;
    data['OtpCode'] = this.otpCode;
    data['OtpTimeOut'] = this.otpTimeOut;
    data['Lang'] = this.lang;
    data['NeedOTP'] = this.needOTP;
    return data;
  }
}

class AppUsers {
  int? id;
  String? userName;
  String? fullName;
  String? fullNameEn;
  String? title;
  int? profileAttachmentId;
  ProfileAttachment? profileAttachment;
  bool? isEnabled;

  AppUsers(
      {this.id,
        this.userName,
        this.fullName,
        this.fullNameEn,
        this.title,
        this.profileAttachmentId,
        this.profileAttachment,
        this.isEnabled});

  AppUsers.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userName = json['UserName'];
    fullName = json['FullName'];
    fullNameEn = json['FullNameEn'];
    title = json['Title'];
    profileAttachmentId = json['ProfileAttachmentId'];
    profileAttachment = json['ProfileAttachment'] != null
        ? new ProfileAttachment.fromJson(json['ProfileAttachment'])
        : null;
    isEnabled = json['IsEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UserName'] = this.userName;
    data['FullName'] = this.fullName;
    data['FullNameEn'] = this.fullNameEn;
    data['Title'] = this.title;
    data['ProfileAttachmentId'] = this.profileAttachmentId;
    if (this.profileAttachment != null) {
      data['ProfileAttachment'] = this.profileAttachment!.toJson();
    }
    data['IsEnabled'] = this.isEnabled;
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
