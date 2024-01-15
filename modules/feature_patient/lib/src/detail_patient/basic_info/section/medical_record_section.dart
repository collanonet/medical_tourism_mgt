import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List gender = ['male', 'female'];

  String selectGender = 'male';

  Row addRadioButton(int btnValue, String title, FormGroup formGroup) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: selectGender,
          onChanged: (value) {
            setState(() {
              formGroup.control('gender').value = value;
              selectGender = value;
            });
          },
        ),
        Text(title == 'male' ? '男性' : '女性')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return Skeletonizer(
      enabled: context.read<BasicInformationModel>().medicalRecord.loading,
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
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '年齢', // TODO: l10n 対応 (年齢) (age)
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginSmall,
                          ),
                          ReactiveValueListenableBuilder<DateTime>(
                              formControlName: 'dateOfBirth',
                              builder: (context, value, child) {
                                if (value.value != null) {
                                  formGroup.control('age').value =
                                      DateTime.now().year - value.value!.year;
                                }
                                return Text(
                                  '${int.tryParse(formGroup.control('age').value.toString()) ?? 0}歳', // TODO: l10n 対応 (歳) (age)
                                );
                              }),
                        ],
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '性別', //
                          ),
                          Row(
                            children: <Widget>[
                              addRadioButton(0, 'Male', formGroup),
                              addRadioButton(1, 'Female', formGroup),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveTextField(
                    formControlName: 'height',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        '身長',
                      ),
                      suffixText: 'cm',
                    ),
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveTextField(
                    formControlName: 'weight',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        '体重',
                      ),
                      suffixText: 'kg',
                    ),
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'パスポートを表示する',
                      style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
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
                    formControlName: 'examinationDate',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return ReactiveTextField<DateTime>(
                        formControlName: 'examinationDate',
                        readOnly: true,
                        valueAccessor: DateTimeValueAccessor(
                          dateTimeFormat: DateFormat('yyyy/MM/dd'),
                        ),
                        onTap: (value) => picker.showPicker(),
                        decoration: const InputDecoration(
                          label: Text(
                            '受診日', // TODO: l10n 対応 (受診日) (examinationDate)
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
                    formControlName: 'departureDate',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return ReactiveTextField(
                        formControlName: 'departureDate',
                        readOnly: true,
                        valueAccessor: DateTimeValueAccessor(
                          dateTimeFormat: DateFormat('yyyy/MM/dd'),
                        ),
                        onTap: (value) => picker.showPicker(),
                        decoration: const InputDecoration(
                          label: Text(
                            '帰国日', // TODO: l10n 対応 (帰国日) (departureDate)
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
              children: [
                Expanded(
                  child: ReactiveTextField(
                    formControlName: 'caseNumber',
                    decoration: InputDecoration(
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
                  child: ReactiveTextField(
                    formControlName: 'progress',
                    decoration: InputDecoration(
                      label: Text(
                        '進捗', //  TODO: l10n 対応 (進捗) (progress)
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
                    formControlName: 'type',
                    decoration: InputDecoration(
                      label: Text(
                        '種別', //  TODO: l10n 対応 (種別) (type)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
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
        package: 'core_ui',color: context.appTheme.primaryColor),
                  )
                ],
              ),
            ),
            Row(
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
                    formControlName: 'paymentMethod',
                    decoration: InputDecoration(
                      label: Text(
                        '受取方法', //  TODO: l10n 対応 (受取方法) (receptionMethod)
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
  }
}
