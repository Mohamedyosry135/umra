class IdentityTypeModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  List<IdentityType>? data;
  List<String>? messages;
  bool? isSuccess;
  String? exception;

  IdentityTypeModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  IdentityTypeModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    if (json['Data'] != null) {
      data = <IdentityType>[];
      json['Data'].forEach((v) {
        data!.add(new IdentityType.fromJson(v));
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

class IdentityType {
  int? id;
  String? name;

  IdentityType({this.id, this.name});
  @override
  String toString(){
    return this.name ??"";
  }
  IdentityType.fromJson(Map<String, dynamic> json) {
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
