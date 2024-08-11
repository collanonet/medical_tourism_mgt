//@GeneratedMicroModule;FeatureProcessChartPackageModule;package:feature_process_chart/feature_process_chart.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_process_chart/data_process_chart.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail/detail_process_chart_model.dart' as _i3;
import 'src/detail/tab/facility_model.dart' as _i4;
import 'src/detail/tab/hotel_registration_model.dart' as _i6;
import 'src/detail/tab/itinerary_model.dart' as _i7;
import 'src/detail/tab/itinerary_simple_version_model.dart' as _i8;
import 'src/detail/tab/related_parties_model.dart' as _i9;
import 'src/itinerary_simplified/itinerary_simplified_model.dart' as _i10;
import 'src/process_chart_model.dart' as _i11;

class FeatureProcessChartPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.DetailProcessChartModel>(
        () => _i3.DetailProcessChartModel());
    gh.factory<_i4.FacilityModel>(() => _i4.FacilityModel(
        processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i6.HotelRegistrationModel>(() => _i6.HotelRegistrationModel(
        processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i7.ItineraryModel>(() => _i7.ItineraryModel(
        processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i8.ItinerarySimpleVersionModel>(() =>
        _i8.ItinerarySimpleVersionModel(
            processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i9.RelatedPartiesModel>(() => _i9.RelatedPartiesModel(
        processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i10.ItinerarySimplifiedModel>(() =>
        _i10.ItinerarySimplifiedModel(
            processChartRepository: gh<_i5.ProcessChartRepository>()));
    gh.factory<_i11.ProcessChartModel>(() => _i11.ProcessChartModel(
        processChartRepository: gh<_i5.ProcessChartRepository>()));
  }
}
