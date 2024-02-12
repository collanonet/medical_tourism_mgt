import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../basic_info_model.dart';

class MedicalRecordSection extends StatefulWidget {
  const MedicalRecordSection({super.key});

  @override
  State<MedicalRecordSection> createState() => _MedicalRecordSectionState();
}

class _MedicalRecordSectionState extends State<MedicalRecordSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return ValueListenableBuilder(
        valueListenable: context.read<BasicInformationModel>().medicalRecord,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    context.appTheme.spacing.borderRadiusMedium,
                  ),
                ),
                color: const Color(0xffF8F8D9),
              ),
              padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  const Text(
                    '本人',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ), // TODO: l10n 対応 (本人)  (patient)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'dateOfBirth',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'dateOfBirth',
                              readOnly: true,
                              onTap: (value) => picker.showPicker(),
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              onChanged: (value) {
                                logger.d(value);
                                formGroup.control('age').value =
                                    DateTime.now().year - value.value!.year;
                                setState(() {});
                              },
                              onSubmitted: (value) {
                                logger.d(value);
                                formGroup.control('age').value =
                                    DateTime.now().year - value.value!.year;
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                label: Text(
                                  '生年月日', // TODO: l10n 対応 (生年月日) (dateOfBirth)
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '年齢', // TODO: l10n 対応 (年齢) (age)
                                      ),
                                      SizedBox(
                                        height: context
                                            .appTheme.spacing.marginSmall,
                                      ),
                                      ReactiveValueListenableBuilder<DateTime>(
                                          formControlName: 'dateOfBirth',
                                          builder: (context, value, child) {
                                            var age = 0;
                                            if (value.value != null) {
                                              age = DateTime.now().year -
                                                  value.value!.year;
                                              formGroup.control('age').value =
                                                  DateTime.now().year -
                                                      value.value!.year;
                                            }
                                            return Text(
                                              '$age 歳', // TODO: l10n 対応 (歳) (age)
                                            );
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '性別', //
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: ReactiveCheckboxListTile(
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'isMale',
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              onChanged: (value) {
                                                formGroup
                                                        .control('gender')
                                                        .value =
                                                    value.value == true;
                                                formGroup
                                                        .control('isFemale')
                                                        .value =
                                                    value.value == false;
                                              },
                                              title: Text('男性'),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: ReactiveCheckboxListTile(
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'isFemale',
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              onChanged: (value) {
                                                formGroup
                                                        .control('gender')
                                                        .value =
                                                    value.value == false;
                                                formGroup
                                                        .control('isMale')
                                                        .value =
                                                    value.value == false;
                                              },
                                              title: Text('女性'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Container(
                                width: 100,
                                child: ReactiveTextField<int?>(
                                  formControlName: 'height',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '身長',
                                    ),
                                    suffixText: 'cm',
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Container(
                                width: 100,
                                child: ReactiveTextField<int?>(
                                  formControlName: 'weight',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '体重',
                                    ),
                                    suffixText: 'kg',
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  snackBarWidget(message: 'まだ開発中');
                                },
                                child: const Text(
                                  'パスポートを表示する',
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'arrivalDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'arrivalDate',
                              readOnly: true,
                              onTap: (value) => picker.showPicker(),
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                label: Text(
                                  '来日日', // TODO: l10n 対応 (来日日) (arrivalDate)
                                ),
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'consultationDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'consultationDate',
                              readOnly: true,
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              onTap: (value) => picker.showPicker(),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                label: Text('受診日'),
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'returnDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField(
                              formControlName: 'returnDate',
                              readOnly: true,
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              onTap: (value) => picker.showPicker(),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                label: Text(
                                  '帰国日',
                                ),
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'proposalNumber',
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            label: Text(
                              '案件番号', // TODO: l10n 対応 (案件番号) (caseNumber)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'receptionDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'receptionDate',
                              readOnly: true,
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              onTap: (value) => picker.showPicker(),
                              decoration: const InputDecoration(
                                label: Text(
                                  '受付日', // TODO: l10n 対応 (受付日) (receptionDate)
                                ),
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDropdownFormField(
                          formControlName: 'progress',
                          decoration: InputDecoration(
                            label: Text(
                              '進捗',
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: '受注',
                              child: Text('受注'),
                            ),
                            DropdownMenuItem(
                              value: '見積',
                              child: Text('見積'),
                            ),
                            DropdownMenuItem(
                              value: '訪問',
                              child: Text('訪問'),
                            ),
                            DropdownMenuItem(
                              value: '契約',
                              child: Text('契約'),
                            ),
                            DropdownMenuItem(
                              value: '完了',
                              child: Text('完了'),
                            ),
                            DropdownMenuItem(
                              value: 'キャンセル',
                              child: Text('キャンセル'),
                            ),
                            DropdownMenuItem(
                              value: 'CXL',
                              child: Text('CXL'),
                            ),
                            DropdownMenuItem(
                              value: '延期',
                              child: Text('延期'),
                            ),
                            DropdownMenuItem(
                              value: '消滅',
                              child: Text('消滅'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ReactiveFormArray(
                    formArrayName: 'type',
                    builder: (context, formArray, child) {
                      final rows = formArray.controls
                          .map((control) => control as FormGroup)
                          .map(
                            (currentForm) => ReactiveForm(
                              formGroup: currentForm,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'type',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '種別',
                                        ),
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: '治療',
                                          child: Text('治療'),
                                        ),
                                        DropdownMenuItem(
                                          value: '健診',
                                          child: Text('健診'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'その他',
                                          child: Text('その他'),
                                        ),
                                        DropdownMenuItem(
                                          value: '検査ｷｯﾄ',
                                          child: Text('検査ｷｯﾄ'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'ビザ',
                                          child: Text('ビザ'),
                                        ),
                                        DropdownMenuItem(
                                          value: '旅行',
                                          child: Text('旅行'),
                                        ),
                                        DropdownMenuItem(
                                          value: '視察',
                                          child: Text('視察'),
                                        ),
                                        DropdownMenuItem(
                                          value: '再生',
                                          child: Text('再生'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const Expanded(flex: 2, child: SizedBox())
                                ],
                              ),
                            ),
                          );

                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        children: rows.toList(),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      (formGroup.control('type') as FormArray).add(
                        FormGroup({
                          'type': FormControl<String>(),
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
                          width: context.appTheme.spacing.marginSmall,
                        ),
                        Text(
                          '病院を追加',
                          style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                              color: context.appTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'advancePaymentDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'advancePaymentDate',
                              readOnly: true,
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                              onTap: (value) => picker.showPicker(),
                              decoration: const InputDecoration(
                                label: Text(
                                  '前金受取日', //  TODO: l10n 対応 (前金受取日) (advancePaymentDate)
                                ),
                                suffixIcon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      const Expanded(
                        child: ReactiveDropdownFormField(
                          formControlName: 'receivingMethod',
                          decoration: InputDecoration(
                            label: Text(
                              '受取方法',
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'WeChat',
                              child: Text('WeChat'),
                            ),
                            DropdownMenuItem(
                              value: 'Visa Card',
                              child: Text('Visa Card'),
                            ),
                            DropdownMenuItem(
                              value: 'Master Card',
                              child: Text('Master Card'),
                            ),
                            DropdownMenuItem(
                              value: 'PayPal',
                              child: Text('PayPal'),
                            ),
                            DropdownMenuItem(
                              value: 'Alipay',
                              child: Text('Alipay'),
                            ),
                            DropdownMenuItem(
                              value: 'Bank Transfer',
                              child: Text('Bank Transfer'),
                            ),
                            DropdownMenuItem(
                              value: 'Cash',
                              child: Text('Cash'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
