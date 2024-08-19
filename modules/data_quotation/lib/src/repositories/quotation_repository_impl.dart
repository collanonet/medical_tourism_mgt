
import 'package:injectable/injectable.dart';

import '../providers/quotation_local_provider.dart';
import '../providers/quotation_remote_provider.dart';
import 'quotation_repository.dart';

@Injectable(as: QuotationRepository)
class QuotationRepositoryIml extends QuotationRepository {
  QuotationRepositoryIml({
    required this.remote,
    required this.local,
  });

  final QuotationRemoteProvider remote;
  final QuotationLocalProvider local;

}
