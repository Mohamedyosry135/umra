import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/provider/my_days/data/my_days_api_provider.dart';
import 'package:umra/pages/provider/my_days/models/provider_dates_model.dart';
import 'package:umra/pages/provider/my_days/models/umra_package_model.dart';
import 'package:umra/pages/provider/provider_home/data/provider_home_api_provider.dart';
import 'package:umra/pages/user/user_home/data/user_home_api_provider.dart';

abstract class IMyDaysRepository {
  Future<ProviderDatesModel> getProviderAvailbleDates(int packageId);
  Future<UmraPackageModel> getProviderUmraPackages();
  Future postProviderUmraDays(dynamic data);
  Future updateProviderUmraDays(dynamic data);
}

class MyDaysRepository extends BaseRepository implements IMyDaysRepository {
  MyDaysRepository({required this.provider});
  final IMyDaysApiProvider provider;

  @override
  Future<ProviderDatesModel> getProviderAvailbleDates(int packageId) async {
    final apiResponse = await provider.getProviderAvailbleDates(packageId);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.statusCode!}");
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }

  @override
  Future<UmraPackageModel> getProviderUmraPackages() async{
    final apiResponse = await provider.getProviderUmraPackages();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {

      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.statusCode!}");
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }

  @override
  Future postProviderUmraDays(dynamic data) async {
    final apiResponse = await provider.postProviderUmradays(data);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {

      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.statusCode!}");
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }

  @override
  Future updateProviderUmraDays(data) async {
    final apiResponse = await provider.updateProviderUmradays(data);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {

      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.statusCode!}");
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
    throw UnimplementedError();
  }
}
