
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'facility_photo_model.dart';
import 'facility_photo_section.dart';

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
