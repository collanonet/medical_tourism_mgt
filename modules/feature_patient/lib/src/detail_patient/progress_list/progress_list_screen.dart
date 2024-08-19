import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'progress_list_model.dart';
import 'progress_record_widget.dart';

class ProgressListScreen extends StatefulWidget {
  const ProgressListScreen({super.key});

  @override
  State<ProgressListScreen> createState() => _ProgressListScreenState();
}

class _ProgressListScreenState extends State<ProgressListScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable:
                context.read<ProgressListModel>().medicalRecordsProgress,
            builder: (context, value, child) => Skeletonizer(
              enabled: value.loading,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 訪日治療の流れ // Treatment
                    Text(
                      '訪日治療の流れ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Text('済/未',
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          width: context.appTheme.spacing.marginExtraLarge * 2,
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginExtraLarge,
                        ),
                        Expanded(
                            flex: 4,
                            child: Text('タスク',
                                style: Theme.of(context).textTheme.bodySmall)),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text('完了日',
                                style: Theme.of(context).textTheme.bodySmall)),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text('備考',
                                style: Theme.of(context).textTheme.bodySmall)),
                      ],
                    ),
                    const Divider(),
                    ReactiveForm(
                      formGroup: formGroup.control('contactUs') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('application') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup:
                          formGroup.control('submitMaterials') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'medicalInstitutionSelectionProposal') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('contractConclusionDeposit')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'documentTranslationHospitalInquiries') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup
                              .control('judgingWhetherToVisitJapanForTreatment')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('decidingToComeToJapan')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'medicalVisaApplicationOfArrivalDate') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'submitVisaAirlineTicketInformation') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                              'officialReservationAtAMedicalInstitution')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'treatmentExaminationSupportInJapan') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('completionOfTreatment')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginExtraLarge,
                    ),
                    Text(
                      '訪日健診の流れ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Text('済/未',
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          width: context.appTheme.spacing.marginExtraLarge * 2,
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginExtraLarge,
                        ),
                        Expanded(
                            flex: 4,
                            child: Text('タスク',
                                style: Theme.of(context).textTheme.bodySmall)),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text('完了日',
                                style: Theme.of(context).textTheme.bodySmall)),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            flex: 3,
                            child: Text('備考',
                                style: Theme.of(context).textTheme.bodySmall)),
                      ],
                    ),
                    const Divider(),
                    ReactiveForm(
                      formGroup: formGroup.control('contactUs1') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('application1') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('submitRequiredInformation')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup:
                          formGroup.control('hospitalCourseSelectionProposal')
                              as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                              'courseConfirmationScheduleAdjustmentTentativeReservation')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control('contractConclusionDeposit1')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                              'officialReservationAtAMedicalInstitution1')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                              'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing')
                          as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup: formGroup.control(
                          'submitVisaAirlineTicketInformation1') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup:
                          formGroup.control('fillConfirmMedicalQuestionnaire')
                              as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup:
                          formGroup.control('medicalExaminationAccompanied')
                              as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    ReactiveForm(
                      formGroup:
                          formGroup.control('sendingResultReport') as FormGroup,
                      child: const ProgressRecordWidget(),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginExtraLarge,
                    ),
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
              valueListenable: context.read<ProgressListModel>().submit,
              onListen: () {
                final value = context.read<ProgressListModel>().submit.value;
                if (!value.hasError && !value.loading) {
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
                  valueListenable: context.read<ProgressListModel>().submit,
                  builder: (context, value, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, _) {
                        return ElevatedButton(
                            onPressed: !value.loading && form.valid
                                ? () => context
                                    .read<ProgressListModel>()
                                    .submitData(form)
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
