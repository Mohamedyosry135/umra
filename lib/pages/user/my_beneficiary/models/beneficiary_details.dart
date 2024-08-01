class BeneficiaryDetails {
  int? id;
  int? userId;
  String? uniqueId;
  String? rowVersion;
  String? legalName;
  int? gender;
  String? birthday;
  int? relationShip;
  int? residenceCountryId;

  BeneficiaryDetails(
      {this.id,
        this.userId,
        this.uniqueId,
        this.rowVersion,
        this.legalName,
        this.gender,
        this.birthday,
        this.relationShip,
        this.residenceCountryId});

  BeneficiaryDetails.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    uniqueId = json['UniqueId'];
    rowVersion = json['RowVersion'];
    legalName = json['LegalName'];
    gender = json['Gender'];
    birthday = json['Birthday'];
    relationShip = json['RelationShip'];
    residenceCountryId = json['ResidenceCountryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UserId'] = this.userId;
    data['UniqueId'] = this.uniqueId;
    data['RowVersion'] = this.rowVersion;
    data['LegalName'] = this.legalName;
    data['Gender'] = this.gender;
    data['Birthday'] = this.birthday;
    data['RelationShip'] = this.relationShip;
    data['ResidenceCountryId'] = this.residenceCountryId;
    return data;
  }
}