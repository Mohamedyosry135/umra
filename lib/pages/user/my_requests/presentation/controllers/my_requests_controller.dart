import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/my_requests/models/my_request_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:get/get.dart';

class MyRequestsController extends SuperController<bool> {
  MyRequestsController({required this.myRequestsRepository});
  final IMyRequestsRepository myRequestsRepository;
  MyUmraRequestsModel? myUmraRequestsModel;
  List<UmraRequestData>? requestsList;
  List<Relatoinship>? relationships;

  @override
  Future<void> onInit() async {
    change(false, status: RxStatus.loading());
    myUmraRequestsModel = await myRequestsRepository.getRequests();
    requestsList = myUmraRequestsModel!.data!.reversed.toList();
    // await myRequestsRepository.getRelationships().then((value) {
    //   relationships = value.relationships;
    // }).onError((error, stackTrace) {
    //   Get.snackbar("", error.toString());
    // });
    change(false, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
