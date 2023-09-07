// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i18;

import 'package:core_l10n/core_l10n.module.dart' as _i23;
import 'package:core_l10n/l10n.dart' as _i16;
import 'package:core_network/core_network.dart' as _i22;
import 'package:core_network/core_network.module.dart' as _i24;
import 'package:core_storage/core_storage.dart' as _i20;
import 'package:core_storage/core_storage.module.dart' as _i3;
import 'package:data_auth/data_auth.module.dart' as _i4;
import 'package:data_help_and_doc/data_help_and_doc.module.dart' as _i5;
import 'package:data_hospital/data_hospital.module.dart' as _i6;
import 'package:data_invoice/data_invoice.module.dart' as _i7;
import 'package:data_medical_visa/data_medical_visa.module.dart' as _i8;
import 'package:data_patient/data_patient.module.dart' as _i9;
import 'package:data_pre_patient/data_pre_patient.module.dart' as _i10;
import 'package:data_quotation/data_quotation.module.dart' as _i11;
import 'package:data_report/data_report.module.dart' as _i12;
import 'package:data_sale/data_sale.module.dart' as _i13;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i17;
import 'package:feature_agent/feature_agent.module.dart' as _i26;
import 'package:feature_auth/feature_auth.dart' as _i15;
import 'package:feature_auth/feature_auth.module.dart' as _i25;
import 'package:feature_help_and_doc/feature_help_and_doc.module.dart' as _i27;
import 'package:feature_hospital/feature_hospital.module.dart' as _i28;
import 'package:feature_invoice/feature_invoice.module.dart' as _i29;
import 'package:feature_medical_visa/feature_medical_visa.module.dart' as _i30;
import 'package:feature_patient/feature_patient.module.dart' as _i31;
import 'package:feature_pre_patient/feature_pre_patient.module.dart' as _i32;
import 'package:feature_quotation/feature_quotation.module.dart' as _i33;
import 'package:feature_report/feature_report.module.dart' as _i34;
import 'package:feature_sale/feature_sale.module.dart' as _i35;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_model.dart' as _i14;
import '../routes/app_router.dart' as _i21;
import '../routes/guards.dart' as _i19;
import 'modules/app_module.dart' as _i37;
import 'modules/rest_module.dart' as _i36;
import 'modules/storage_module.dart' as _i38;

const String _dev = 'dev';
const String _staging = 'staging';
const String _production = 'production';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CoreStoragePackageModule().init(gh);
    await _i4.DataAuthPackageModule().init(gh);
    await _i5.DataHelpAndDocPackageModule().init(gh);
    await _i6.DataHospitalPackageModule().init(gh);
    await _i7.DataInvoicePackageModule().init(gh);
    await _i8.DataMedicalVisaPackageModule().init(gh);
    await _i9.DataPatientPackageModule().init(gh);
    await _i10.DataPrePatientPackageModule().init(gh);
    await _i11.DataQuotationPackageModule().init(gh);
    await _i12.DataReportPackageModule().init(gh);
    await _i13.DataSalePackageModule().init(gh);
    final restModule = _$RestModule();
    final appModule = _$AppModule();
    final storageModule = _$StorageModule();
    gh.lazySingleton<_i14.AppModel>(() => _i14.AppModel(
          auth: gh<_i15.AuthModel>(),
          l10n: gh<_i16.L10nModel>(),
        ));
    gh.singleton<_i17.CacheOptions>(restModule.cacheOptions);
    gh.factory<_i18.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.singleton<_i19.RoleGuard>(appModule.roleGuard);
    gh.singleton<_i20.Storage>(
      storageModule.authStorage,
      instanceName: 'authStorage',
    );
    gh.singleton<_i20.Storage>(
      storageModule.localeStorage,
      instanceName: 'localeStorage',
    );
    gh.factory<String>(() => storageModule.storagePrefixKey);
    gh.factory<Uri>(
      () => restModule.devBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.factory<Uri>(
      () => restModule.stagingBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_staging},
    );
    gh.factory<Uri>(
      () => restModule.prodBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_production},
    );
    gh.singleton<_i21.AppRouter>(appModule.appRouter(gh<_i19.RoleGuard>()));
    gh.singleton<_i22.RestClient>(restModule.restClient(
      gh<Uri>(instanceName: 'baseUrl'),
      gh<_i17.CacheOptions>(),
    ));
    await _i23.CoreL10nPackageModule().init(gh);
    await _i24.CoreNetworkPackageModule().init(gh);
    await _i25.FeatureAuthPackageModule().init(gh);
    await _i26.FeatureAgentPackageModule().init(gh);
    await _i27.FeatureHelpAndDocPackageModule().init(gh);
    await _i28.FeatureHospitalPackageModule().init(gh);
    await _i29.FeatureInvoicePackageModule().init(gh);
    await _i30.FeatureMedicalVisaPackageModule().init(gh);
    await _i31.FeaturePatientPackageModule().init(gh);
    await _i32.FeaturePrePatientPackageModule().init(gh);
    await _i33.FeatureQuotationPackageModule().init(gh);
    await _i34.FeatureReportPackageModule().init(gh);
    await _i35.FeatureSalePackageModule().init(gh);
    return this;
  }
}

class _$RestModule extends _i36.RestModule {}

class _$AppModule extends _i37.AppModule {}

class _$StorageModule extends _i38.StorageModule {}
