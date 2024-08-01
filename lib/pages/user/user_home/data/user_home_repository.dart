import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/user_home/data/user_home_api_provider.dart';


abstract class IUserHomeRepository {
}

class UserHomeRepository extends BaseRepository implements IUserHomeRepository {
  UserHomeRepository({required this.provider});
  final IUserHomeApiProvider provider;


}
