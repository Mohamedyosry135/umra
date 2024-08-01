class RelationshipsModelResp {
  int? total;
  int? pageNumber;
  int? pageSize;
  Null? filter;
  List<Relatoinship>? relationships;
  List<Null>? messages;
  bool? isSuccess;
  Null? exception;

  RelationshipsModelResp(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.relationships,
        this.messages,
        this.isSuccess,
        this.exception});

  RelationshipsModelResp.fromJson( json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      relationships = <Relatoinship>[];
      json['Data'].forEach((v) {
        relationships!.add(new Relatoinship.fromJson(v));
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
    if (this.relationships != null) {
      data['Data'] = this.relationships!.map((v) => v.toJson()).toList();
    }

    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class Relatoinship {
  int? id;
  String? name;

  Relatoinship({this.id, this.name});

  Relatoinship.fromJson(Map<String, dynamic> json) {
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
