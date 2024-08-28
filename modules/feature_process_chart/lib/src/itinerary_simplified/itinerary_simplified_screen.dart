import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'itinerary_simplified_model.dart';

class ItinerarySimplifiedScreen extends StatefulWidget {
  const ItinerarySimplifiedScreen({super.key});

  @override
  State<ItinerarySimplifiedScreen> createState() =>
      _ItinerarySimplifiedScreenState();
}

class _ItinerarySimplifiedScreenState extends State<ItinerarySimplifiedScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<ItinerarySimplifiedModel>().submit,
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
                          '李明様向け　行程表',
                          style: context.textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        Text('2023/11/11〜2023/11/15')
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
                      menu: ['行程表'],
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
                                            decoration: InputDecoration(
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
                                            decoration: InputDecoration(
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
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName:
                                                'Consultation_date_and_time',
                                            decoration: InputDecoration(
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
                                            decoration: InputDecoration(
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
                                            decoration: InputDecoration(
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
                                            decoration: InputDecoration(
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
                                            .map((control) =>
                                                control as FormGroup)
                                            .map(
                                              (currentForm) => ReactiveForm(
                                                formGroup: currentForm,
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
                                                              .bodyText1,
                                                        ),
                                                        Row(
                                                          children: [
                                                            RadioMenuButton(
                                                                value: false,
                                                                groupValue:
                                                                    true,
                                                                onChanged:
                                                                    (value) {},
                                                                child:
                                                                    Text('同日')),
                                                            RadioMenuButton(
                                                                value: false,
                                                                groupValue:
                                                                    true,
                                                                onChanged:
                                                                    (value) {},
                                                                child:
                                                                    Text('別日')),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName: 'date',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '日時',
                                                          ),
                                                        ),
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
                                                  ],
                                                ),
                                              ),
                                            );

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
                                                'date': FormControl<String>(
                                                    value: ''), // 日時
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(),
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(
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
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '通訳者またはガイド',
                                        style: context.textTheme.bodyText1,
                                      ),
                                      Row(
                                        children: [
                                          RadioMenuButton(
                                              value: false,
                                              groupValue: true,
                                              onChanged: (value) {},
                                              child: Text('あり')),
                                          RadioMenuButton(
                                              value: false,
                                              groupValue: true,
                                              onChanged: (value) {},
                                              child: Text('なし')),
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'meeting_place',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '合流場所',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                        style: context.textTheme.bodyText1,
                                      ),
                                      Row(
                                        children: [
                                          RadioMenuButton(
                                              value: false,
                                              groupValue: true,
                                              onChanged: (value) {},
                                              child: Text('あり')),
                                          RadioMenuButton(
                                              value: false,
                                              groupValue: true,
                                              onChanged: (value) {},
                                              child: Text('なし')),
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
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'place',
                                      decoration: InputDecoration(
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
                                      decoration: InputDecoration(
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
                        context.read<ItinerarySimplifiedModel>().submit,
                    onListen: () {
                      final value =
                          context.read<ItinerarySimplifiedModel>().submit.value;
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
                            context.watch<ItinerarySimplifiedModel>().submit,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<ItinerarySimplifiedModel>()
                                          .submitData(form)
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
          ),
        );
      },
    );
  }
}
