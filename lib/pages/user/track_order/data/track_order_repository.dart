import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';

abstract class ITrackOrderRepository {
  Future<UmrahDetailsModel> getUmrahDetails(String id);

}

class TrackOrderRepository extends BaseRepository implements ITrackOrderRepository {
  TrackOrderRepository({required this.provider});
  final ITrackOrderApiProvider provider;
  @override
  Future<UmrahDetailsModel> getUmrahDetails(String id) async {
    final apiResponse = await provider.getUmrahDetails(id);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
}
