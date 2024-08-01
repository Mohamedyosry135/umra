import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/notification/data/notification_api_provider.dart';


abstract class INotificationRepository {
}

class NotificationRepository extends BaseRepository implements INotificationRepository {
  NotificationRepository({required this.provider});
  final INotificationApiProvider provider;


}
