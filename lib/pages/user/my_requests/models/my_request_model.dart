import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';

class MyUmraRequestsModel {
  dynamic total;
  dynamic pageNumber;
  dynamic pageSize;
  dynamic filter;
  List<UmraRequestData>? data;
  bool? isSuccess;
  dynamic exception;

  MyUmraRequestsModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.isSuccess,
      this.exception});

  MyUmraRequestsModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <UmraRequestData>[];
      json['Data'].forEach((v) {
        data!.add(UmraRequestData.fromJson(v));
      });
    }
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
    // if (this.data != null) {
    //   data['Data'] = this.data!.toJson();
    // }
    // if (messages != null) {
    //   data['Messages'] = messages!.map((v) => v.toJson()).toList();
    // }
    data['IsSuccess'] = isSuccess;
    data['Exception'] = exception;
    return data;
  }
}
