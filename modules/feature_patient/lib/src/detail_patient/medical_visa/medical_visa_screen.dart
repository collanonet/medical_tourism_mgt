// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'medical_visa_model.dart';
import 'section/after_getting_visa.dart';
import 'section/after_getting_visa_final.dart';
import 'section/document_required_in_japan.dart';
import 'section/length_of_stay.dart';
import 'section/necessary_in_japan.dart';
import 'section/travel_companion.dart';
import 'section/visa_withdrawal.dart';
import 'section/your_visa.dart';

class MedicalVisaScreen extends StatefulWidget {
  const MedicalVisaScreen({super.key});

  @override
  State<MedicalVisaScreen> createState() => _MedicalVisaScreenState();
}

class _MedicalVisaScreenState extends State<MedicalVisaScreen> {
  List<String> menu = const [
    '短期滞在の期間の延長',
    // Extension of short-term stay period
    '特定活動の期間の延長',
    // Extension of period of specific activities
    '短期滞在　医療ビザ→特定活動',
    // Short-term stay medical visa → Specific activities
    '海外での特定活動ビザ変更',
    // Change of specific activity visa overseas
    '日程変更届',
    // Schedule Change Notification
  ];
  final formatter = InputFormatter();
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<MedicalVisaModel>().medicalRecordVisaData,
        builder: (context, data, _) {
          return ValueListenableBuilder(
            valueListenable:
                context.watch<MedicalVisaModel>().submitMedicalRecordVisaData,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: data.loading || value.loading,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ビザを取得した後の情報',
                              style: context.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const YourVisa(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const LengthOfStay(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const DocumentRequired(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const AfterGettingVisa(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const TravelCompanion(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              'ビザの取り下げ・変更情報',
                              style: context.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const VisaWithdrawal(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: context.appTheme.spacing.marginMedium),
                              child: ValueListenableBuilder<int>(
                                valueListenable: _selectedIndex,
                                builder: (BuildContext context, int value,
                                    Widget? child) {
                                  return Row(
                                    children: [
                                      TabBarWidget(
                                        selectedIndex: value,
                                        menu: menu,
                                        onPressed: (index) {
                                          _selectedIndex.value = index;
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(children: [
                              const Expanded(
                                child: Text('書類'),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const Expanded(
                                child: Text('発行日'),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                              ),
                            ]),
                            const Divider(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ValueListenableBuilder<int>(
                              valueListenable: _selectedIndex,
                              builder: (context, selectedIndex, _) {
                                return ReactiveForm(
                                  formGroup: formGroup.control('visaChangeInfo') as FormGroup,
                                  child: ReactiveFormArray(
                                    formArrayName: 'tabs',
                                    builder: (context, formArray, _) {
                                      if (selectedIndex < formArray.controls.length) {
                                        final tabForm = formArray.controls[selectedIndex] as FormGroup;
                                        return ReactiveForm(
                                          formGroup: tabForm,
                                          child: ReactiveFormArray(
                                            formArrayName: 'documents',
                                            builder: (context, documentsArray, _) {
                                              final rows = documentsArray.controls
                                                  .map((control) => control as FormGroup)
                                                  .map((currentForm) => ReactiveForm(
                                                        formGroup: currentForm,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: ReactiveTextField(
                                                                formControlName: 'documentName',
                                                                decoration: const InputDecoration(
                                                                  label: Text('書類'),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context.appTheme.spacing.marginMedium,
                                                            ),
                                                            Expanded(
                                                              child: ReactiveDatePickerField(
                                                                formControlName: 'issueDate',
                                                                label: '発行日',
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context.appTheme.spacing.marginMedium,
                                                            ),
                                                            Expanded(
                                                              child: _FileUploadWidget(
                                                                formGroup: currentForm,
                                                                formControlName: 'fileSelect',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList();
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ColumnSeparated(
                                                    separatorBuilder: (BuildContext context, int index) {
                                                      return SizedBox(
                                                        height: context.appTheme.spacing.marginMedium,
                                                      );
                                                    },
                                                    children: rows.toList(),
                                                  ),
                                                  SizedBox(
                                                    height: context.appTheme.spacing.marginMedium,
                                                  ),
                                                  InkWell(
                                                    onTap: () => documentsArray.add(
                                                      FormGroup({
                                                        'documentName': FormControl<String>(value: ''),
                                                        'issueDate': FormControl<DateTime>(
                                                          validators: [
                                                            Validators.pattern(
                                                              ValidatorRegExp.date,
                                                            ),
                                                          ],
                                                        ),
                                                        'fileSelect': FormControl<FileSelect>(),
                                                      }),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.add_circle,
                                                          color: context.appTheme.primaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: context.appTheme.spacing.marginSmall,
                                                        ),
                                                        Text(
                                                          '書類を追加',
                                                          style: TextStyle(
                                                            fontFamily: 'NotoSansJP',
                                                            package: 'core_ui',
                                                            color: context.appTheme.primaryColor,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const NecessaryInJapan(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const AfterGettingVisaFinal(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            context
                                .read<MedicalVisaModel>()
                                .generateWithdrawalApplication(formGroup);
                          },
                          label: const Text('取下申立書'),
                          icon: const Icon(Icons.note_add_rounded),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            context
                                .read<MedicalVisaModel>()
                                .generateDepartureReport(formGroup);
                          },
                          label: const Text('出国報告書'),
                          icon: const Icon(Icons.note_add_rounded),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        ValueListenableListener(
                          valueListenable: context
                              .read<MedicalVisaModel>()
                              .submitMedicalRecordVisaData,
                          onListen: () {
                            final value = context
                                .read<MedicalVisaModel>()
                                .submitMedicalRecordVisaData
                                .value;
                            if (value.hasData) {
                              logger.d('loading');
                              snackBarWidget(
                                message: '正常に保存されました',
                                prefixIcon: const Icon(Icons.check_circle,
                                    color: Colors.white),
                              );
                            }

                            if (value.hasError) {
                              snackBarWidget(
                                message: '保存できませんでした。 もう一度試してください。',
                                backgroundColor: Colors.red,
                                prefixIcon: const Icon(Icons.error,
                                    color: Colors.white),
                              );
                            }
                          },
                          child: ValueListenableBuilder(
                              valueListenable: context
                                  .watch<MedicalVisaModel>()
                                  .submitMedicalRecordVisaData,
                              builder: (context, value, _) {
                                return ReactiveFormConsumer(
                                  builder: (context, form, _) {
                                    return ElevatedButton(
                                        onPressed: !value.loading && form.valid
                                            ? () => context
                                                .read<MedicalVisaModel>()
                                                .submitMedicalRecordVisa(
                                                    formGroup)
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
                ),
              );
            },
          );
        });
  }
}

class _FileUploadWidget extends StatelessWidget {
  const _FileUploadWidget({
    required this.formGroup,
    required this.formControlName,
  });

  final FormGroup formGroup;
  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      mainAxisAlignment: MainAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
            width: context.appTheme.spacing.formSpacing,
          ),
          children: [
            RowSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              children: [
                ReactiveValueListenableBuilder<FileSelect>(
                  formControlName: formControlName,
                  builder: (context, control, _) {
                    return InkWell(
                      onTap: () {
                        if (control.value?.url != null || control.value?.filename != null) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: PreviewFile(fileSelect: control.value!),
                            ),
                          );
                        }
                      },
                      child: Text(
                        control.value?.url ?? control.value?.filename ?? 'File Name',
                        style: context.textTheme.bodySmall,
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                filePicker().then((value) {
                  if (value != null) {
                    formGroup.control(formControlName).value = value;
                  }
                });
              },
              child: Chip(
                label: const Text('ファイル選択'),
                labelStyle: TextStyle(
                  color: context.appTheme.secondaryBackgroundColor,
                ),
                backgroundColor: context.appTheme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
