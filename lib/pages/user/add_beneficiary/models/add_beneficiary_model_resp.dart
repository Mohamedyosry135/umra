
import 'package:umra/pages/user/my_beneficiary/models/beneficiary_details.dart';

class BeneficiaryAddResp {
  int? total;
  int? pageNumber;
  int? pageSize;
  Null? filter;
  BeneficiaryDetails? data;
  List<Null>? messages;
  bool? isSuccess;
  Null? exception;

  BeneficiaryAddResp(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        this.messages,
        this.isSuccess,
        this.exception});

  BeneficiaryAddResp.fromJson(json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    data = json['Data'] != null ? new BeneficiaryDetails.fromJson(json['Data']) : null;

    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    data['Filter'] = this.filter;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }

    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

