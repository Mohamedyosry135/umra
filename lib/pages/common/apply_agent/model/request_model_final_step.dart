class RequestModelFinalStep {
  int? id;
  int? nationalityId;
  int? identityType;
  String? identityNumber;
  String? expireDate;
  int? idBackAttachmentId;
  int? idFrontAttachmentId;

  RequestModelFinalStep(
      {this.id,
        this.nationalityId,
        this.identityType,
        this.identityNumber,
        this.expireDate,
        this.idBackAttachmentId,
        this.idFrontAttachmentId});

  RequestModelFinalStep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nationalityId = json['nationalityId'];
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    expireDate = json['expireDate'];
    idBackAttachmentId = json['idBackAttachmentId'];
    idFrontAttachmentId = json['idFrontAttachmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nationalityId'] = this.nationalityId;
    data['identityType'] = this.identityType;
    data['identityNumber'] = this.identityNumber;
    data['expireDate'] = this.expireDate;
    data['idBackAttachmentId'] = this.idBackAttachmentId;
    data['idFrontAttachmentId'] = this.idFrontAttachmentId;
    return data;
  }
}
