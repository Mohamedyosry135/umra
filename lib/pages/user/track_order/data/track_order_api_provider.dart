import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/services/auth_service.dart';

abstract class ITrackOrderApiProvider {
  Future<Response<UmrahDetailsModel>> getUmrahDetails(String id);

}

class TrackOrderApiProvider extends BaseAuthProvider implements ITrackOrderApiProvider {
  @override
  Future<Response<UmrahDetailsModel>> getUmrahDetails(String id) {
    return get(
      UserEndPoints.getUmrahDetails + id,
      headers: {
        "Lang": AuthService.to.language ?? "ar",
      },
      decoder: UmrahDetailsModel.fromJson,
    );
  }
}
