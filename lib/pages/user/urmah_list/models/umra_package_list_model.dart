class UmrahPackageListModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  List<PackageData>? data;
  List<dynamic>? messages;
  bool? isSuccess;
  dynamic exception;

  UmrahPackageListModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.messages,
      this.isSuccess,
      this.exception});

  UmrahPackageListModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <PackageData>[];
      json['Data'].forEach((v) {
        data!.add(PackageData.fromJson(v));
      });
    }
    if (json['Messages'] != null) {
      messages = json['Messages'];
    }
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

    data['IsSuccess'] = isSuccess;
    data['Exception'] = exception;
    return data;
  }
}

class PackageData {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? nameUzbek;
  String? nameRussian;
  dynamic price;
  int? totalSteps;
  String? program;
  String? dateFrom;
  String? dateTo;
  int? packageDuring;
  String? uniqueId;
  String? rowVersion;
  List<dynamic>? umrahPackageSteps;

  PackageData(
      {this.id,
      this.name,
      this.nameEn,
      this.nameAr,
      this.nameUzbek,
      this.nameRussian,
      this.price,
      this.totalSteps,
      this.program,
      this.dateFrom,
      this.dateTo,
      this.packageDuring,
      this.uniqueId,
      this.rowVersion,
      this.umrahPackageSteps});

  PackageData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    nameEn = json['NameEn'];
    nameAr = json['NameAr'];
    nameUzbek = json['NameUzbek'];
    nameRussian = json['NameRussian'];
    price = json['Price'];
    totalSteps = json['TotalSteps'];
    program = json['Program'];
    dateFrom = json['DateFrom'];
    dateTo = json['DateTo'];
    packageDuring = json['PackageDuring'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    if (json['UmrahPackageSteps'] != null) {
      umrahPackageSteps = json['UmrahPackageSteps'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['NameEn'] = nameEn;
    data['NameAr'] = nameAr;
    data['NameUzbek'] = nameUzbek;
    data['NameRussian'] = nameRussian;
    data['Price'] = price;
    data['TotalSteps'] = totalSteps;
    data['Program'] = program;
    data['DateFrom'] = dateFrom;
    data['DateTo'] = dateTo;
    data['PackageDuring'] = packageDuring;
    data['UniqueId'] = uniqueId;
    data['RowVersion'] = rowVersion;

    return data;
  }
}
