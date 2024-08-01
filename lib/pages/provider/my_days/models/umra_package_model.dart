class UmraPackageModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  List<Data>? data;
  List<dynamic>? messages;
  bool? isSuccess;
  dynamic exception;

  UmraPackageModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.messages,
      this.isSuccess,
      this.exception});

  UmraPackageModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
}

class Data {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? nameUzbek;
  String? nameRussian;
  double? price;
  int? totalSteps;
  String? program;
  String? dateFrom;
  String? dateTo;
  int? packageDuring;
  String? uniqueId;
  String? rowVersion;
  List<dynamic>? umrahPackageSteps;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
    // if (json['UmrahPackageSteps'] != null) {
    //   umrahPackageSteps = <Null>[];
    //   json['UmrahPackageSteps'].forEach((v) {
    //     umrahPackageSteps!.add(new Null.fromJson(v));
    //   });
    // }
  }
}
