import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'patient_itinerary_model.dart';

class PatientItineraryScreen extends StatefulWidget {
  const PatientItineraryScreen({super.key, required this.patient});

  final Patient patient;

  @override
  State<PatientItineraryScreen> createState() =>
      _PatientItineraryScreenState();
}

class _PatientItineraryScreenState extends State<PatientItineraryScreen> {
  String get _patientName {
    final p = widget.patient;
    
    // Prioritize Kana Family Name
    if (p.familyNameJapaneseForChinese != null &&
        p.familyNameJapaneseForChinese!.isNotEmpty) {
      return p.familyNameJapaneseForChinese!;
    }
    if (p.familyNameJapaneseForNonChinese != null &&
        p.familyNameJapaneseForNonChinese!.isNotEmpty) {
      return p.familyNameJapaneseForNonChinese!;
    }

    // Fallback to other Family Names
    if (p.familyNameChineseOrVietnamese != null &&
        p.familyNameChineseOrVietnamese!.isNotEmpty) {
      return p.familyNameChineseOrVietnamese!;
    }

    if (p.familyNameRomanized != null && p.familyNameRomanized!.isNotEmpty) {
      return p.familyNameRomanized!;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<PatientItineraryModel>().submit,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(
                  context.appTheme.spacing.marginMedium,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                    color: Colors.white),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            context.appTheme.spacing.borderRadiusMedium,
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Icon(
                        Icons.mode_of_travel_rounded,
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_patientName様向け　行程表',
                          style: context.textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        const Text('2023/11/11〜2023/11/15')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: context.appTheme.spacing.marginMedium,
                    left: context.appTheme.spacing.marginMedium),
                child: Wrap(
                  children: [
                    TabBarWidget(
                      selectedIndex: 0,
                      menu: const ['行程表'],
                      onPressed: (index) {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.all(context.appTheme.spacing.marginMedium),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        context.appTheme.spacing.borderRadiusMedium),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: ColumnSeparated(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            context.appTheme.spacing.marginMedium,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium),
                          ),
                          child: ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              Text(
                                'タイトル',
                                style: context.textTheme.titleMedium,
                              ),
                              ReactiveForm(
                                formGroup:
                                    formGroup.control('title') as FormGroup,
                                child: ColumnSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    );
                                  },
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'patientName',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '患者名',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName:
                                                'Medical_institution_name',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '医療機関名',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Expanded(child: SizedBox()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName:
                                                'Consultation_date_and_time',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '受診日時',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'Start_time',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '開始時間',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName:
                                                'Ending_time_planned',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '終了時間（予定）',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName:
                                                'health_checkup_package',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '健康診断パッケージ',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ReactiveFormArray(
                                      formArrayName: 'Add_option',
                                      builder: (context, formArray, child) {
                                        final rows = formArray.controls
                                            .asMap()
                                            .map((index, currentForm) {
                                          
                                          return MapEntry(
                                            index,
                                            Container(
                                              padding: EdgeInsets.all(
                                                context.appTheme.spacing.marginMedium,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                                color: Colors.grey.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(
                                                    context.appTheme.spacing.borderRadiusMedium),
                                              ),
                                              child: ReactiveForm(
                                                formGroup: currentForm as FormGroup,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'option_name',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            'オプション名',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '健診日',
                                                          style: context
                                                              .textTheme
                                                              .bodyLarge,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                ReactiveRadio<String>(
                                                                  formControlName: 'Medical_examination_day',
                                                                  value: '同日',
                                                                ),
                                                                const Text('同日'),
                                                              ],
                                                            ),
                                                            const SizedBox(width: 8),
                                                            Row(
                                                              children: [
                                                                ReactiveRadio<String>(
                                                                  formControlName: 'Medical_examination_day',
                                                                  value: '別日',
                                                                ),
                                                                const Text('別日'),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: ReactiveDatePicker<DateTime>(
                                                        formControlName: 'date',
                                                        firstDate: DateTime(1900),
                                                        lastDate: DateTime(2100),
                                                        builder: (context, picker, child) {
                                                          return ReactiveTextField<DateTime>(
                                                            formControlName: 'date',
                                                            readOnly: true,
                                                            valueAccessor: FormattedDateTimeValueAccessor(
                                                              DateFormat('yyyy/MM/dd'),
                                                            ),
                                                            decoration: InputDecoration(
                                                              labelText: '日時',
                                                              suffixIcon: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  if (picker.value != null)
                                                                    IconButton(
                                                                      icon: const Icon(Icons.clear),
                                                                      onPressed: () {
                                                                        picker.control.value = null;
                                                                      },
                                                                    ),
                                                                  IconButton(
                                                                    onPressed: picker.showPicker,
                                                                    icon: const Icon(Icons.calendar_today),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            onTap: (control) {
                                                              picker.showPicker();
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName: 'time',
                                                        decoration:
                                                            const InputDecoration(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        formArray.remove(currentForm);
                                                      },
                                                      icon: const Icon(Icons.delete),
                                                      color: context.appTheme.errorColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).values;

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              spacing: context.appTheme.spacing
                                                  .marginMedium,
                                              runSpacing: context.appTheme
                                                  .spacing.marginMedium,
                                              alignment: WrapAlignment.start,
                                              children: rows.toList(),
                                            ),
                                            SizedBox(
                                              height: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  formArray.add(FormGroup({
                                                'option_name':
                                                    FormControl<String>(
                                                        value: ''), // オプション名
                                                'Medical_examination_day':
                                                    FormControl<String>(
                                                        value: ''), // 健診日
                                                'date': FormControl<DateTime>(), // 日時
                                                'time': FormControl<String>(
                                                    value: ''),
                                              })),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_circle,
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginSmall,
                                                  ),
                                                  Text(
                                                    '患者を追加',
                                                    style: TextStyle(
                                                        color: context.appTheme
                                                            .primaryColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('事前説明', style: context.textTheme.titleMedium),
                        ReactiveForm(
                          formGroup: formGroup.control('prior_explanation')
                              as FormGroup,
                          child: ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName:
                                          'Explanation_of_various_tests',
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '各種検査の説明',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName:
                                          'Explanation_of_various_tests_note',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: const InputDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName:
                                          'Meals_before_and_on_the_day_of_the_test',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '検査前・当日の食事について',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'About_taking_medicine',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '薬の服用について',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName:
                                          'What_to_bring_on_the_day_of_the_medical_examination',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '健康診断当日の持ち物',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'Other_considerations',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        label: Text(
                                          'その他の考慮事項',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text('通訳者またはガイド', style: context.textTheme.titleMedium),
                        ReactiveForm(
                          formGroup:
                              formGroup.control('interpreter_or_guide_input')
                                  as FormGroup,
                          child: ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '通訳者またはガイド',
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              ReactiveRadio<String>(
                                                formControlName:
                                                    'interpreter_or_guide',
                                                value: 'あり',
                                              ),
                                              const Text('あり'),
                                            ],
                                          ),
                                          const SizedBox(width: 16),
                                          Row(
                                            children: [
                                              ReactiveRadio<String>(
                                                formControlName:
                                                    'interpreter_or_guide',
                                                value: 'なし',
                                              ),
                                              const Text('なし'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'date',
                                      decoration: const InputDecoration(
                                        label: Text('日付'),
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'time',
                                      decoration: const InputDecoration(
                                        label: Text('時間'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              ReactiveTextField(
                                formControlName: 'meeting_place',
                                decoration: const InputDecoration(
                                  label: Text('合流場所'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('送迎', style: context.textTheme.titleMedium),
                        ReactiveForm(
                          formGroup:
                              formGroup.control('Transfer_input') as FormGroup,
                          child: ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '送迎',
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              ReactiveRadio<String>(
                                                formControlName: 'Transfer',
                                                value: 'あり',
                                              ),
                                              const Text('あり'),
                                            ],
                                          ),
                                          const SizedBox(width: 8),
                                          Row(
                                            children: [
                                              ReactiveRadio<String>(
                                                formControlName: 'Transfer',
                                                value: 'なし',
                                              ),
                                              const Text('なし'),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'date',
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '合流日時',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'time',
                                      decoration: const InputDecoration(),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'place',
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '場所',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'Driver_in_charge',
                                      decoration: const InputDecoration(
                                        label: Text(
                                          '担当ドライバー',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable:
                        context.read<PatientItineraryModel>().submit,
                    onListen: () {
                      final value =
                          context.read<PatientItineraryModel>().submit.value;
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
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable:
                            context.watch<PatientItineraryModel>().submit,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<PatientItineraryModel>()
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
          ),
        );
      },
    );
  }
}

class FormattedDateTimeValueAccessor extends ControlValueAccessor<DateTime, String> {
  final DateFormat format;

  FormattedDateTimeValueAccessor(this.format);

  @override
  String? modelToViewValue(DateTime? modelValue) {
    return modelValue == null ? '' : format.format(modelValue);
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    return viewValue == null || viewValue.isEmpty
        ? null
        : format.parse(viewValue);
  }
}
