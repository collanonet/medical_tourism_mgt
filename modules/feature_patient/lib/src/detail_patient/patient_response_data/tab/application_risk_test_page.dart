import 'package:auto_route/auto_route.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_medical_examination/src/application_risk_test/application_risk_test_form.dart';
import 'package:feature_medical_examination/src/application_risk_test/application_risk_test_screen.dart';
import 'package:feature_medical_examination/src/medical_examination_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ApplicationRiskTestPage extends StatelessWidget {
  const ApplicationRiskTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          GetIt.I<MedicalExaminationModel>()..fechApplicationRiskTest(),
      child: Scaffold(
        body: LayoutView(
          selectedIndex: 3,
          page: Builder(
            builder: (context) {
              return ValueListenableBuilder(
                valueListenable: context
                    .watch<MedicalExaminationModel>()
                    .applicationRiskTestData,
                builder: (context, value, _) {
                  return Skeletonizer(
                    enabled: value.loading,
                    child: ReactiveFormConfig(
                      validationMessages: {
                        ValidationMessage.required: (error) => 'この項目は必須です',
                      },
                      child: ReactiveFormBuilder(
                        form: () => formRiskTest(data: value.data),
                        builder: (context, formGroup, child) {
                          return const ApplicationRiskTestScreen();
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
