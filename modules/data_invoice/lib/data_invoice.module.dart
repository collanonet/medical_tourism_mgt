//@GeneratedMicroModule;DataInvoicePackageModule;package:data_invoice/data_invoice.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_network/core_network.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

import 'src/providers/invoice_local_provider.dart' as _i3;
import 'src/providers/invoice_remote_provider.dart' as _i4;
import 'src/repositories/invoice_repository.dart' as _i6;
import 'src/repositories/invoice_repository_impl.dart' as _i7;

class DataInvoicePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.InvoiceLocalProvider>(() => _i3.InvoiceLocalProvider());
    gh.factory<_i4.InvoiceRemoteProvider>(
        () => _i4.InvoiceRemoteProvider(apiService: gh<_i5.ApiService>()));
    gh.factory<_i6.InvoiceRepository>(() => _i7.InvoiceRepositoryIml(
          remote: gh<_i4.InvoiceRemoteProvider>(),
          local: gh<_i3.InvoiceLocalProvider>(),
        ));
  }
}
