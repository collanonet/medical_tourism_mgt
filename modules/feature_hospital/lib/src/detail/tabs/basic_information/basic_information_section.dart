import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/additional_information_section.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/create_doctor_profile_section.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/how_to_make_reqest_section.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/medical_record_section.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/payment_option_section.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/section/support_language_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_information_model.dart';
import 'section/basic_info_section.dart';

class BasicInformationSection extends StatefulWidget {
  const BasicInformationSection({super.key});

  @override
  State<BasicInformationSection> createState() =>
      _BasicInformationSectionState();
}

class _BasicInformationSectionState extends State<BasicInformationSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            child: SingleChildScrollView(
              primary: true,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: context.appTheme.spacing.formSpacing),
                children: const [
                  HowtoMakeReqestSection(),
                  BasicInfoSection(),
                  Divider(),
                  MedicalRecordSection(),
                  Divider(),
                  AddDoctorProfile(),
                  Divider(),
                  AdditionalInformationSection(),
                  Divider(),
                  PaymentOptionSection(),
                  Divider(),
                  SupportLanguageSection(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ValueListenableListener(
              valueListenable: context.read<BasicInformationModel>().submit,
              onListen: () {
                final value =
                    context.read<BasicInformationModel>().submit.value;
                if (value.hasData) {
                  logger.d('loading');
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                  valueListenable:
                      context.watch<BasicInformationModel>().submit,
                  builder: (context, value, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, _) {
                        return ElevatedButton(
                            onPressed: !value.loading
                                ? () => context
                                    .read<BasicInformationModel>()
                                    .submitData(form,)
                                : null,
                            child: WithLoadingButton(
                              isLoading: value.loading,
                              child: Text('保存する'),
                            ));
                      },
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
