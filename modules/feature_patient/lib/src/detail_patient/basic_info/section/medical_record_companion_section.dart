import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../basic_info_model.dart';

class MedicalRecordCompanionSection extends StatefulWidget {
  const MedicalRecordCompanionSection({super.key});

  @override
  State<MedicalRecordCompanionSection> createState() =>
      _MedicalRecordCompanionSectionState();
}

class _MedicalRecordCompanionSectionState
    extends State<MedicalRecordCompanionSection> {
  List gender = ['male', 'female'];

  Row addRadioButton(int btnValue, String title, FormGroup formGroup) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: formGroup.control('gender').value,
          onChanged: (value) {
            setState(() {
              formGroup.control('gender').value = value;
            });
          },
        ),
        Text(title == 'male' ? '男性' : '女性')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_Companion') as FormArray;

    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: context.appTheme.spacing.marginMedium,
        );
      },
      children: [
        Consumer<BasicInformationModel>(
          builder: (context, model, child) => Skeletonizer(
            enabled: model.medicalRecordCompanions.loading,
            child: ReactiveFormArray(
              formArrayName: 'MEDICAL_RECORD_Companion',
              builder: (context, formArray, child) {
                final rows = formArray.controls
                    .map((control) => control as FormGroup)
                    .map(
                      (currentForm) => ReactiveForm(
                        formGroup: currentForm,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              context.appTheme.spacing.borderRadiusMedium,
                            ),
                            color: const Color(0xffF0F3F5),
                          ),
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginMedium),
                          child: ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              const Text(
                                '同行者',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ), // TODO: l10n 対応 (同行者) (companion)
                              RowSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          checkColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide(
                                              color: Colors.grey,
                                            ),

                                          ),
                                          value: currentForm
                                              .control('leader')
                                              .value,
                                          onChanged: (value) {
                                            setState(() {
                                              currentForm
                                                  .control('leader')
                                                  .value = value;
                                            });
                                          }),
                                      Text(
                                        '同行者のリーダーとする', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'remarks',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '備考', //    TODO: l10n 対応 (備考) (remarks
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              RowSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children:  [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'nameInRomanized',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '氏名（ローマ字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'nameInChineseOrKanji',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '氏名（中国語漢字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'nameInJapaneseKanji',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '氏名（日本語漢字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              RowSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children:  [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'nameInKana',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '氏名（カナ）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'nationality',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '国籍', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'relationship',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '続柄', //
                                        ),
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: '父親',
                                          child: Text('父親'),
                                        ),
                                        DropdownMenuItem(
                                          value: '母親',
                                          child: Text('母親'),
                                        ),
                                        DropdownMenuItem(
                                          value: '祖父',
                                          child: Text('祖父'),
                                        ),
                                        DropdownMenuItem(
                                          value: '祖母',
                                          child: Text('祖母'),
                                        ),
                                        DropdownMenuItem(
                                          value: '兄弟',
                                          child: Text('兄弟'),
                                        ),
                                        DropdownMenuItem(
                                          value: '姉妹',
                                          child: Text('姉妹'),
                                        ),
                                        DropdownMenuItem(
                                          value: '夫',
                                          child: Text('夫'),
                                        ),
                                        DropdownMenuItem(
                                          value: '妻',
                                          child: Text('妻'),
                                        ),
                                        DropdownMenuItem(
                                          value: '息子',
                                          child: Text('息子'),
                                        ),
                                        DropdownMenuItem(
                                          value: '娘',
                                          child: Text('娘'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'その他',
                                          child: Text('その他'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveDatePicker<DateTime>(
                                      formControlName: 'dateOfBirth',
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'dateOfBirth',
                                          readOnly: true,
                                          onTap: (value) => picker.showPicker(),
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
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
                                            Text(
                                              '${int.tryParse(currentForm.control('age').value.toString()) ?? 0}歳', // TODO: l10n 対応 (歳) (age)
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
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
                                              children: <Widget>[
                                                addRadioButton(
                                                    0, 'Male', currentForm),
                                                addRadioButton(
                                                    1, 'Female', currentForm),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text('パスポート', // TODO: l10n 対応 (パスポート) (passport)
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              RowSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: [
                                   Expanded(
                                    child: ReactiveTextField(
                                      formControlName: 'passportNumber',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '旅券番号', //   TODO: l10n 対応 (旅券番号) (passportNumber)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveDatePicker<DateTime>(
                                      formControlName: 'issueDate',
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'issueDate',
                                          readOnly: true,
                                          onTap: (value) => picker.showPicker(),
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '発行日', //  TODO: l10n 対応 (発行日) (issueDate)
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
                                  Expanded(
                                    child: ReactiveDatePicker<DateTime>(
                                      formControlName: 'expirationDate',
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'expirationDate',
                                          readOnly: true,
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          onTap: (value) => picker.showPicker(),
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '有効期限', // TODO: l10n 対応 (有効期限) (expirationDate)
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
                                  const Expanded(
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'visaType',
                                      decoration: InputDecoration(
                                        label: Text(
                                          'ビザ', //
                                        ),
                                        hintText: '同行者ビザ？？',
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: 'medicalGuarantee',
                                          child: Text('ビザ'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'other',
                                          child: Text('その他（ビザの種類）'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
          ),
        ),
        InkWell(
          onTap: () => formArray.add(
            FormGroup({
              'id': FormControl<String?>(),
              'leader': FormControl<bool>(value: false),
              'remarks': FormControl<String?>(),
              'nameInRomanized': FormControl<String?>(),
              'nameInChineseOrKanji': FormControl<String?>(),
              'nameInJapaneseKanji': FormControl<String?>(),
              'nameInKana': FormControl<String?>(),
              'nationality': FormControl<String?>(),
              'relationship': FormControl<String>(value: '父親'),
              'dateOfBirth': FormControl<DateTime>(),
              'age': FormControl<int?>(),
              'gender': FormControl<String>(value: 'male'),
              'passportNumber': FormControl<String?>(),
              'issueDate': FormControl<DateTime>(),
              'expirationDate': FormControl<DateTime>(),
              'visaType': FormControl<String>(value: 'medicalGuarantee'),
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
                '同行者を追加',
                style: TextStyle(color: context.appTheme.primaryColor),
              ) // TODO: l10n 対応 (同行者を追加) (addCompanion)
            ],
          ),
        )
      ],
    );
  }
}
