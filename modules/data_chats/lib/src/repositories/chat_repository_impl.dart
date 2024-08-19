
import 'package:injectable/injectable.dart';

import '../providers/chat_local_provider.dart';
import '../providers/chat_remote_provider.dart';
import 'chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryIml extends ChatRepository {
  ChatRepositoryIml({
    required this.remote,
    required this.local,
  });

  final ChatRemoteProvider remote;
  final ChatLocalProvider local;

}
