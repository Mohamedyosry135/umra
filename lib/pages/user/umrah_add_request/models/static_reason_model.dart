class StaticReasonModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic filter;
  List<ReasonData>? data;
  List<dynamic>? messages;
  bool? isSuccess;
  dynamic exception;

  StaticReasonModel(
      {this.total,
      this.pageNumber,
      this.pageSize,
      this.filter,
      this.data,
      this.messages,
      this.isSuccess,
      this.exception});

  StaticReasonModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <ReasonData>[];
      json['Data'].forEach((v) {
        data!.add(ReasonData.fromJson(v));
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

class ReasonData {
  int? id;
  String? name;

  ReasonData({this.id, this.name});

  ReasonData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
