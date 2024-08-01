class CheckPromoCodeModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  Data? data;
  List? messages;
  bool? isSuccess;
  dynamic exception;

  CheckPromoCodeModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.messages,
      this.isSuccess,
      this.exception});

  CheckPromoCodeModel.fromJson( json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
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
  String? uniqueId;
  String? rowVersion;
  String? start;
  String? end;
  String? code;
  int? discountType;
  double? discountValue;
  String? discountTypeName;
  bool? isActive;

  Data(
      {this.id,
      this.uniqueId,
      this.rowVersion,
      this.start,
      this.end,
      this.code,
      this.discountType,
      this.discountValue,
      this.discountTypeName,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    start = json['Start'];
    end = json['End'];
    code = json['Code'];
    discountType = json['DiscountType'];
    discountValue = json['DiscountValue'];
    discountTypeName = json['DiscountTypeName'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UniqueId'] = uniqueId;
    data['RowVersion'] = rowVersion;
    data['Start'] = start;
    data['End'] = end;
    data['Code'] = code;
    data['DiscountType'] = discountType;
    data['DiscountValue'] = discountValue;
    data['DiscountTypeName'] = discountTypeName;
    data['IsActive'] = isActive;
    return data;
  }
}
