import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'pick_medical_data_file_page.dart';

class ShortSummaryScreen extends StatefulWidget {
  const ShortSummaryScreen({super.key});

  @override
  State<ShortSummaryScreen> createState() => _ShortSummaryScreenState();
}

class _ShortSummaryScreenState extends State<ShortSummaryScreen> {
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

  List yesNo = ['あり', 'なし']; // TODO: l10n 対応 (あり) (yes) (なし) (no)

  String selectyesNo = 'あり';

  Row addRadioButtonYesNo(int btnValue, String title, FormGroup formGroup) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: yesNo[btnValue],
          groupValue: selectyesNo,
          onChanged: (value) {
            setState(() {
              selectyesNo = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ReactiveDatePicker<DateTime>(
                  formControlName: 'entry_date',
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (BuildContext context,
                      ReactiveDatePickerDelegate<dynamic> picker,
                      Widget? child) {
                    return ReactiveTextField<DateTime>(
                      formControlName: 'entry_date',
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
                child: SizedBox(
                  width: context.appTheme.spacing.marginMedium,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                ),
              ),
              color: const Color(0xffF8F8D9),
            ),
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'name_passport',
                        decoration: InputDecoration(
                          label: Text(
                            '氏名（パスポート）',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'date_of_birth',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'date_of_birth',
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
                                  formControlName: 'date_of_birth',
                                  builder: (context, value, child) {
                                    if (value.value != null) {
                                      formGroup.control('age').value =
                                          DateTime.now().year -
                                              value.value!.year;
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
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'name_chinese_vietnamese',
                        decoration: InputDecoration(
                          label: Text(
                            '氏名（中国語漢字/ベトナム語表記）',
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'name_kana',
                        decoration: InputDecoration(
                          label: Text(
                            '氏名（カナ）',
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'current_address',
                        decoration: InputDecoration(
                          label: Text(
                            '現住所',
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'mobile_number_patient',
                        decoration: InputDecoration(
                          label: Text(
                            '携帯番号（患者様）',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'mobile_number_domestic',
                        decoration: InputDecoration(
                          label: Text(
                            '携帯番号（国内可）',
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
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Expanded(
                child: ReactiveTextField(
                  formControlName: 'course_illness_test_results_etc',
                  minLines: 1,
                  maxLines: 15,
                  decoration: InputDecoration(
                    label: Text(
                      '病状経過および検査結果など',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          InkWell(
            onTap: () {
              showMedicalDataFilePicker(context);
            },
            child: Container(
              padding: EdgeInsets.all(
                context.appTheme.spacing.marginExtraLarge,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                )),
                border: Border.all(
                  color: context.appTheme.primaryColor,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copy_all_rounded,
                    size: 50,
                    color: context.appTheme.primaryColor,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showMedicalDataFilePicker(context);
                    },
                    child: const Text(
                      '書類を選択する',
                      style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showMedicalDataFilePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const PickMedicalDataFilePage(),
      ),
    );
  }
}
