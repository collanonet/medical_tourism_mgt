// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'basic_information_model.dart';
import 'section/additional_information_section.dart';
import 'section/basic_info_section.dart';
import 'section/create_doctor_profile_section.dart';
import 'section/how_to_make_reqest_section.dart';
import 'section/medical_record_section.dart';
import 'section/payment_option_section.dart';
import 'section/support_language_section.dart';

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
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
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
                            onPressed: !value.loading && form.valid
                                ? () => context
                                    .read<BasicInformationModel>()
                                    .submitData(
                                      form,
                                    )
                                : null,
                            child: WithLoadingButton(
                              isLoading: value.loading,
                              child: const Text('保存する'),
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
