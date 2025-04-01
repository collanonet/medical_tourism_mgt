// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_information_model.dart';

class MedicalRecordSection extends StatefulWidget {
  const MedicalRecordSection({super.key});

  @override
  State<MedicalRecordSection> createState() => _MedicalRecordSectionState();
}

class _MedicalRecordSectionState extends State<MedicalRecordSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('medicalRecordHospitals') as FormArray;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().medicalRecordBasicInfoData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: context.appTheme.spacing.formSpacing),
              children: [
                // Memo
                // const Text(
                //   'メモ',
                //   style: TextStyle(
                //     fontFamily: 'NotoSansJP',
                //     package: 'core_ui',
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                const Text(
                  '担当者名',
                  style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ReactiveFormArray(
                    formArrayName: 'medicalRecordHospitals',
                    builder: (context, formArray, child) {
                      final rows = formArray.controls
                          .map((control) => control as FormGroup)
                          .map(
                            (currentForm) => ReactiveForm(
                              formGroup: currentForm,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      RowSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: const [
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveDatePickerField(
                                              formControlName: 'dateOfUpdate',
                                              label: '更新日',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      RowSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'departmentName',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '部署名',
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'nameKanji',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '氏名（漢字）',
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'nameKana',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '氏名（カナ',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      RowSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'telephoneNumber',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '電話番号',
                                                ),
                                              ),
                                              inputFormatters: [
                                                CustomPhoneFormatter(),
                                              ],
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'faxNumber',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  'FAX番号',
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'email',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  'メール',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          if (formArray.controls
                                                  .indexOf(currentForm) !=
                                              0)
                                            IconButton(
                                                icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          BasicInformationModel>()
                                                      .deleteMedicalRecord(
                                                          currentForm
                                                              .control('_id')
                                                              .value);
                                                  formArray.removeAt(formArray
                                                      .controls
                                                      .indexOf(currentForm));
                                                }),
                                        ],
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          );
                      return ColumnSeparated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16.0,
                        ),
                        children: rows.toList(),
                      );
                    }),

                InkWell(
                  onTap: () => formArray.add(
                    FormGroup({
                      '_id': FormControl<String>(),
                      'hospital': FormControl<String?>(),
                      'dateOfUpdate': FormControl<DateTime>(
                        value: DateTime.now(),
                        // validators: [Validators.required],
                      ),
                      'departmentName': FormControl<String>(),
                      'nameKanji': FormControl<String>(
                          // validators: [Validators.required],
                          ),
                      'nameKana': FormControl<String>(),
                      'telephoneNumber': FormControl<String>(),
                      'email': FormControl<String>(
                        validators: [
                          // Validators.required,
                          Validators.email,
                        ],
                      ),
                      'faxNumber': FormControl<String>(),
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
                        '担当者を追加',
                        style: TextStyle(color: context.appTheme.primaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
