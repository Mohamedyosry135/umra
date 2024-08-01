class ProviderDatesModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  Data? data;
  List? messages;
  bool? isSuccess;
  dynamic exception;

  ProviderDatesModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  ProviderDatesModel.fromJson(json) {
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
    if (this.messages != null) {
      data['Messages'] = this.messages!.map((v) => v.toJson()).toList();
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
  List<Dates>? dates;

  Data(
      {this.id,
        this.uniqueId,
        this.rowVersion,
        this.umrahPackageId,
        this.umrahPackageName,
        this.providerAppUserId,
        this.dates});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    umrahPackageId = json['UmrahPackageId'];
    umrahPackageName = json['UmrahPackageName'];
    providerAppUserId = json['ProviderAppUserId'];
    if (json['Dates'] != null) {
      dates = <Dates>[];
      json['Dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['UmrahPackageId'] = this.umrahPackageId;
    data['UmrahPackageName'] = this.umrahPackageName;
    data['ProviderAppUserId'] = this.providerAppUserId;
    if (this.dates != null) {
      data['Dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  String? availableDate;
  int? count;

  Dates({this.availableDate, this.count});

  Dates.fromJson(Map<String, dynamic> json) {
    availableDate = json['AvailableDate'];
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AvailableDate'] = this.availableDate;
    data['Count'] = this.count;
    return data;
  }
}