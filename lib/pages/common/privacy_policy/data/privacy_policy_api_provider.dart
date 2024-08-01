import 'package:get/get.dart';
// ignore: one_member_abstracts

import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/common/terms_conditions/models/terms_conditions_model.dart';

abstract class IPrivacyPolicyProvider {
  Future<Response<TermsAndConditionsModel>> getPrivacyPolicy();
}

class PrivacyPolicyProvider extends BaseAuthProvider
    implements IPrivacyPolicyProvider {
  @override
  Future<Response<TermsAndConditionsModel>> getPrivacyPolicy() async {
    Response<TermsAndConditionsModel> resp = await get<TermsAndConditionsModel>(
      UserEndPoints.privacyPolicy,
      decoder: TermsAndConditionsModel.fromJson,
    );

    return resp;
  }
}
