import 'package:umra/base/base_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:umra/flavors/flavor_config.dart';



class BaseAuthProvider extends  BaseProvider {
  @override
  void onInit() {
    super.onInit() ;
    httpClient.baseUrl = Get.find<MyFlavorConfig>().baseUrl;
  }
}
