class ProviderRateModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  List<RateModel>? data;
  bool? isSuccess;
  dynamic exception;

  ProviderRateModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.isSuccess,
        this.exception});

  ProviderRateModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <RateModel>[];
      json['Data'].forEach((v) {
        data!.add(new RateModel.fromJson(v));
      });
    }
    
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
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class RateModel {
  int? id;
  String? uniqueId;
  String? rowVersion;
  int? providerAppUserId;
  dynamic providerAppUserName;
  double? rate;
  String? comment;
  int? umrahAppUserId;
  String? umrahAppUserName;
  dynamic totalRate;
  dynamic umrahAppUserImage;

  RateModel(
      {this.id,
        this.uniqueId,
        this.rowVersion,
        this.providerAppUserId,
        this.providerAppUserName,
        this.rate,
        this.comment,
        this.umrahAppUserId,
        this.umrahAppUserName,
        this.totalRate,
        this.umrahAppUserImage});

  RateModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    providerAppUserId = json['ProviderAppUserId'];
    providerAppUserName = json['ProviderAppUserName'];
    rate = json['Rate'];
    comment = json['Comment'];
    umrahAppUserId = json['UmrahAppUserId'];
    umrahAppUserName = json['UmrahAppUserName'];
    totalRate = json['TotalRate'];
    umrahAppUserImage = json['UmrahAppUserImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['ProviderAppUserId'] = this.providerAppUserId;
    data['ProviderAppUserName'] = this.providerAppUserName;
    data['Rate'] = this.rate;
    data['Comment'] = this.comment;
    data['UmrahAppUserId'] = this.umrahAppUserId;
    data['UmrahAppUserName'] = this.umrahAppUserName;
    data['TotalRate'] = this.totalRate;
    data['UmrahAppUserImage'] = this.umrahAppUserImage;
    return data;
  }
}