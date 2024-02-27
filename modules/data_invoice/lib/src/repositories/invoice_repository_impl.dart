import 'dart:io';

import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/invoice_local_provider.dart';
import '../providers/invoice_remote_provider.dart';
import 'invoice_repository.dart';

@Injectable(as: InvoiceRepository)
class InvoiceRepositoryIml extends InvoiceRepository {
  InvoiceRepositoryIml({
    required this.remote,
    required this.local,
  });

  final InvoiceRemoteProvider remote;
  final InvoiceLocalProvider local;

}
