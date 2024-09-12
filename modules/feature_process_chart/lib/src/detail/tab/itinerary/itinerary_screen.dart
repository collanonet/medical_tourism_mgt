import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../detail_process_chart_model.dart';
import 'itinerary_model.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableListener(
      valueListenable: context.read<ItineraryModel>().itinerraryData,
      onListen: () {
        var data = context.read<ItineraryModel>().itinerraryData.value;

        if (data.hasData) {
          context.read<DetailProcessChartModel>().update(data.requireData);
        }
      },
      child: ValueListenableBuilder2(
        first: context.watch<ItineraryModel>().submitData,
        second: context.watch<ItineraryModel>().itinerraryData,
        builder: (context, firstValue, secondValue, _) {
          return Skeletonizer(
            enabled: firstValue.loading || secondValue.loading,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ColumnSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        ReactiveFormArray(
                          formArrayName: 'patient',
                          builder: (context, formArray, child) {
                            final rows = formArray.controls
                                .map((control) => control as FormGroup)
                                .map(
                                  (currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: SizedBox(
                                      width: 250,
                                      child: ReactiveTextField(
                                        formControlName: 'patientName',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '患者名',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing:
                                      context.appTheme.spacing.marginMedium,
                                  runSpacing:
                                      context.appTheme.spacing.marginMedium,
                                  alignment: WrapAlignment.start,
                                  children: rows.toList(),
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                InkWell(
                                  onTap: () => formArray.add(
                                    FormGroup(
                                      {
                                        'patientName': FormControl<String>(
                                            value: ''), // 患者名
                                      },
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_circle,
                                        color: context.appTheme.primaryColor,
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginSmall,
                                      ),
                                      Text(
                                        '患者を追加',
                                        style: TextStyle(
                                            color:
                                                context.appTheme.primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'tourName',
                                decoration: const InputDecoration(
                                  label: Text('ツアー名'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'peopleNumber',
                                decoration: InputDecoration(
                                  label: Text('人数'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'group',
                                decoration: InputDecoration(
                                  label: Text('グループ'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ValueListenableBuilder(
                                      valueListenable: context
                                          .read<ItineraryModel>()
                                          .classification,
                                      builder: (context, value, _) {
                                        return ReactiveDropdownFormField(
                                          decoration: const InputDecoration(
                                              hintText: '種別'),
                                          formControlName: 'classification',
                                          items: value
                                              .map((e) => DropdownMenuItem(
                                                    value: e.type,
                                                    child: Text(
                                                      e.type,
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        dayWidget(),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableListener(
                      valueListenable:
                          context.read<ItineraryModel>().submitData,
                      onListen: () {
                        final value =
                            context.read<ItineraryModel>().submitData.value;
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
                              context.watch<ItineraryModel>().submitData,
                          builder: (context, value, _) {
                            return ReactiveFormConsumer(
                              builder: (context, form, _) {
                                return ElevatedButton(
                                    onPressed: !value.loading && form.valid
                                        ? () => context
                                            .read<ItineraryModel>()
                                            .submitItinerary(form)
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
      ),
    );
  }

  dayWidget() {
    return ReactiveValueListenableBuilder(
        formControlName: 'day',
        builder: (context, control, _) {
          return ReactiveFormArray(
            formArrayName: 'day',
            builder: (context, formArray, child) {
              logger.d(formArray.controls);
              final rows = formArray.controls
                  .map((control) => control as FormGroup)
                  .map(
                    (currentForm) => ReactiveForm(
                      formGroup: currentForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginMedium,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  context.appTheme.spacing.borderRadiusMedium,
                                ),
                              ),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${formArray.controls.indexOf(currentForm) + 1}日目',
                                  style: context.textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    IntrinsicWidth(
                                      stepWidth: 300,
                                      child: ColumnSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 8);
                                        },
                                        children: [
                                          ReactiveDatePicker<DateTime>(
                                              formControlName: 'date',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                              builder:
                                                  (context, picker, child) {
                                                return ReactiveTextField<
                                                    DateTime>(
                                                  formControlName: 'date',
                                                  valueAccessor:
                                                      DateTimeValueAccessor(),
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    suffixIcon: IconButton(
                                                      icon: const Icon(
                                                        CupertinoIcons.calendar,
                                                        color: Colors.grey,
                                                      ),
                                                      onPressed:
                                                          picker.showPicker,
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('食事'),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginSmall,
                                        ),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'morning',
                                                title: Text('朝'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context
                                                  .appTheme.spacing.marginSmall,
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'noon',
                                                title: Text('昼'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context
                                                  .appTheme.spacing.marginSmall,
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'evening',
                                                title: Text('夕'),
                                              ),
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
                                        formControlName: 'placeName',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '地名',
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
                                        formControlName: 'placeStay',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '宿泊場所',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          groupWidget(),
                        ],
                      ),
                    ),
                  );

              return ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: rows.toList(),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginMedium,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      child: InkWell(
                        onTap: () => formArray.add(
                          FormGroup(
                            {
                              'date': FormControl<DateTime>(),
                              // 日付

                              //meals
                              'morning': FormControl<bool>(value: false),
                              'noon': FormControl<bool>(value: false),
                              'evening': FormControl<bool>(value: false),

                              'placeName': FormControl<String>(value: ''),
                              // 地名
                              'placeStay': FormControl<String>(value: ''),
                              // 宿泊場所
                              'groups': FormArray(
                                // グループ
                                [
                                  FormGroup(
                                    {
                                      'tasks': FormArray(
                                        [
                                          FormGroup(
                                            {
                                              'placeName': FormControl<String>(
                                                  value: ''), // 地名
                                              'timeFrom': FormControl<String>(
                                                  value: ''), // 時刻（自）
                                              'timeTo': FormControl<String>(
                                                  value: ''), // 時刻（至）
                                              'transportation':
                                                  FormControl<String>(
                                                      value: ''), // 交通
                                              'itinerary': FormControl<String>(
                                                  value: ''), // 行程
                                            },
                                          ),
                                        ],
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            },
                          ),
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
                              '日程を追加',
                              style: TextStyle(
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  groupWidget() {
    return ReactiveValueListenableBuilder(
        formControlName: 'groups',
        builder: (context, control, _) {
          return ReactiveFormArray(
            formArrayName: 'groups',
            builder: (context, formArray, child) {
              final rows =
                  formArray.controls.map((control) => control as FormGroup).map(
                        (currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginMedium,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  formArray.controls.indexOf(currentForm) == 0
                                      ? BorderRadius.vertical(
                                          bottom: Radius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium,
                                          ),
                                        )
                                      : BorderRadius.all(
                                          Radius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium,
                                          ),
                                        ),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'グループ${formArray.controls.indexOf(currentForm) + 1}',
                                  style: context.textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                taskWidget(),
                              ],
                            ),
                          ),
                        ),
                      );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () => formArray.add(
                      FormGroup(
                        {
                          'groups': FormControl<String>(value: ''),
                          // グループ番号
                          'tasks': FormArray(
                            [
                              FormGroup(
                                {
                                  'placeName': FormControl<String>(value: ''),
                                  // 地名
                                  'timeFrom': FormControl<String>(value: ''),
                                  // 時刻（自）
                                  'timeTo': FormControl<String>(value: ''),
                                  // 時刻（至）
                                  'transportation':
                                      FormControl<String>(value: ''),
                                  // 交通
                                  'itinerary': FormControl<String>(value: ''),
                                  // 行程
                                },
                              ),
                            ],
                          ),
                        },
                      ),
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
                          'グループを追加',
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  ReactiveFormArray<Object?> taskWidget() {
    return ReactiveFormArray(
      formArrayName: 'tasks',
      builder: (context, formArray, child) {
        final rows =
            formArray.controls.map((control) => control as FormGroup).map(
                  (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ReactiveTextField(
                            formControlName: 'placeName',
                            decoration: const InputDecoration(
                              label: Text(
                                '地名',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'timeFrom',
                            decoration: const InputDecoration(
                              label: Text(
                                '時刻（自）',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'timeTo',
                            decoration: const InputDecoration(
                              label: Text(
                                '時刻（至）',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'transportation',
                            decoration: const InputDecoration(
                              label: Text(
                                '交通',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'itinerary',
                            decoration: const InputDecoration(
                              label: Text(
                                '行程',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

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
              onTap: () => formArray.add(
                FormGroup(
                  {
                    'placeName': FormControl<String>(value: ''),
                    // 地名
                    'timeFrom': FormControl<String>(value: ''),
                    // 時刻（自）
                    'timeTo': FormControl<String>(value: ''),
                    // 時刻（至）
                    'transportation': FormControl<String>(value: ''),
                    // 交通
                    'itinerary': FormControl<String>(value: ''),
                    // 行程
                  },
                ),
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
                    'さらに追加',
                    style: TextStyle(color: context.appTheme.primaryColor),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
