import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/support_chat/data/support_chat_api_provider.dart';


abstract class ISupportChatRepository {}

class SupportChatRepository extends BaseRepository
    implements ISupportChatRepository {
  SupportChatRepository({required this.provider});

  final ISupportChatProvider provider;
}
