class UmrahDetailsModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  Data? data;
  List<String>? messages;
  bool? isSuccess;
  String? exception;

  UmrahDetailsModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  UmrahDetailsModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    if (json['Messages'] != null) {
      messages = <String>[];
      json['Messages'].forEach((v) {
        messages!.add(v.toString());
      });
    }
    isSuccess = json['IsSuccess'];
    exception = json['Exception'].toString();
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
    if (this.messages != null) {
      data['Messages'] = this.messages!.map((v) => v.toString()).toList();
    }
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class Data {
  int? id;
  String? uniqueId;
  String? rowVersion;
  int? umrahPackageId;
  String? umrahPackageName;
  int? providerAppUserId;
  String? providerAppUserName;
  String? requestDate;
  int? umrahAppUserId;
  String? umrahAppUserName;
  String? comments;
  int? reason;
  int? beneficiaryId;
  String? beneficiaryName;
  bool? paymentStatus;
  dynamic paymentRefNumber;
  double? umrahPackagePrice;
  int? requestStatus;
  List<RequestUmrahPackageSteps>? requestUmrahPackageSteps;
  String? requestStatusName;
  String? reasonName;
  double? discount;
  double? totalPrice;
  String? cancelReason;
  String? paymentUrl;
  int? paymentType;

  Data(
      {this.id,
        this.uniqueId,
        this.rowVersion,
        this.umrahPackageId,
        this.umrahPackageName,
        this.providerAppUserId,
        this.providerAppUserName,
        this.requestDate,
        this.umrahAppUserId,
        this.umrahAppUserName,
        this.comments,
        this.reason,
        this.beneficiaryId,
        this.beneficiaryName,
        this.paymentStatus,
        this.paymentRefNumber,
        this.umrahPackagePrice,
        this.requestStatus,
        this.requestUmrahPackageSteps,
        this.requestStatusName,
        this.reasonName,
        this.discount,
        this.totalPrice,
        this.cancelReason,
        this.paymentUrl,
        this.paymentType,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    umrahPackageId = json['UmrahPackageId'];
    umrahPackageName = json['UmrahPackageName'];
    providerAppUserId = json['ProviderAppUserId'];
    providerAppUserName = json['ProviderAppUserName'];
    requestDate = json['RequestDate'];
    umrahAppUserId = json['UmrahAppUserId'];
    umrahAppUserName = json['UmrahAppUserName'];
    comments = json['Comments'];
    reason = json['Reason'];
    beneficiaryId = json['BeneficiaryId'];
    beneficiaryName = json['BeneficiaryName'];
    paymentStatus = json['PaymentStatus'];
    paymentRefNumber = json['PaymentRefNumber'];
    umrahPackagePrice = json['UmrahPackagePrice'];
    requestStatus = json['RequestStatus'];
    if (json['RequestUmrahPackageSteps'] != null) {
      requestUmrahPackageSteps = <RequestUmrahPackageSteps>[];
      json['RequestUmrahPackageSteps'].forEach((v) {
        requestUmrahPackageSteps!.add(new RequestUmrahPackageSteps.fromJson(v));
      });
    }
    requestStatusName = json['RequestStatusName'];
    reasonName = json['ReasonName'];
    discount = json['Discount'];
    totalPrice = json['TotalPrice'];
    cancelReason = json['CancelReason'];
    paymentUrl = json['PaymentUrl'];
    paymentType = json['PaymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['UmrahPackageId'] = this.umrahPackageId;
    data['UmrahPackageName'] = this.umrahPackageName;
    data['ProviderAppUserId'] = this.providerAppUserId;
    data['ProviderAppUserName'] = this.providerAppUserName;
    data['RequestDate'] = this.requestDate;
    data['UmrahAppUserId'] = this.umrahAppUserId;
    data['UmrahAppUserName'] = this.umrahAppUserName;
    data['Comments'] = this.comments;
    data['Reason'] = this.reason;
    data['BeneficiaryId'] = this.beneficiaryId;
    data['BeneficiaryName'] = this.beneficiaryName;
    data['PaymentStatus'] = this.paymentStatus;
    data['PaymentRefNumber'] = this.paymentRefNumber;
    data['UmrahPackagePrice'] = this.umrahPackagePrice;
    data['RequestStatus'] = this.requestStatus;
    data['ReasonName'] = this.reasonName;
    data['Discount'] = this.discount;
    data['TotalPrice'] = this.totalPrice;
    data['CancelReason'] = this.cancelReason;
    data['PaymentUrl'] = this.paymentUrl;
    data['PaymentType'] = this.paymentType;

    if (this.requestUmrahPackageSteps != null) {
      data['RequestUmrahPackageSteps'] =
          this.requestUmrahPackageSteps!.map((v) => v.toJson()).toList();
    }
    data['RequestStatusName'] = this.requestStatusName;
    return data;
  }
}

class RequestUmrahPackageSteps {
  int? id;
  String? uniqueId;
  String? rowVersion;
  int? umrahPackageStepsId;
  int? attachmentId;
  Attachment? attachment;
  int? requestUmrahId;
  bool? isComplate;
  Step? step;

  RequestUmrahPackageSteps(
      {this.id,
        this.uniqueId,
        this.rowVersion,
        this.umrahPackageStepsId,
        this.attachmentId,
        this.attachment,
        this.requestUmrahId,
        this.isComplate,
        this.step});

  RequestUmrahPackageSteps.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    umrahPackageStepsId = json['UmrahPackageStepsId'];
    attachmentId = json['AttachmentId'];
    requestUmrahId = json['RequestUmrahId'];
    isComplate = json['IsComplate'];
    step = json['Step'] != null ? new Step.fromJson(json['Step']) : null;
    requestUmrahId = json['RequestUmrahId'];
    isComplate = json['IsComplate'];
    step = json['Step'] != null ? new Step.fromJson(json['Step']) : null;
    attachment = json['Attachment'] != null ? new Attachment.fromJson(json['Attachment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['UmrahPackageStepsId'] = this.umrahPackageStepsId;
    data['AttachmentId'] = this.attachmentId;
    data['RequestUmrahId'] = this.requestUmrahId;
    data['IsComplate'] = this.isComplate;
    if (this.step != null) {
      data['Step'] = this.step!.toJson();
    }
    if (this.attachment != null) {
      data['Attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}

class Attachment {
  int? id;
  dynamic uniqueId;
  String? fileName;
  String? fileDownloadName;
  String? fileType;
  int? fileSize;
  String? filePath;
  String? path;

  Attachment(
      {this.id,
        this.uniqueId,
        this.fileName,
        this.fileDownloadName,
        this.fileType,
        this.fileSize,
        this.filePath,
        this.path});

  Attachment.fromJson(Map<String, dynamic> json) {
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

class Step {
  int? id;
  bool? isRequied;
  int? sortNumber;
  String? description;
  String? title;
  int? mediaType;
  String? uniqueId;
  String? rowVersion;
  List<int>? dependenceIds;

  Step(
      {this.id,
        this.isRequied,
        this.sortNumber,
        this.description,
        this.title,
        this.mediaType,
        this.uniqueId,
        this.rowVersion,
        this.dependenceIds});

  Step.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isRequied = json['IsRequied'];
    sortNumber = json['SortNumber'];
    description = json['Description'];
    title = json['Title'];
    mediaType = json['MediaType'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    if (json['DependenceIds'] != null) {
      dependenceIds = <int>[];
      json['DependenceIds'].forEach((v) {
        dependenceIds!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IsRequied'] = this.isRequied;
    data['SortNumber'] = this.sortNumber;
    data['Description'] = this.description;
    data['Title'] = this.title;
    data['MediaType'] = this.mediaType;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    if (this.dependenceIds != null) {
      data['DependenceIds'] = this.dependenceIds!.map((v) => v).toList();
    }
    return data;
  }
}