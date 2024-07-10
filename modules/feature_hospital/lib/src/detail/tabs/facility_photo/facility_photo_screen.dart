import 'package:feature_hospital/src/detail/tabs/facility_photo/facility_photo_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'facility_photo_form.dart';
import 'facility_photo_model.dart';

class FacilityPhotoScreen extends StatefulWidget {
  const FacilityPhotoScreen({super.key, required this.id});
  final String id;
  @override
  State<FacilityPhotoScreen> createState() => _FacilityPhotoScreenState();
}

class _FacilityPhotoScreenState extends State<FacilityPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: Provider(
        create: (context) =>
            GetIt.I<FacilityModel>()..fetchFacility(id: widget.id),
        child: FacilityPhotoSection(id: widget.id,),
      ),
    );
  }
}
