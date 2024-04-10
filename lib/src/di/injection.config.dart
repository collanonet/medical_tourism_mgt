// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i20;

import 'package:core_l10n/core_l10n.module.dart' as _i26;
import 'package:core_l10n/l10n.dart' as _i23;
import 'package:core_network/core_network.dart' as _i24;
import 'package:core_network/core_network.module.dart' as _i27;
import 'package:core_storage/core_storage.dart' as _i19;
import 'package:core_storage/core_storage.module.dart' as _i3;
import 'package:data_agent/data_agent.module.dart' as _i4;
import 'package:data_auth/data_auth.module.dart' as _i5;
import 'package:data_chats/data_chats.module.dart' as _i6;
import 'package:data_hospital/data_hospital.module.dart' as _i7;
import 'package:data_invoice/data_invoice.module.dart' as _i8;
import 'package:data_medical_visa/data_medical_visa.module.dart' as _i9;
import 'package:data_patient/data_patient.module.dart' as _i10;
import 'package:data_process_chart/data_process_chart.module.dart' as _i11;
import 'package:data_quotation/data_quotation.module.dart' as _i12;
import 'package:data_report/data_report.module.dart' as _i13;
import 'package:data_sale/data_sale.module.dart' as _i14;
import 'package:data_web_appointment/data_web_appointment.module.dart' as _i15;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i18;
import 'package:feature_agent/feature_agent.module.dart' as _i29;
import 'package:feature_auth/feature_auth.dart' as _i22;
import 'package:feature_auth/feature_auth.module.dart' as _i28;
import 'package:feature_chats/feature_chats.module.dart' as _i16;
import 'package:feature_hospital/feature_hospital.module.dart' as _i30;
import 'package:feature_invoice/feature_invoice.module.dart' as _i31;
import 'package:feature_medical_visa/feature_medical_visa.module.dart' as _i32;
import 'package:feature_patient/feature_patient.module.dart' as _i33;
import 'package:feature_process_chart/feature_process_chart.module.dart'
    as _i37;
import 'package:feature_quotation/feature_quotation.module.dart' as _i34;
import 'package:feature_report/feature_report.module.dart' as _i35;
import 'package:feature_sale/feature_sale.module.dart' as _i36;
import 'package:feature_web_appointment/feature_web_appointment.module.dart'
    as _i38;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_model.dart' as _i21;
import '../routes/app_router.dart' as _i25;
import '../routes/guards.dart' as _i17;
import 'modules/app_module.dart' as _i40;
import 'modules/rest_module.dart' as _i41;
import 'modules/storage_module.dart' as _i39;

const String _local = 'local';
const String _dev = 'dev';
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
    await _i4.DataAgentPackageModule().init(gh);
    await _i5.DataAuthPackageModule().init(gh);
    await _i6.DataChatsPackageModule().init(gh);
    await _i7.DataHospitalPackageModule().init(gh);
    await _i8.DataInvoicePackageModule().init(gh);
    await _i9.DataMedicalVisaPackageModule().init(gh);
    await _i10.DataPatientPackageModule().init(gh);
    await _i11.DataProcessChartPackageModule().init(gh);
    await _i12.DataQuotationPackageModule().init(gh);
    await _i13.DataReportPackageModule().init(gh);
    await _i14.DataSalePackageModule().init(gh);
    await _i15.DataWebAppointmentPackageModule().init(gh);
    await _i16.FeatureChatsPackageModule().init(gh);
    final storageModule = _$StorageModule();
    final appModule = _$AppModule();
    final restModule = _$RestModule();
    gh.factory<String>(() => storageModule.storagePrefixKey);
    gh.singleton<_i17.RoleGuard>(() => appModule.roleGuard);
    gh.singleton<_i18.CacheOptions>(() => restModule.cacheOptions);
    gh.factory<Uri>(
      () => restModule.localBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_local},
    );
    gh.singleton<_i19.Storage>(
      () => storageModule.localeStorage,
      instanceName: 'localeStorage',
    );
    gh.factory<Uri>(
      () => restModule.devBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.singleton<_i19.Storage>(
      () => storageModule.authStorage,
      instanceName: 'authStorage',
    );
    gh.factory<_i20.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.lazySingleton<_i21.AppModel>(() => _i21.AppModel(
          auth: gh<_i22.AuthModel>(),
          l10n: gh<_i23.L10nModel>(),
        ));
    gh.singleton<_i24.RestClient>(() => restModule.restClient(
          gh<Uri>(instanceName: 'baseUrl'),
          gh<_i18.CacheOptions>(),
        ));
    gh.factory<Uri>(
      () => restModule.prodBaseUrl,
      instanceName: 'baseUrl',
      registerFor: {_production},
    );
    gh.singleton<_i25.AppRouter>(
        () => appModule.appRouter(gh<_i17.RoleGuard>()));
    await _i26.CoreL10nPackageModule().init(gh);
    await _i27.CoreNetworkPackageModule().init(gh);
    await _i28.FeatureAuthPackageModule().init(gh);
    await _i29.FeatureAgentPackageModule().init(gh);
    await _i30.FeatureHospitalPackageModule().init(gh);
    await _i31.FeatureInvoicePackageModule().init(gh);
    await _i32.FeatureMedicalVisaPackageModule().init(gh);
    await _i33.FeaturePatientPackageModule().init(gh);
    await _i34.FeatureQuotationPackageModule().init(gh);
    await _i35.FeatureReportPackageModule().init(gh);
    await _i36.FeatureSalePackageModule().init(gh);
    await _i37.FeatureProcessChartPackageModule().init(gh);
    await _i38.FeatureWebAppointmentPackageModule().init(gh);
    return this;
  }
}

class _$StorageModule extends _i39.StorageModule {}

class _$AppModule extends _i40.AppModule {}

class _$RestModule extends _i41.RestModule {}
