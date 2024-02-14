import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: context.appTheme.spacing.marginMedium,
          );
        },
        children: [
          ReactiveFormArray(
            formArrayName: 'patientNames',
            builder: (context, formArray, child) {
              final rows =
                  formArray.controls.map((control) => control as FormGroup).map(
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
                    spacing: context.appTheme.spacing.marginMedium,
                    runSpacing: context.appTheme.spacing.marginMedium,
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
                          'patientName': FormControl<String>(value: ''), // 患者名
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
                          '患者を追加',
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
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
                  formControlName: 'tour_name',
                  decoration: InputDecoration(
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
                  formControlName: 'Number_of_people',
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
                flex: 4,
                child: ReactiveTextField(
                  formControlName: 'type',
                  decoration: InputDecoration(
                    label: Text('種別'),
                  ),
                ),
              ),
            ],
          ),
          ReactiveFormArray(
            formArrayName: 'day',
            builder: (context, formArray, child) {
              final rows = formArray.controls
                  .map((control) => control as FormGroup)
                  .map(
                    (currentForm) => ReactiveForm(
                      formGroup: currentForm,
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return formArray.controls.indexOf(currentForm) == 0
                              ? const SizedBox()
                              : SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                );
                        },
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
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'date',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '日付',
                                          ),
                                        ),
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
                                            Checkbox(
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                checkColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  side: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                value: true,
                                                onChanged: (value) {}),
                                            Text('朝'),
                                            SizedBox(
                                              width: context
                                                  .appTheme.spacing.marginSmall,
                                            ),
                                            Checkbox(
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                checkColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  side: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                value: true,
                                                onChanged: (value) {}),
                                            Text('昼'),
                                            SizedBox(
                                              width: context
                                                  .appTheme.spacing.marginSmall,
                                            ),
                                            Checkbox(
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                checkColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  side: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                value: false,
                                                onChanged: (value) {}),
                                            Text('夕'),
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
                                        formControlName: 'place_name',
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
                                        formControlName: 'Accommodation',
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
                          ReactiveFormArray(
                            formArrayName: 'group',
                            builder: (context, formArray, child) {
                              final rows = formArray.controls
                                  .map((control) => control as FormGroup)
                                  .map(
                                    (currentForm) => ReactiveForm(
                                      formGroup: currentForm,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                          context.appTheme.spacing.marginMedium,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: formArray.controls
                                                      .indexOf(currentForm) ==
                                                  0
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'グループ${formArray.controls.indexOf(currentForm) + 1}',
                                              style:
                                                  context.textTheme.titleMedium,
                                            ),
                                            SizedBox(
                                              height: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            ReactiveFormArray(
                                              formArrayName: 'task',
                                              builder:
                                                  (context, formArray, child) {
                                                final rows = formArray.controls
                                                    .map((control) =>
                                                        control as FormGroup)
                                                    .map(
                                                      (currentForm) =>
                                                          ReactiveForm(
                                                        formGroup: currentForm,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  ReactiveTextField(
                                                                formControlName:
                                                                    'place_name',
                                                                decoration:
                                                                    const InputDecoration(
                                                                  label: Text(
                                                                    '地名',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context
                                                                  .appTheme
                                                                  .spacing
                                                                  .marginMedium,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ReactiveTextField(
                                                                formControlName:
                                                                    'Time_from',
                                                                decoration:
                                                                    const InputDecoration(
                                                                  label: Text(
                                                                    '時刻（自）',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context
                                                                  .appTheme
                                                                  .spacing
                                                                  .marginMedium,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ReactiveTextField(
                                                                formControlName:
                                                                    'Time_to',
                                                                decoration:
                                                                    const InputDecoration(
                                                                  label: Text(
                                                                    '時刻（至）',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context
                                                                  .appTheme
                                                                  .spacing
                                                                  .marginMedium,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ReactiveTextField(
                                                                formControlName:
                                                                    'traffic',
                                                                decoration:
                                                                    const InputDecoration(
                                                                  label: Text(
                                                                    '交通',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: context
                                                                  .appTheme
                                                                  .spacing
                                                                  .marginMedium,
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child:
                                                                  ReactiveTextField(
                                                                formControlName:
                                                                    'Itinerary',
                                                                decoration:
                                                                    const InputDecoration(
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ColumnSeparated(
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return SizedBox(
                                                          height: context
                                                              .appTheme
                                                              .spacing
                                                              .marginMedium,
                                                        );
                                                      },
                                                      children: rows.toList(),
                                                    ),
                                                    SizedBox(
                                                      height: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    InkWell(
                                                      onTap: () =>
                                                          formArray.add(
                                                        FormGroup(
                                                          {
                                                            'place_name':
                                                                FormControl<
                                                                        String>(
                                                                    value:
                                                                        ''), // 地名
                                                            'Time_from':
                                                                FormControl<
                                                                        String>(
                                                                    value:
                                                                        ''), // 時刻（自）
                                                            'Time_to': FormControl<
                                                                    String>(
                                                                value:
                                                                    ''), // 時刻（至）
                                                            'traffic':
                                                                FormControl<
                                                                        String>(
                                                                    value:
                                                                        ''), // 交通
                                                            'Itinerary':
                                                                FormControl<
                                                                        String>(
                                                                    value:
                                                                        ''), // 行程
                                                          },
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add_circle,
                                                            color: context
                                                                .appTheme
                                                                .primaryColor,
                                                          ),
                                                          SizedBox(
                                                            width: context
                                                                .appTheme
                                                                .spacing
                                                                .marginSmall,
                                                          ),
                                                          Text(
                                                            'さらに追加',
                                                            style: TextStyle(
                                                                color: context
                                                                    .appTheme
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
                                    ),
                                  );

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ColumnSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: rows.toList(),
                                  ),
                                  SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  InkWell(
                                    onTap: () => formArray.add(
                                      FormGroup(
                                        {
                                          'group_number': FormControl<String>(
                                              value: ''), // グループ番号
                                          'task': FormArray(
                                            [
                                              FormGroup(
                                                {
                                                  'place_name':
                                                      FormControl<String>(
                                                          value: ''), // 地名
                                                  'Time_from':
                                                      FormControl<String>(
                                                          value: ''), // 時刻（自）
                                                  'Time_to':
                                                      FormControl<String>(
                                                          value: ''), // 時刻（至）
                                                  'traffic':
                                                      FormControl<String>(
                                                          value: ''), // 交通
                                                  'Itinerary':
                                                      FormControl<String>(
                                                          value: ''), // 行程
                                                },
                                              ),
                                            ],
                                          ),
                                        },
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          'グループを追加',
                                          style: TextStyle(
                                              color: context
                                                  .appTheme.primaryColor),
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
                              'date': FormControl<String>(value: ''), // 日付
                              'meal': FormControl<String>(value: ''), // 食事
                              'place_name':
                                  FormControl<String>(value: ''), // 地名
                              'Accommodation':
                                  FormControl<String>(value: ''), // 宿泊場所
                              'group': FormArray(
                                // グループ
                                [
                                  FormGroup(
                                    {
                                      'group_number': FormControl<String>(
                                          value: ''), // グループ番号
                                      'task': FormArray(
                                        [
                                          FormGroup(
                                            {
                                              'place_name': FormControl<String>(
                                                  value: ''), // 地名
                                              'Time_from': FormControl<String>(
                                                  value: ''), // 時刻（自）
                                              'Time_to': FormControl<String>(
                                                  value: ''), // 時刻（至）
                                              'traffic': FormControl<String>(
                                                  value: ''), // 交通
                                              'Itinerary': FormControl<String>(
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
                              '患者を追加',
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
          ),
        ],
      ),
    );
  }
}
