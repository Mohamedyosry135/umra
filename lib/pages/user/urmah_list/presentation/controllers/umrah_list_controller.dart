import 'package:get/get.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_repository.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';

class UmrahListController extends SuperController<bool> {
  UmrahListController({required this.umrahListRepository});
  final IUmrahListRepository umrahListRepository;
  UmrahPackageListModel? umrahPackageListModel;

  @override
  Future<void> onInit() async {
    change(false, status: RxStatus.loading());
    umrahPackageListModel = await umrahListRepository.getUmraPackageList();
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
