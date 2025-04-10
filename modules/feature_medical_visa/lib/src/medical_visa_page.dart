// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'filter_medical_visa_form.dart';
import 'medical_visa_model.dart';
import 'medical_visa_screen.dart';

@RoutePage(name: Routes.medicalVisasRoute)
class MedicalVisaPage extends StatefulWidget {
  const MedicalVisaPage({super.key});

  @override
  State<MedicalVisaPage> createState() => _MedicalVisaPageState();
}

class _MedicalVisaPageState extends State<MedicalVisaPage> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => formFilterMedicalVisa(),
          builder: (context, formGroup, child) {
          return ChangeNotifierProvider(
            create: (context) => GetIt.I<MedicalVisaModel>()..patients(),
            child: const LayoutView(
              selectedIndex: 2,
              page: MedicalVisaScreen(),
            ),
          );
        }
      ),
    );
  }
}
