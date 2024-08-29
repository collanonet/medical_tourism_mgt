//@GeneratedMicroModule;FeatureSalePackageModule;package:feature_sale/feature_sale.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:data_sale/data_sale.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/sale_model.dart' as _i3;

class FeatureSalePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.SaleModel>(
        () => _i3.SaleModel(saleRepository: gh<_i4.SaleRepository>()));
  }
}
