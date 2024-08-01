import 'package:umra/base/base_repositroy.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


import 'boarding_api_provider.dart';

abstract class IBoardingRepository {
}

class BoardingRepository extends BaseRepository implements IBoardingRepository {
  BoardingRepository({required this.provider});
  final IBoardingProvider provider;


}
