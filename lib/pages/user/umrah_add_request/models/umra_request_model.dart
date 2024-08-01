class UmraRequestModel {
  dynamic total;
  dynamic pageNumber;
  dynamic pageSize;
  dynamic filter;
  UmraRequestData? data;
  bool? isSuccess;
  dynamic exception;

  UmraRequestModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.isSuccess,
      this.exception});

  UmraRequestModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'] != null ? UmraRequestData.fromJson(json['Data']) : null;
    // if (json['Messages'] != null) {
    //   messages = <Null>[];
    //   json['Messages'].forEach((v) {
    //     messages!.add(Null.fromJson(v));
    //   });
    // }
    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Total'] = total;
    data['PageNumber'] = pageNumber;
    data['PageSize'] = pageSize;
    data['Filter'] = filter;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    // if (messages != null) {
    //   data['Messages'] = messages!.map((v) => v.toJson()).toList();
    // }
    data['IsSuccess'] = isSuccess;
    data['Exception'] = exception;
    return data;
  }
}

class UmraRequestData {
  dynamic id;
  String? uniqueId;
  String? rowVersion;
  dynamic umrahPackageId;
  String? umrahPackageName;
  dynamic providerAppUserId;
  String? providerAppUserName;
  String? requestDate;
  dynamic umrahAppUserId;
  String? umrahAppUserName;
  String? comments;
  dynamic reason;
  dynamic beneficiaryId;
  String? beneficiaryName;
  bool? paymentStatus;
  dynamic paymentRefNumber;
  dynamic umrahPackagePrice;
  dynamic requestStatus;
  List<RequestUmrahPackageSteps>? requestUmrahPackageSteps;
  String? requestStatusName;
  String? paymentUrl;

  UmraRequestData(
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
        this.paymentUrl,
      this.requestStatusName});

  UmraRequestData.fromJson(Map<String, dynamic> json) {
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
    paymentUrl = json['PaymentUrl'];
    if (json['RequestUmrahPackageSteps'] != null) {
      requestUmrahPackageSteps = <RequestUmrahPackageSteps>[];
      json['RequestUmrahPackageSteps'].forEach((v) {
        requestUmrahPackageSteps!.add(RequestUmrahPackageSteps.fromJson(v));
      });
    }
    requestStatusName = json['RequestStatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UniqueId'] = uniqueId;
    data['RowVersion'] = rowVersion;
    data['UmrahPackageId'] = umrahPackageId;
    data['UmrahPackageName'] = umrahPackageName;
    data['ProviderAppUserId'] = providerAppUserId;
    data['ProviderAppUserName'] = providerAppUserName;
    data['RequestDate'] = requestDate;
    data['UmrahAppUserId'] = umrahAppUserId;
    data['UmrahAppUserName'] = umrahAppUserName;
    data['Comments'] = comments;
    data['Reason'] = reason;
    data['BeneficiaryId'] = beneficiaryId;
    data['BeneficiaryName'] = beneficiaryName;
    data['PaymentStatus'] = paymentStatus;
    data['PaymentRefNumber'] = paymentRefNumber;
    data['UmrahPackagePrice'] = umrahPackagePrice;
    data['RequestStatus'] = requestStatus;
    if (requestUmrahPackageSteps != null) {
      data['RequestUmrahPackageSteps'] =
          requestUmrahPackageSteps!.map((v) => v.toJson()).toList();
    }
    data['RequestStatusName'] = requestStatusName;
    return data;
  }
}

class RequestUmrahPackageSteps {
  dynamic id;
  String? uniqueId;
  String? rowVersion;
  dynamic umrahPackageStepsId;
  dynamic attachmentId;
  dynamic attachment;
  dynamic requestUmrahId;
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
    attachment = json['Attachment'];
    requestUmrahId = json['RequestUmrahId'];
    isComplate = json['IsComplate'];
    step = json['Step'] != null ? Step.fromJson(json['Step']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UniqueId'] = uniqueId;
    data['RowVersion'] = rowVersion;
    data['UmrahPackageStepsId'] = umrahPackageStepsId;
    data['AttachmentId'] = attachmentId;
    data['Attachment'] = attachment;
    data['RequestUmrahId'] = requestUmrahId;
    data['IsComplate'] = isComplate;
    if (step != null) {
      data['Step'] = step!.toJson();
    }
    return data;
  }
}

class Step {
  dynamic id;
  bool? isRequied;
  dynamic sortNumber;
  String? description;
  String? title;
  dynamic mediaType;
  String? uniqueId;
  String? rowVersion;
  dynamic dependenceIds;

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
    dependenceIds = json['DependenceIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['IsRequied'] = isRequied;
    data['SortNumber'] = sortNumber;
    data['Description'] = description;
    data['Title'] = title;
    data['MediaType'] = mediaType;
    data['UniqueId'] = uniqueId;
    data['RowVersion'] = rowVersion;
    data['DependenceIds'] = dependenceIds;
    return data;
  }
}
