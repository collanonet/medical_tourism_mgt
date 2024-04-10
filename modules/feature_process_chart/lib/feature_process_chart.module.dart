//@GeneratedMicroModule;FeatureProcessChartPackageModule;package:feature_process_chart/feature_process_chart.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;

import 'src/detail/detail_process_chart_model.dart' as _i3;
import 'src/detail/tab/facility_model.dart' as _i4;
import 'src/detail/tab/hotel_registration_model.dart' as _i5;
import 'src/detail/tab/hotel_search_model.dart' as _i6;
import 'src/detail/tab/itinerary_model.dart' as _i7;
import 'src/detail/tab/related_parties_model.dart' as _i8;
import 'src/itinerary_simplified/itinerary_simplified_model.dart' as _i9;
import 'src/process_chart_model.dart' as _i10;

class FeatureProcessChartPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.DetailProcessChartModel>(
        () => _i3.DetailProcessChartModel());
    gh.factory<_i4.FacilityModel>(() => _i4.FacilityModel());
    gh.factory<_i5.HotelRegistrationModel>(() => _i5.HotelRegistrationModel());
    gh.factory<_i6.HotelSearchModel>(() => _i6.HotelSearchModel());
    gh.factory<_i7.ItineraryModel>(() => _i7.ItineraryModel());
    gh.factory<_i8.RelatedPartiesModel>(() => _i8.RelatedPartiesModel());
    gh.factory<_i9.ItinerarySimplifiedModel>(
        () => _i9.ItinerarySimplifiedModel());
    gh.factory<_i10.ProcessChartModel>(() => _i10.ProcessChartModel());
  }
}
