import 'dart:io';

import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/sale_local_provider.dart';
import '../providers/sale_remote_provider.dart';
import 'sale_repository.dart';

@Injectable(as: SaleRepository)
class SaleRepositoryIml extends SaleRepository {
  SaleRepositoryIml({
    required this.remote,
    required this.local,
  });

  final SaleRemoteProvider remote;
  final SaleLocalProvider local;

}
