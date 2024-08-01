class UpdateStepModel {
  int? attachmentId;
  int? requestUmrahId;
  String? rowVersion;
  int? umrahPackageStepsId;
  String? uniqueId;
  int? id;

  UpdateStepModel(
      {
        this.attachmentId,
        this.requestUmrahId,
        this.rowVersion,
        this.umrahPackageStepsId,
        this.uniqueId,
        this.id});

  UpdateStepModel.fromJson(Map<String, dynamic> json) {
    attachmentId = json['AttachmentId'];
    requestUmrahId = json['RequestUmrahId'];
    rowVersion = json['RowVersion'];
    umrahPackageStepsId = json['UmrahPackageStepsId'];
    uniqueId = json['UniqueId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AttachmentId'] = this.attachmentId;
    data['RequestUmrahId'] = this.requestUmrahId;
    data['RowVersion'] = this.rowVersion;
    data['UmrahPackageStepsId'] = this.umrahPackageStepsId;
    data['UniqueId'] = this.uniqueId;
    data['Id'] = this.id;
    return data;
  }
}