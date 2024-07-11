import 'package:feature_hospital/src/detail/tabs/facility_photo/facility_photo_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'facility_photo_form.dart';
import 'facility_photo_model.dart';

class FacilityPhotoScreen extends StatelessWidget {
  const FacilityPhotoScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => GetIt.I<FacilityModel>()..fetchFacility(id: id),
        child: Builder(builder: (context) {
          return ValueListenableBuilder(
              valueListenable: context.read<FacilityModel>().facilityData,
              builder: (context, value, _) {
                return Skeletonizer(
                  enabled: value.loading,
                  child: FacilityPhotoSection(
                    id: id,
                  ),
                );
              });
        }));
  }
}
