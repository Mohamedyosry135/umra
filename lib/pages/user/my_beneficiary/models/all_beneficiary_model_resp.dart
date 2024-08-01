
import 'package:umra/pages/user/my_beneficiary/models/beneficiary_details.dart';

class AllBeneficiaryModelResp {
  int? total;
  int? pageNumber;
  int? pageSize;
  List<BeneficiaryDetails>? beneficiaryDetilsList;
  bool? isSuccess;

  AllBeneficiaryModelResp({
    this.total,
    this.pageNumber,
    this.pageSize,
    this.beneficiaryDetilsList,
    this.isSuccess,
  });

  AllBeneficiaryModelResp.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];

    if (json['Data'] != null) {
      beneficiaryDetilsList = <BeneficiaryDetails>[];
      json['Data'].forEach((v) {
        beneficiaryDetilsList!.add(new BeneficiaryDetails.fromJson(v));
      });
    }

    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;

    if (this.beneficiaryDetilsList != null) {
      data['Data'] = this.beneficiaryDetilsList!.map((v) => v.toJson()).toList();
    }

    data['IsSuccess'] = this.isSuccess;

    return data;
  }
}
