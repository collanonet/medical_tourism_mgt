// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TravelCompanion extends StatelessWidget {
  const TravelCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ReactiveForm(
      formGroup: formGroup.control('travelCompanion') as FormGroup,
      child: Container(
        padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
        decoration: BoxDecoration(
          color: const Color(0xffF0F3F5),
          borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '同行者',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'nameRomaji',
                        decoration: const InputDecoration(
                          label: Text(
                            '氏名（ローマ字）',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    const Expanded(
                      child: ReactiveDatePickerField(
                        formControlName: 'dateBirth',
                        label: '生年月日',
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('年齢'),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: ReactiveValueListenableBuilder<DateTime>(
                                  formControlName: 'dateBirth',
                                  builder: (context, value, _) {
                                    return Text(value.value == null
                                        ? '0歳'
                                        : '${DateTime.now().year - value.value!.year}歳');
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('性別'),
                              Row(
                                children: [
                                  IntrinsicWidth(
                                    stepWidth: 20,
                                    child: ReactiveRadioListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      value: 'male',
                                      formControlName: 'sex',
                                      title: const Text('男性'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 20,
                                    child: ReactiveRadioListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      value: 'female',
                                      formControlName: 'sex',
                                      title: const Text('女性'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'addressArea',
                        decoration: const InputDecoration(
                          label: Text(
                            '居住地域',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'numberPassport',
                        decoration: const InputDecoration(
                          label: Text(
                            '旅券番号',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                ReactiveFormArray(
                  formArrayName: 'travelInfo',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: context.appTheme.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'landingPermissionDate',
                                                label: '上陸許可日',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            const Expanded(
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'visaValidityPeriodExpirationDate',
                                                label: 'ビザの有効期限　満了日',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'dateOfEntryIntoJapan',
                                                label: '日本への入国日',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            const Expanded(
                                              child: ReactiveDatePickerField(
                                                  formControlName:
                                                      'departureDateFromJapan',
                                                  label: '日本からの出国日'),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Text('入国'),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: ReactiveTextField(
                                                formControlName: 'departureIn',
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text(
                                                    '出発地',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: ReactiveTextField(
                                                formControlName: 'arrivalIn',
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text(
                                                    '到着地',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Text('出国'),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: ReactiveTextField(
                                                formControlName: 'departureOut',
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text(
                                                    '出発地',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: ReactiveTextField(
                                                formControlName: 'arrivalOut',
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text(
                                                    '到着地',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
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
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                          ),
                        )
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
                                'landingPermissionDate': FormControl<DateTime>(
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
                                'departureDateFromJapan': FormControl<DateTime>(
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
                                'arrivalTimeIn': FormControl<String>(value: ''),

                                // 出国 hand out
                                'departureOut': FormControl<String>(value: ''),
                                'arrivalOut': FormControl<String>(value: ''),
                                'flightNumberOut':
                                    FormControl<String>(value: ''),
                                'departureTimeOut':
                                    FormControl<String>(value: ''),
                                'arrivalTimeOut':
                                    FormControl<String>(value: ''),
                                'seatNumberOut': FormControl<String>(value: ''),

                                'remarks': FormControl<String>(value: ''),
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
                                '上記セットを追加',
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
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'travelRemarks',
                        decoration: const InputDecoration(
                          label: Text(
                            '備考',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ビザの取り下げ', style: context.textTheme.titleMedium),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    IntrinsicWidth(
                      stepWidth: 300,
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: 'visaWithdrawalTarget',
                        title: const Text('ビザ取下対象とする'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('理由'),
                        Row(
                          children: [
                            IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveRadioListTile(
                                value: 'PatientDeath',
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                formControlName: 'reason',
                                title: const Text('患者死亡'),
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveRadioListTile(
                                value: 'others',
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                formControlName: 'reason',
                                title: const Text('その他'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'remarks',
                        decoration: const InputDecoration(
                          label: Text('備考'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ビザ取得後に必要なもの',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                ReactiveForm(
                  formGroup: formGroup.control('travelCompanion') as FormGroup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReactiveFormArray(
                        formArrayName: 'vasaInfo',
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
                                                Text('ビザのページ'),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                IntrinsicWidth(
                                                  stepWidth: 200,
                                                  child:
                                                      ReactiveDatePickerField(
                                                    formControlName: 'visaPage',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            fileUpload(context, currentForm,
                                                'visaPageFileName'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Row(
                                              children: [
                                                Text('上陸許可証'),
                                                SizedBox(
                                                  width: 150,
                                                ),
                                                IntrinsicWidth(
                                                  stepWidth: 200,
                                                  child:
                                                      ReactiveDatePickerField(
                                                    formControlName:
                                                        'landingPermit',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            fileUpload(context, currentForm,
                                                'landingPermitFileName'),
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
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: rows.toList(),
                              ),
                              SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  formArray.add(
                                    FormGroup({
                                      'visaPage': FormControl<DateTime>(
                                        validators: [
                                          Validators.pattern(
                                            ValidatorRegExp.date,
                                          ),
                                        ],
                                      ),
                                      'visaPageFileName':
                                          FormControl<FileSelect>(),
                                      'landingPermit': FormControl<DateTime>(
                                        validators: [
                                          Validators.pattern(
                                            ValidatorRegExp.date,
                                          ),
                                        ],
                                      ),
                                      'landingPermitFileName':
                                          FormControl<FileSelect>(),
                                    }),
                                  );
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
                                      width:
                                          context.appTheme.spacing.marginSmall,
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ReactiveFormArray(
                        formArrayName: 'ticket',
                        builder: (context, formArray, _) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map((currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text('来日時の飛行機チケット'),
                                            SizedBox(
                                              width: 75,
                                            ),
                                            IntrinsicWidth(
                                              stepWidth: 200,
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'planeTicketForYourVisitToJapan',
                                              ),
                                            ),
                                          ],
                                        ),
                                        fileUpload(context, currentForm,
                                            'planeTicketForYourVisitToJapanFileName'),
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
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: rows.toList(),
                              ),
                              SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  formArray.add(
                                    FormGroup({
                                      'planeTicketForYourVisitToJapan':
                                          FormControl<DateTime>(
                                        validators: [
                                          Validators.pattern(
                                            ValidatorRegExp.date,
                                          ),
                                        ],
                                      ),
                                      'planeTicketForYourVisitToJapanFileName':
                                          FormControl<FileSelect>(),
                                    }),
                                  );
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
                                      width:
                                          context.appTheme.spacing.marginSmall,
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ReactiveFormArray(
                        formArrayName: 'ticketBack',
                        builder: (context, formArray, _) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map((currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text('帰国時の飛行機チケット'),
                                            SizedBox(
                                              width: 75,
                                            ),
                                            IntrinsicWidth(
                                              stepWidth: 200,
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'returnFlightTicket',
                                              ),
                                            ),
                                          ],
                                        ),
                                        fileUpload(context, currentForm,
                                            'returnFlightTicketFileName'),
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
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: rows.toList(),
                              ),
                              SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  formArray.add(
                                    FormGroup({
                                      'returnFlightTicket':
                                          FormControl<DateTime>(
                                        validators: [
                                          Validators.pattern(
                                            ValidatorRegExp.date,
                                          ),
                                        ],
                                      ),
                                      'returnFlightTicketFileName':
                                          FormControl<FileSelect>(),
                                    }),
                                  );
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
                                      width:
                                          context.appTheme.spacing.marginSmall,
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ReactiveFormArray(
                        formArrayName: 'boardingPass',
                        builder: (context, formArray, _) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map((currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text('帰国時のボーディングパス'),
                                            SizedBox(
                                              width: 65,
                                            ),
                                            IntrinsicWidth(
                                              stepWidth: 200,
                                              child: ReactiveDatePickerField(
                                                formControlName:
                                                    'boardingPassForReturnFlight',
                                              ),
                                            ),
                                          ],
                                        ),
                                        fileUpload(context, currentForm,
                                            'boardingPassForReturnFlightFileName'),
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
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: rows.toList(),
                              ),
                              SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  formArray.add(
                                    FormGroup({
                                      'boardingPassForReturnFlight':
                                          FormControl<DateTime>(
                                        validators: [
                                          Validators.pattern(
                                            ValidatorRegExp.date,
                                          ),
                                        ],
                                      ),
                                      'boardingPassForReturnFlightFileName':
                                          FormControl<FileSelect>(),
                                    }),
                                  );
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
                                      width:
                                          context.appTheme.spacing.marginSmall,
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text('在留資格認定証明書'),
                              SizedBox(
                                width: 100,
                              ),
                              IntrinsicWidth(
                                stepWidth: 200,
                                child: ReactiveDatePickerField(
                                  formControlName: 'certificateOfEligibility',
                                ),
                              ),
                            ],
                          ),
                          fileUpload(
                              context,
                              formGroup.control('travelCompanion') as FormGroup,
                              'certificateOfEligibilityFileName'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget fileUpload(
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
                    return Row(
                      children: [
                        if (control.value?.url != null ||
                            control.value?.filename != null)
                          IconButton(
                            onPressed: () {
                              currentForm.control(fileName).value =
                                  FileSelect();
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        TextButton(
                          onPressed: () {
                            if (control.value?.url != null ||
                                control.value?.filename != null)
                              showPreviewFile(
                                context,
                                fileSelect: control.value!,
                              );
                          },
                          child: Text(
                            control.value?.url ??
                                control.value?.filename ??
                                'File Name',
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                      ],
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
