import 'package:get/get.dart';
import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/privacy_policy/data/privacy_policy_api_provider.dart';
import 'package:umra/pages/common/terms_conditions/models/terms_conditions_model.dart';

abstract class IPrivacyPolicyRepository {
  Future<TermsAndConditionsModel> getPrivacyPolicy();
}

class PrivacyPolicyRepository extends BaseRepository
    implements IPrivacyPolicyRepository {
  PrivacyPolicyRepository({required this.provider});

  final IPrivacyPolicyProvider provider;

  @override
  Future<TermsAndConditionsModel> getPrivacyPolicy() async {
    final apiResponse = await provider.getPrivacyPolicy();
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }
}
