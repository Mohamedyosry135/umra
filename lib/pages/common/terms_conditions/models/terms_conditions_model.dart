class TermsAndConditionsModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  Null? filter;
  String? data;
  List<dynamic>? messages;
  bool? isSuccess;
  String? exception;

  TermsAndConditionsModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  TermsAndConditionsModel.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'];
    messages = json['Messages'];
    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    data['Filter'] = this.filter;
    data['Data'] = this.data;
    data['Messages'] = this.messages;
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}
