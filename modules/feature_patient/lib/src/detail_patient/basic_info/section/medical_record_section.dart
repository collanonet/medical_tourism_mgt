// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../detail_patient_model.dart';
import '../basic_info_model.dart';

class MedicalRecordSection extends StatefulWidget {
  const MedicalRecordSection({
    super.key,
    this.showHeader = true,
  });

  final bool showHeader;

  @override
  State<MedicalRecordSection> createState() => _MedicalRecordSectionState();
}

class _MedicalRecordSectionState extends State<MedicalRecordSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return ValueListenableListener(
      valueListenable: context.read<BasicInformationModel>().medicalRecord,
      onListen: () {
        var data = context.read<BasicInformationModel>().medicalRecord.value;

        if (data.hasData) {
          context
              .read<DetailPatientModel>()
              .updateMedicalRecord(data.requireData);
        }
      },
      child: ValueListenableBuilder(
          valueListenable: context.watch<BasicInformationModel>().medicalRecord,
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
                    if (widget.showHeader)
                      const Text(
                        '本人',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          package: 'core_ui',
                          fontWeight: FontWeight.bold,
                        ),
                      ), // TODO: l10n 対応 (本人)  (patient)
                    // 氏名（ローマ字）
                    const Text(
                      '氏名（ローマ字）',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.familyNameRomanized',
                            decoration: const InputDecoration(
                              label: Text('ファミリーネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.middleNameRomanized',
                            decoration: const InputDecoration(
                              label: Text('ミドルネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.firstNameRomanized',
                            decoration: const InputDecoration(
                              label: Text('ファーストネーム'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 氏名（中国語漢字/ベトナム語表記）
                    const Text(
                      '氏名（中国語漢字/ベトナム語表記）',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.familyNameChineseOrVietnamese',
                            decoration: const InputDecoration(
                              label: Text('ファミリーネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.middleNameChineseOrVietnamese',
                            decoration: const InputDecoration(
                              label: Text('ミドルネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.firstNameChineseOrVietnamese',
                            decoration: const InputDecoration(
                              label: Text('ファーストネーム'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 氏名（日本語漢字）※中国人のみ
                    const Text(
                      '氏名（日本語漢字）※中国人のみ',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.familyNameJapaneseForChinese',
                            decoration: const InputDecoration(
                              label: Text('ファミリーネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.middleNameJapaneseForChinese',
                            decoration: const InputDecoration(
                              label: Text('ミドルネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.firstNameJapaneseForChinese',
                            decoration: const InputDecoration(
                              label: Text('ファーストネーム'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 氏名（カナ）
                    const Text(
                      '氏名（カナ）',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.familyNameJapaneseForNonChinese',
                            decoration: const InputDecoration(
                              label: Text('ファミリーネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.middleNameJapaneseForNonChinese',
                            decoration: const InputDecoration(
                              label: Text('ミドルネーム'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'PATIENT_NAMES.firstNameJapaneseForNonChinese',
                            decoration: const InputDecoration(
                              label: Text('ファーストネーム'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveDatePickerField(
                            label: '生年月日',
                            formControlName: 'dateOfBirth',
                            onChanged: (value) {
                              logger.d(value.value);
                              formGroup.control('age').value =
                                  DateTime.now().year - value.value!.year;
                              setState(() {});
                            },
                            onSubmitted: (value) {
                              formGroup.control('age').value =
                                  DateTime.now().year - value.value!.year;
                              setState(() {});
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
                                          IntrinsicWidth(
                                            child: ReactiveRadioListTile(
                                              value: true,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'gender',
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              title: const Text('男性'),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            child: ReactiveRadioListTile(
                                              value: false,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'gender',
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              title: const Text('女性'),
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
                              IntrinsicWidth(
                                child: ReactiveTextField<double>(
                                  formControlName: 'height',
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '身長',
                                    ),
                                    suffixText: 'cm',
                                  ),
                                  inputFormatters: [
                                    SingleDotInputFormatter(),
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]*\.?[0-9]*$'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                child: ReactiveTextField<double>(
                                  formControlName: 'weight',
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '体重',
                                    ),
                                    suffixText: 'kg',
                                  ),
                                  inputFormatters: [
                                    SingleDotInputFormatter(),
                                    // allow only number and .
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]*\.?[0-9]*$'),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: context.appTheme.spacing.marginMedium,
                              // ),
                              // IntrinsicWidth(
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       snackBarWidget(message: 'まだ開発中');
                              //     },
                              //     child: const Text(
                              //       'パスポートを表示する',
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: ReactiveDatePickerField(
                            formControlName: 'receptionDate',
                            label: '受付日',
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        const Expanded(
                          child: ReactiveDatePickerField(
                            formControlName: 'consultationDate',
                            label: '受診日',
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'proposalNumber',
                            decoration: const InputDecoration(
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
                        const Expanded(
                          child: SizedBox(),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        const Expanded(
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
                                            value: '検診',
                                            child: Text('検診'),
                                          ),
                                          DropdownMenuItem(
                                            value: '再生',
                                            child: Text('再生'),
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
                                            value: '視察',
                                            child: Text('視察'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'その他',
                                            child: Text('その他'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        flex: 2,
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
                                        ))
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
                            '種別を追加',
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
                        const Expanded(
                          child: ReactiveDatePickerField(
                            formControlName: 'advancePaymentDate',
                            label: '前金受取日',
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
                                value: 'Credit Card',
                                child: Text('Credit Card'),
                              ),
                              DropdownMenuItem(
                                value: 'Chinese QR code payment',
                                child: Text('Chinese QR code payment'),
                              ),
                              DropdownMenuItem(
                                value: 'Bank Transfer',
                                child: Text('Bank Transfer'),
                              ),
                              DropdownMenuItem(
                                value: 'Cash',
                                child: Text('Cash'),
                              ),
                              DropdownMenuItem(
                                value: 'Local subsidiaries',
                                child: Text('Local subsidiaries'),
                              ),
                              DropdownMenuItem(
                                value: 'Other',
                                child: Text('Other'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                          child: ReactiveValueListenableBuilder<String>(
                            formControlName: 'receivingMethod',
                            builder: (context, control, child) {
                              return control.value == 'Other'
                                  ? ReactiveTextField(
                                      formControlName: 'receivingMethodOther',
                                      decoration: InputDecoration(
                                        label: Text('受取方法（その他）'),
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
