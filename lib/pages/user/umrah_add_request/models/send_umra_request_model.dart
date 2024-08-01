class SendUmraRequestModel {
  int? umrahPackageId;
  int? providerAppUserId;
  String? requestDate;
  int? umrahAppUserId;
  String? comments;
  int? reason;
  int? beneficiaryId;
  int? payMethod;

  SendUmraRequestModel(
      {this.umrahPackageId,
      this.providerAppUserId,
      this.requestDate,
      this.umrahAppUserId,
      this.comments,
      this.reason,
      this.beneficiaryId,
      this.payMethod});

  SendUmraRequestModel.fromJson(Map<String, dynamic> json) {
    umrahPackageId = json['umrahPackageId'];
    providerAppUserId = json['providerAppUserId'];
    requestDate = json['requestDate'];
    umrahAppUserId = json['umrahAppUserId'];
    comments = json['comments'];
    reason = json['reason'];
    beneficiaryId = json['beneficiaryId'];
    payMethod = json['PaymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['umrahPackageId'] = umrahPackageId;
    data['providerAppUserId'] = providerAppUserId;
    data['requestDate'] = requestDate;
    data['umrahAppUserId'] = umrahAppUserId;
    data['comments'] = comments;
    data['reason'] = reason;
    data['beneficiaryId'] = beneficiaryId;
    data['PaymentType'] = payMethod;
    return data;
  }
}
