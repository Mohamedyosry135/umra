class SearchUmrahPackageRequestModel {
  dynamic total;
  dynamic pageNumber;
  dynamic pageSize;
  dynamic filter;
  List<ProviderData>? data;
  List<dynamic>? messages;
  bool? isSuccess;
  dynamic exception;

  SearchUmrahPackageRequestModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.messages,
      this.isSuccess,
      this.exception});

  SearchUmrahPackageRequestModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <ProviderData>[];
      json['Data'].forEach((v) {
        data!.add(ProviderData.fromJson(v));
      });
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Total'] = total;
    data['PageNumber'] = pageNumber;
    data['PageSize'] = pageSize;
    data['Filter'] = filter;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // if (messages != null) {
    //   data['Messages'] = messages!.map((v) => v.toJson()).toList();
    // }
    data['IsSuccess'] = isSuccess;
    data['Exception'] = exception;
    return data;
  }
}

class ProviderData {
  dynamic providerAppUserId;
  dynamic providerNoOfOrders;
  String? providerAppName;
  dynamic providerRate;
  dynamic umrahPackageId;
  String? umrahPackageName;
  String? umrahPackageProgram;
  dynamic umrahPackagePrice;
  dynamic umrahPackageDuring;
  String? requestDate;
  String? availableDate;

  ProviderData(
      {this.providerAppUserId,
      this.providerNoOfOrders,
      this.providerAppName,
      this.providerRate,
      this.umrahPackageId,
      this.umrahPackageName,
      this.umrahPackageProgram,
      this.umrahPackagePrice,
      this.umrahPackageDuring,
      this.availableDate,
      this.requestDate});

  ProviderData.fromJson(Map<String, dynamic> json) {
    providerAppUserId = json['ProviderAppUserId'];
    providerNoOfOrders = json['ProviderNoOfOrders'];
    providerAppName = json['ProviderAppName'];
    providerRate = json['ProviderRate'];
    umrahPackageId = json['UmrahPackageId'];
    umrahPackageName = json['UmrahPackageName'];
    umrahPackageProgram = json['UmrahPackageProgram'];
    umrahPackagePrice = json['UmrahPackagePrice'];
    umrahPackageDuring = json['UmrahPackageDuring'];
    requestDate = json['RequestDate'];
    availableDate = json['AvailableDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProviderAppUserId'] = providerAppUserId;
    data['ProviderNoOfOrders'] = providerNoOfOrders;
    data['ProviderAppName'] = providerAppName;
    data['ProviderRate'] = providerRate;
    data['UmrahPackageId'] = umrahPackageId;
    data['UmrahPackageName'] = umrahPackageName;
    data['UmrahPackageProgram'] = umrahPackageProgram;
    data['UmrahPackagePrice'] = umrahPackagePrice;
    data['UmrahPackageDuring'] = umrahPackageDuring;
    data['RequestDate'] = requestDate;
    data['AvailableDate'] = availableDate;
    return data;
  }
}
