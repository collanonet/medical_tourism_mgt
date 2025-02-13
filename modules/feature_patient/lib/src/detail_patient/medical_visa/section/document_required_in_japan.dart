// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DocumentRequired extends StatelessWidget {
  const DocumentRequired({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('日本で必要な書類', style: context.textTheme.titleMedium),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('requiredInJapan') as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveFormArray(
                formArrayName: 'visaInfo',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('パスポート'),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePickerField(
                                            formControlName: 'passportDate',
                                          ),
                                        ),
                                      ],
                                    ),
                                    fileUpload(context, currentForm,
                                        'passportFileSelect'),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    const Expanded(child: Text('身元保証書')),
                                    // SizedBox(
                                    //   width:
                                    //       context.appTheme.spacing.marginMedium,
                                    // ),
                                    const IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName:
                                            'letterOfGuaranteeDate',
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width:
                                    //       context.appTheme.spacing.marginMedium,
                                    // ),
                                    SizedBox(
                                      width: 600,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'true',
                                              formControlName: 'sendBy',
                                              title: const Text('原本送付'),
                                            ),
                                          ),
                                          const Text('（'),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byEMS',
                                              title: const Text('EMS'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byFedex',
                                              title: const Text('Fedex'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byOthers',
                                              title: const Text('その他'),
                                            ),
                                          ),
                                          const Text('）'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'false',
                                              formControlName: 'sendBy',
                                              title: const Text('PDF送付'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width:
                                    //       context.appTheme.spacing.marginMedium,
                                    // ),
                                    SizedBox(
                                      width: 200,
                                      child: ColumnSeparated(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: context
                                                  .appTheme.spacing.formSpacing,
                                            ),
                                            children: [
                                              SizedBox(
                                                width: 75,
                                                child: RowSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    width: context
                                                        .appTheme
                                                        .spacing
                                                        .marginExtraSmall,
                                                  ),
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          ReactiveValueListenableBuilder<
                                                              FileSelect>(
                                                        formControlName:
                                                            'letterOfGuaranteeFileSelect',
                                                        builder: (context,
                                                            control, _) {
                                                          return InkWell(
                                                            onTap: () {
                                                              if (control.value
                                                                          ?.url !=
                                                                      null ||
                                                                  control.value
                                                                          ?.filename !=
                                                                      null) {

                                                                showPreviewFile(
                                                                  context,
                                                                  fileSelect: FileSelect(
                                                                    // file name from object model
                                                                      url: control
                                                                          .value
                                                                          ?.url ??
                                                                          control
                                                                              .value!
                                                                              .filename!
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              control.value
                                                                      ?.url ??
                                                                  control.value
                                                                      ?.filename ??
                                                                  'File Name',
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  filePicker().then((value) {
                                                    if (value != null) {
                                                      currentForm
                                                          .control(
                                                              'letterOfGuaranteeFileSelect')
                                                          .value = value;
                                                      logger
                                                          .d('Value Not Null');
                                                    }
                                                  });
                                                },
                                                child: Chip(
                                                  label: const Text('ファイル選択'),
                                                  labelStyle: TextStyle(
                                                    color: context.appTheme
                                                        .secondaryBackgroundColor,
                                                  ),
                                                  backgroundColor: context
                                                      .appTheme.primaryColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // fileUpload(context, currentForm,
                                    //       'letterOfGuaranteeFileSelect'),
                                  ],
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
                        onTap: () => formArray.add(
                          FormGroup(
                            {
                              'date': FormControl<DateTime>(),
                              'passportDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'passportFileName': FormControl<FileSelect>(),
                              'passportFileSelect': FormControl<FileSelect>(),
                              'letterOfGuaranteeDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'letterOfGuaranteeFileSelect':
                                  FormControl<FileSelect>(),
                              'sendBy': FormControl<String>(value: ''),
                              'byEMS': FormControl<bool>(value: false),
                              'byFedex': FormControl<bool>(value: false),
                              'byOthers': FormControl<bool>(value: false),
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
                              '身元保証書を追加',
                              style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ReactiveFormArray(
                formArrayName: 'schedule',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text('治療予定表'),
                                    SizedBox(
                                      width: 150,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName: 'treatmentSchedule',
                                      ),
                                    ),
                                  ],
                                ),
                                fileUpload(context, currentForm,
                                    'treatmentScheduleFileSelect'),
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
                        onTap: () => formArray.add(FormGroup(
                          {
                            'treatmentSchedule': FormControl<DateTime>(
                              validators: [
                                Validators.pattern(
                                  ValidatorRegExp.date,
                                ),
                              ],
                            ),
                            'statementOfReasonsDate': FormControl<DateTime>(
                              validators: [
                                Validators.pattern(
                                  ValidatorRegExp.date,
                                ),
                              ],
                            ),
                          },
                        )),
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
                              '治療予定表を追加',
                              style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('理由書'),
                      SizedBox(
                        width: 178,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePickerField(
                          formControlName: 'statementOfReasonsDate',
                        ),
                      ),
                    ],
                  ),
                  fileUpload(
                      context,
                      formGroup.control('requiredInJapan') as FormGroup,
                      'statementOfReasonsFileSelect'),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('同行者リスト'),
                      SizedBox(
                        width: 135,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePickerField(
                          formControlName: 'travelCompanionListDate',
                        ),
                      ),
                    ],
                  ),
                  fileUpload(
                      context,
                      formGroup.control('requiredInJapan') as FormGroup,
                      'travelCompanionListFileSelect'),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Column(
                children: [
                  ReactiveFormArray(
                    formArrayName: 'travelInfo',
                    builder: (context, formArray, _) {
                      final rows = formArray.controls
                          .map((control) => control as FormGroup)
                          .map((currentForm) => ReactiveForm(
                                formGroup: currentForm,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(context
                                                .appTheme.spacing.marginMedium),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: context
                                                    .appTheme.primaryColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(context
                                                      .appTheme
                                                      .spacing
                                                      .borderRadiusMedium),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                      child:
                                                          ReactiveDatePickerField(
                                                        formControlName:
                                                            'landingPermissionDate',
                                                        label: '上陸許可日',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    const Expanded(
                                                      child:
                                                          ReactiveDatePickerField(
                                                        formControlName:
                                                            'visaValidityPeriodExpirationDate',
                                                        label: 'ビザの有効期限　満了日',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                      child:
                                                          ReactiveDatePickerField(
                                                        formControlName:
                                                            'dateOfEntryIntoJapan',
                                                        label: '日本への入国日',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    const Expanded(
                                                      child:
                                                          ReactiveDatePickerField(
                                                        formControlName:
                                                            'departureDateFromJapan',
                                                        label: '日本からの出国日',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Text(
                                                  '入国',
                                                  style: context
                                                      .textTheme.titleMedium,
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'departureIn',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '出発地',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'arrivalIn',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '到着地',
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
                                                        formControlName:
                                                            'flightNumberIn',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '便名',
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
                                                        formControlName:
                                                            'departureTimeIn',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '発時刻',
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
                                                        formControlName:
                                                            'arrivalTimeIn',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '着時刻',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Text('出国',
                                                    style: context
                                                        .textTheme.titleMedium),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'departureOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '出発地',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'arrivalOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '到着地',
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
                                                        formControlName:
                                                            'flightNumberOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '便名',
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
                                                        formControlName:
                                                            'departureTimeOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '発時刻',
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
                                                        formControlName:
                                                            'arrivalTimeOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '着時刻',
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
                                                        formControlName:
                                                            'seatNumberOut',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '座席番号',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'remarks',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '備考',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (formArray.controls
                                                      .indexOf(currentForm) !=
                                                  0) ...{
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    formArray.removeAt(formArray
                                                        .controls
                                                        .indexOf(currentForm));
                                                  },
                                                ),
                                              },
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          .toList();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColumnSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) {
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
                            onTap: () {
                              formArray.add(FormGroup(
                                {
                                  'landingPermissionDate':
                                      FormControl<DateTime>(
                                    validators: [
                                      Validators.pattern(
                                        ValidatorRegExp.date,
                                      ),
                                    ],
                                  ),
                                  'visaValidityPeriodExpirationDate':
                                      FormControl<DateTime>(
                                    validators: [
                                      Validators.pattern(
                                        ValidatorRegExp.date,
                                      ),
                                    ],
                                  ),
                                  'dateOfEntryIntoJapan': FormControl<DateTime>(
                                    validators: [
                                      Validators.pattern(
                                        ValidatorRegExp.date,
                                      ),
                                    ],
                                  ),
                                  'departureDateFromJapan':
                                      FormControl<DateTime>(
                                    validators: [
                                      Validators.pattern(
                                        ValidatorRegExp.date,
                                      ),
                                    ],
                                  ),

                                  // 入国 hand in
                                  'departureIn': FormControl<String>(value: ''),
                                  'arrivalIn': FormControl<String>(value: ''),
                                  'flightNumberIn':
                                      FormControl<String>(value: ''),
                                  'departureTimeIn':
                                      FormControl<String>(value: ''),
                                  'arrivalTimeIn':
                                      FormControl<String>(value: ''),

                                  // 出国 hand out
                                  'departureOut':
                                      FormControl<String>(value: ''),
                                  'arrivalOut': FormControl<String>(value: ''),
                                  'flightNumberOut':
                                      FormControl<String>(value: ''),
                                  'departureTimeOut':
                                      FormControl<String>(value: ''),
                                  'arrivalTimeOut':
                                      FormControl<String>(value: ''),
                                  'seatNumberOut':
                                      FormControl<String>(value: ''),

                                  'remarks': FormControl<String>(value: ''),
                                },
                              ));
                            },
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
                                  '追加',
                                  style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      color: context.appTheme.primaryColor),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget
  fileUpload(
      BuildContext context, FormGroup currentForm, String fileName) {
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
                  formControlName: fileName,
                  builder: (context, control, _) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: PreviewFile(fileSelect: control.value!),
                          ),
                        );
                      },
                      child: Text(
                        control.value?.url ??
                            control.value?.filename ??
                            'File Name',
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
                    currentForm.control(fileName).value = value;
                    logger.d('Value Not Null');
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
