import 'package:get/get.dart';

import '../../data/change_day_repository.dart';



class ChangeDayController extends SuperController<dynamic> {
  ChangeDayController({required this.changeDayRepository});

  final IChangeDayRepository changeDayRepository;

  @override
  void onDetached() {

  }

  @override
  void onInactive() {

  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }
}