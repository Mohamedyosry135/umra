



import 'package:umra/base/base_repositroy.dart';

import 'settings_api_provider.dart';






abstract class ISettingsRepository {


}

class SettingsRepository extends BaseRepository implements ISettingsRepository {
  SettingsRepository({required this.provider});
  final ISettingsProvider provider;

}
