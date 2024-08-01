import 'package:umra/services/auth_service.dart';

class CountryCityResponseModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  List<Countries>? countries;
  bool? isSuccess;

  CountryCityResponseModel(
      {this.total, this.pageNumber, this.pageSize, this.countries, this.isSuccess});

  CountryCityResponseModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    if (json['Data'] != null) {
      countries = <Countries>[];
      json['Data'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    if (this.countries != null) {
      data['Data'] = this.countries!.map((v) => v.toJson()).toList();
    }
    data['IsSuccess'] = this.isSuccess;
    return data;
  }
}

class Countries {
  int? id;
  String? nameAr;
  String? nameEn;
  String? uniqueId;
  String? rowVersion;
  String? nameUzbek;
  String? nameRussian;
  String? name;
  List<Cities>? cities;

  Countries(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.uniqueId,
        this.rowVersion,
        this.nameUzbek,
        this.nameRussian,
        this.name,
        this.cities});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    nameUzbek = json['NameUzbek'];
    nameRussian = json['NameRussian'];
    name = json['Name'];
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  @override
  String toString(){
    return AuthService.to.language == 'en' ? this.nameEn ??"": this.nameAr ??"";
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
    if (this.cities != null) {
      data['Cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? nameAr;
  String? nameEn;
  String? uniqueId;
  String? rowVersion;
  String? nameUzbek;
  String? nameRussian;
  int? countryId;
  String? name;

  Cities(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.uniqueId,
        this.rowVersion,
        this.nameUzbek,
        this.nameRussian,
        this.countryId,
        this.name});

  @override
  String toString(){
    return AuthService.to.language == 'en' ? this.nameEn ??"": this.nameAr ??"";
  }

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    nameUzbek = json['NameUzbek'];
    nameRussian = json['NameRussian'];
    countryId = json['CountryId'];
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
    data['CountryId'] = this.countryId;
    data['Name'] = this.name;
    return data;
  }
}
