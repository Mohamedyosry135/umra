

import 'package:umra/base/base_repositroy.dart';

import 'chane_day_api_provider.dart';






abstract class IChangeDayRepository {


}

class ChangeDayRepository extends BaseRepository implements IChangeDayRepository {
  ChangeDayRepository({required this.provider});
  final IChangeDayProvider provider;

}
