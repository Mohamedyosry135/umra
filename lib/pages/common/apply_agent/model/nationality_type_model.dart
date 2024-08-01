import 'package:umra/services/auth_service.dart';

class NationalityTypeModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  List<NationalityDetails>? data;
  List<String>? messages;
  bool? isSuccess;
  String? exception;

  NationalityTypeModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  NationalityTypeModel.fromJson( json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    if (json['Data'] != null) {
      data = <NationalityDetails>[];
      json['Data'].forEach((v) {
        data!.add(new NationalityDetails.fromJson(v));
      });
    }
    messages = json['Messages'].cast<String>();
    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Messages'] = this.messages;
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class NationalityDetails {
  int? id;
  String? nameAr;
  String? nameEn;
  String? uniqueId;
  String? rowVersion;
  String? nameUzbek;
  String? nameRussian;
  String? name;

  NationalityDetails(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.uniqueId,
        this.rowVersion,
        this.nameUzbek,
        this.nameRussian,
        this.name});

  @override
  String toString(){
    return AuthService.to.language == 'en' ? this.nameEn ??"": this.nameAr ??"";
  }
  NationalityDetails.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    nameUzbek = json['NameUzbek'];
    nameRussian = json['NameRussian'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['NameAr'] = this.nameAr;
    data['NameEn'] = this.nameEn;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['NameUzbek'] = this.nameUzbek;
    data['NameRussian'] = this.nameRussian;
    data['Name'] = this.name;
    return data;
  }
}
