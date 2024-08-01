import 'package:get/get.dart';

class GenderModelResp {
  int? total;
  int? pageNumber;
  int? pageSize;
  Null? filter;
  List<Gender>? genders;
  List<Null>? messages;
  bool? isSuccess;
  Null? exception;

  GenderModelResp(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.genders,
        this.messages,
        this.isSuccess,
        this.exception});

  GenderModelResp.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      genders = <Gender>[];
      json['Data'].forEach((v) {
        genders!.add(new Gender.fromJson(v));
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
    if (this.genders != null) {
      data['Data'] = this.genders!.map((v) => v.toJson()).toList();
    }

    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class Gender {
  int? id;
  String? name;
  RxBool selected = false.obs;
  Gender({this.id, this.name,});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}
