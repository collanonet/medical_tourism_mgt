// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'fileForm/file_form.dart';
import 'fileForm/popup_file_form.dart';
import 'normal_summary_model.dart';

class NormalSummaryScreen extends StatefulWidget {
  const NormalSummaryScreen({super.key});

  @override
  State<NormalSummaryScreen> createState() => _NormalSummaryScreenState();
}

class _NormalSummaryScreenState extends State<NormalSummaryScreen> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.read<NormalSummaryModel>().medicalRecordSummary,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          IntrinsicWidth(
                            stepWidth: 200,
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'entryDate',
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'entryDate',
                                  valueAccessor: DateTimeValueAccessor(
                                    dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                  ),
                                  decoration: InputDecoration(
                                    label: const Text(
                                      '記載日',
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        CupertinoIcons.calendar,
                                        color: Colors.grey,
                                      ),
                                      onPressed: picker.showPicker,
                                    ),
                                  ),
                                  inputFormatters: [
                                    formatter.dateFormatter,
                                  ],
                                );
                              },
                            ),
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
                              color: const Color(0xffF0F3F5),
                            ),
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'namePassport',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（パスポート）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'dateOfBirth',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName: 'dateOfBirth',
                                            valueAccessor:
                                                DateTimeValueAccessor(
                                              dateTimeFormat:
                                                  DateFormat('yyyy/MM/dd'),
                                            ),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF0F3F5),
                                              label: const Text(
                                                '生年月日', // TODO: l10n 対応 (生年月日) (dateOfBirth)
                                              ),
                                              suffixIcon: IconButton(
                                                icon: const Icon(
                                                  CupertinoIcons.calendar,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: picker.showPicker,
                                              ),
                                            ),
                                            inputFormatters: [
                                              formatter.dateFormatter,
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
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
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginSmall,
                                              ),
                                              ReactiveValueListenableBuilder<
                                                      int>(
                                                  formControlName: 'age',
                                                  builder:
                                                      (context, value, child) {
                                                    return Text(
                                                      '${int.tryParse(value.value.toString()) ?? 0}歳', // TODO: l10n 対応 (歳) (age)
                                                    );
                                                  }),
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
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      value: true,
                                                      formControlName: 'gender',
                                                      title: const Text('男性'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      value: false,
                                                      formControlName: 'gender',
                                                      title: const Text('女性'),
                                                    ),
                                                  )
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
                                        formControlName:
                                            'nameChineseKanjiVietnamese',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（中国語漢字/ベトナム語表記）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
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
                                        formControlName: 'nameKana',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（カナ）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
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
                                        formControlName: 'currentAddress',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '現住所',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
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
                                        formControlName: 'mobileNumberPatient',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '携帯番号（患者様）',
                                          ),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'mobileNumberDomestic',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '携帯番号（国内可）',
                                          ),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
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
                                  formControlName: 'diseaseName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '病名',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'tissueType',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '組織型', // TODO: l10n 対応 (組織型) (tissueType)
                                    ),
                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '特記事項',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'diseaseNotices',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'diseaseNotices',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                  formControlName:
                                      'diagnosticMedicalInstitutionName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '診断医療機関名', // TODO: l10n 対応 (診断医療機関名) (diagnosticMedicalInstitutionName)
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
                                  formControlName: 'pastIllnessFamilyHistory',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '既往症・家族歴',
                                    ),
                                  ),
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
                                  formControlName:
                                      'referralMedicalInstitutionEtc',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '紹介元医療機関など',
                                    ),
                                  ),
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
                                  formControlName:
                                      'diseaseCourseSndTestResultsEtc',
                                  minLines: 5,
                                  maxLines: 15,
                                  decoration: const InputDecoration(
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
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'symptoms',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '症状', // TODO: l10n 対応 (症状) (symptom)
                                    ),
                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '特記事項',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'notices',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'notices',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                          '転移',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'metastasis',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'metastasis',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                          '放射線治療有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'radiationTreatmentOrNot',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'radiationTreatmentOrNot',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                          '抗がん剤治療有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'presenceOfAnticancerDrugTreatment',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'presenceOfAnticancerDrugTreatment',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                          '生検の有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'biopsy',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'biopsy',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'patientsWishes',
                                  minLines: 1,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '患者の希望事項',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Text(
                            '代理者（コーディネーターなど）',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'agentName',
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffF0F3F5),
                                    label: Text(
                                      '名称',
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
                                  formControlName: 'personInChargeName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '担当者名',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'mobileNumber',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '電話番号',
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
                                  formControlName: 'patientsAddressStay',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '患者滞在先',
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
                                  formControlName: 'emergencyContact',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '緊急連絡先',
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
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
                                  formControlName: 'remarks',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '備考',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          const Text('添付書類'),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ValueListenableBuilder(
                              valueListenable: context
                                  .read<NormalSummaryModel>()
                                  .fileSummaryListData,
                              builder: (context, value, _) {
                                return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  alignment: WrapAlignment.start,
                                  spacing:
                                      context.appTheme.spacing.marginMedium,
                                  runSpacing:
                                      context.appTheme.spacing.marginMedium,
                                  children: [
                                    ...value.data?.map((e) => InkWell(
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName: e.pathFile ?? '');
                                              },
                                              child: Avatar.network(
                                                e.pathFile,
                                                placeholder: const AssetImage(
                                                  Images.logoMadical,
                                                  package: 'core_ui',
                                                ),
                                                shape: BoxShape.rectangle,
                                                customSize:
                                                    const Size(300, 250),
                                              ),
                                            )) ??
                                        [],
                                    InkWell(
                                      onTap: () {
                                        filePicker().then((value) {
                                          if (value != null) {
                                            showCreateWithFileDialog(
                                                context, value);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 300,
                                        height: 250,
                                        padding: EdgeInsets.all(
                                          context.appTheme.spacing
                                              .marginExtraLarge,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium,
                                          )),
                                          border: Border.all(
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.copy_all_rounded,
                                              size: 50,
                                              color:
                                                  context.appTheme.primaryColor,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                filePicker().then((value) {
                                                  if (value != null) {
                                                    showCreateWithFileDialog(
                                                        context, value);
                                                  }
                                                });
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
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  ValueListenableListener(
                    valueListenable:
                        context.read<NormalSummaryModel>().submitData,
                    onListen: () {
                      final value =
                          context.read<NormalSummaryModel>().submitData.value;

                      if (value.hasData) {
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
                    child: ReactiveFormConsumer(builder: (context, form, _) {
                      return ValueListenableBuilder(
                          valueListenable:
                              context.read<NormalSummaryModel>().submitData,
                          builder: (context, value, _) {
                            return ElevatedButton(
                              onPressed: value.loading || form.invalid
                                  ? null
                                  : () {
                                      context
                                          .read<NormalSummaryModel>()
                                          .submitSummary(formGroup);
                                    },
                              child: WithLoadingButton(
                                isLoading: value.loading,
                                child: const Text('保存'),
                              ),
                            );
                          });
                    }),
                  )
                ],
              ),
            ));
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<NormalSummaryModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => summaryFileForm(file: file)..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const PopupFileForm();
              },
            ),
          ),
        ),
      ),
    );
  }
}
