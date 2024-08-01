import 'package:get/get_connect/http/src/response/response.dart';
import 'package:intl/intl.dart';
import 'package:umra/base/base_auth_provider.dart';

import '../../../../base/api_end_points.dart';
import '../../../user/my_requests/models/my_request_model.dart';

abstract class IproviderHomeApiProvider {
  Future<Response<MyUmraRequestsModel>> getRequests();
}

class providerHomeApiProvider extends BaseAuthProvider
    implements IproviderHomeApiProvider {
  @override
  Future<Response<MyUmraRequestsModel>> getRequests() {
    return post<MyUmraRequestsModel>(
        ProviderEndPoints.getProviderOrders,
        {
          "filter": [
            {
              "fieldName": "RequestDate",
              "operation": "=",
              "value":
                  "${DateFormat('yyyy').format(DateTime.now())}-${DateFormat('MM').format(DateTime.now())}-${int.parse(DateFormat('DD').format(DateTime.now())) - 1}/${DateFormat('yyyy-MM-dd').format(DateTime.now())}"
            }
          ],
          "pageNumber": 1,
          "pageSize": 10
        },
        decoder: MyUmraRequestsModel.fromJson);
  }
}
