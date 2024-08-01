import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/provider/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/my_requests/models/my_request_model.dart';
import 'package:umra/services/auth_service.dart';

class MyOrdersController extends SuperController<bool> {
  MyOrdersController({required this.myRequestsRepository});

  final IMyRequestsRepository myRequestsRepository;
  RxString dateRange = DateFormat('d MMM', AuthService.to.language).format(DateTime.now()).obs;
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');

  String dateFilter = DateFormat('yyyy-MM-dd').format(DateTime.now());
  MyUmraRequestsModel? myUmraRequestsModel;
  List<Relatoinship>? relationships;

  @override
  void onInit() {
    getRequests();
    getRelations();
    super.onInit();
  }

  getRequests() {
    change(false, status: RxStatus.loading());
    myRequestsRepository.getRequests(dateFilter).then((value) {
      myUmraRequestsModel = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      Get.back();
      Get.snackbar("", error.toString());
    });
  }

  getRelations() async {
    change(false, status: RxStatus.loading());

    await myRequestsRepository.getRelationships().then((value) {
      relationships = value.relationships;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
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
