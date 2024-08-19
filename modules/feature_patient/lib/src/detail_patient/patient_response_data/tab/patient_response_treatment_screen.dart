import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'patient_response_treatment_model.dart';

class PatientResponseTreatmentScreen extends StatefulWidget {
  const PatientResponseTreatmentScreen({super.key});

  @override
  State<PatientResponseTreatmentScreen> createState() =>
      _PatientResponseTreatmentScreenState();
}

class _PatientResponseTreatmentScreenState
    extends State<PatientResponseTreatmentScreen> {

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('drugDetails') as FormArray;

    return ValueListenableBuilder(
        valueListenable: context
            .read<PatientResponseTreatmentModel>()
            .medicalRecordPatientResponseTreatment,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Scrollbar(
                      trackVisibility: true,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        primary: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('委託目的', style: context.textTheme.titleMedium),
                            SizedBox(
                                height: context.appTheme.spacing.marginMedium),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'treatment',
                                  title: Text('治療'),
                                )),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'treatmentInJapan',
                                        title: Text('来日治療'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'secondOpinion',
                                        title: Text('セカンドオピニオン'),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                formControlName: 'detailedExamination',
                                title: Text('精密検査'),
                              ),
                            ),
                            Divider(),
                            IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                formControlName: 'medicalCheckup',
                                title: Text('健診'),
                              ),
                            ),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'regenerativeMedicine',
                                  title: Text('再生医療'),
                                )),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'stemCellTherapy',
                                        title: Text('幹細胞療法'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'immuneCellTherapy',
                                        title: Text('免疫細胞療法'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'regenerativeOthers',
                                        title: Text('その他'),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'bloodPurificationTherapy',
                                  title: Text('血液浄化療法(アフェレーシス)・透析'),
                                )),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'riskInspection',
                                  title: Text('リスク検査'),
                                )),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveCheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'beauty',
                                    title: Text('美容'),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveCheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'others',
                                    title: Text('その他'),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                IntrinsicWidth(
                                  stepWidth: 250,
                                  child: ReactiveTextField(
                                    formControlName: 'othersRemark',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('母国の医療機関の病状資料（入退院記録等）'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName:
                                            'medicalInformationFromHomeCountry',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? 'あり'
                                                : 'なし',
                                            values: const ['あり', 'なし'],
                                            iconList: [
                                              Text('あり'),
                                              Text('なし'),
                                            ],
                                            indicatorSize:
                                                const Size.fromWidth(100),
                                            borderWidth: 4.0,
                                            iconAnimationType:
                                                AnimationType.onHover,
                                            style: ToggleStyle(
                                              borderColor: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1.5),
                                                ),
                                              ],
                                            ),
                                            styleBuilder: (i) => ToggleStyle(
                                              indicatorColor:
                                                  context.appTheme.primaryColor,
                                              backgroundColor: Colors.white,
                                            ),
                                            onChanged: (i) => setState(() {
                                              control.value = i == 'あり';
                                            }),
                                          );
                                        })
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraLarge,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('提供可能なDICOM画像データ'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName: 'dicomImageData',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? 'あり'
                                                : 'なし',
                                            values: const ['あり', 'なし'],
                                            iconList: [
                                              Text('あり'),
                                              Text('なし'),
                                            ],
                                            indicatorSize:
                                                const Size.fromWidth(100),
                                            borderWidth: 4.0,
                                            iconAnimationType:
                                                AnimationType.onHover,
                                            style: ToggleStyle(
                                              borderColor: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1.5),
                                                ),
                                              ],
                                            ),
                                            styleBuilder: (i) => ToggleStyle(
                                              indicatorColor:
                                                  context.appTheme.primaryColor,
                                              backgroundColor: Colors.white,
                                            ),
                                            onChanged: (i) => setState(() {
                                              control.value = i == 'あり';
                                            }),
                                          );
                                        })
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraLarge,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('その他検査データ（血液検査等）'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName: 'otherTestData',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? 'あり'
                                                : 'なし',
                                            values: const ['あり', 'なし'],
                                            iconList: [
                                              Text('あり'),
                                              Text('なし'),
                                            ],
                                            indicatorSize:
                                                const Size.fromWidth(100),
                                            borderWidth: 4.0,
                                            iconAnimationType:
                                                AnimationType.onHover,
                                            style: ToggleStyle(
                                              borderColor: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1.5),
                                                ),
                                              ],
                                            ),
                                            styleBuilder: (i) => ToggleStyle(
                                              indicatorColor:
                                                  context.appTheme.primaryColor,
                                              backgroundColor: Colors.white,
                                            ),
                                            onChanged: (i) => setState(() {
                                              control.value = i == 'あり';
                                            }),
                                          );
                                        })
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'detail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('母国の医療機関での診断名'),
                            ReactiveTextField(
                              formControlName: 'diagnosisAtHomeCountry',
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('病状説明'),
                            ReactiveTextField(
                              formControlName: 'medicalConditionExplanation',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('発症の経緯'),
                            ReactiveTextField(
                              formControlName: 'historyOfOnset',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('現在行っている治療'),
                            ReactiveTextField(
                              formControlName: 'currentTreatment',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '服薬中の薬名、有効成分含有量、服用方法、服用量など',
                              style: context.textTheme.titleLarge,
                            ),
                            ReactiveFormArray(
                              formArrayName: 'drugDetails',
                              builder: (context, formArray, child) {
                                final rows = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                      (currentForm) => ReactiveForm(
                                        formGroup: currentForm,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '薬名',
                                              style:
                                                  context.textTheme.bodySmall,
                                            ),
                                            IntrinsicWidth(
                                              stepWidth: 300,
                                              child: ReactiveTextField(
                                                formControlName: 'drugName',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                return ColumnSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  children: rows.toList(),
                                );
                              },
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            InkWell(
                              onTap: () {
                                formArray.add(
                                  FormGroup({
                                    'drugName': FormControl<String>(),
                                  }),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  SizedBox(
                                    width: context.appTheme.spacing.marginSmall,
                                  ),
                                  Text(
                                    '薬名を追加',
                                    style: TextStyle(
                                        color: context.appTheme.primaryColor),
                                  ) // TODO: l10n 対応 (病院を追加) (addHospital)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('既往歴', style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('今までの健康状態、病気及び治療内容',
                                style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'currentHealthStatus',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current:
                                            control.value == true ? 'あり' : 'なし',
                                        values: const ['あり', 'なし'],
                                        iconList: [
                                          Text('あり'),
                                          Text('なし'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'medicalHistoryDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('家族歴'),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'familyHistoryDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('薬物アレルギー',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('今までの健康状態、病気及び治療内容',
                                style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'currentDrugAllergyDetail',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current:
                                            control.value == true ? 'あり' : 'なし',
                                        values: const ['あり', 'なし'],
                                        iconList: [
                                          Text('あり'),
                                          Text('なし'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'drugAllergyDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('治療費について',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('予算（自国の通貨でご入力ください）'),
                            ReactiveTextField(
                              formControlName: 'treatmentCosts',
                              keyboardType: TextInputType.number,

                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                            ),
                            Text('希望医療機関',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('希望する医療機関はありますか',
                                style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName:
                                        'desiredMedicalInstitution',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current:
                                            control.value == true ? 'あり' : 'なし',
                                        values: const ['あり', 'なし'],
                                        iconList: [
                                          Text('あり'),
                                          Text('なし'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('希望するエリア・医療機関名'),
                            ReactiveTextField(
                              formControlName:
                                  'desiredAreaMedicalInstitutionName',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('理由'),
                            ReactiveTextField(
                              formControlName: 'reason',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text(
                              '受診希望日',
                              style: context.textTheme.bodySmall,
                            ),
                            ReactiveTextField(
                              formControlName: 'desiredDateOfConsultation',
                            ),
                            Text('日本滞在予定期間'),
                            ReactiveTextField(
                              formControlName: 'scheduledPeriodOfStayInJapan',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('現在の体調状況',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('歩行', style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'walking',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? '独立'
                                            : '要支援',
                                        values: const ['独立', '要支援'],
                                        iconList: [
                                          Text('独立'),
                                          Text('要支援'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'walkingDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('座り', style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'sitting',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? '独立'
                                            : '要支援',
                                        values: const ['独立', '要支援'],
                                        iconList: [
                                          Text('独立'),
                                          Text('要支援'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'sittingDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('食事', style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'meal',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? '独立'
                                            : '要支援',
                                        values: const ['独立', '要支援'],
                                        iconList: [
                                          Text('独立'),
                                          Text('要支援'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'mealDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            Text('排泄', style: context.textTheme.bodySmall),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'excretion',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? '独立'
                                            : '要支援',
                                        values: const ['独立', '要支援'],
                                        iconList: [
                                          Text('独立'),
                                          Text('要支援'),
                                        ],
                                        indicatorSize:
                                            const Size.fromWidth(100),
                                        borderWidth: 4.0,
                                        iconAnimationType:
                                            AnimationType.onHover,
                                        style: ToggleStyle(
                                          borderColor: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        styleBuilder: (i) => ToggleStyle(
                                          indicatorColor:
                                              context.appTheme.primaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                        onChanged: (i) => setState(() {
                                          control.value = i == 'あり';
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('詳細'),
                            ReactiveTextField(
                              formControlName: 'excretionDetail',
                              minLines: 3,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginExtraLarge,
                            ),
                            Text('女性の方のみご入力ください',
                                style: context.textTheme.titleLarge),
                            Text('妊娠について', style: context.textTheme.titleLarge),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'aboutPregnancy',
                                    value: '妊娠していない',
                                    title: Text('妊娠していない'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'aboutPregnancy',
                                    value: '妊娠している可能性がある',
                                    title: Text('妊娠している可能性がある'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'aboutPregnancy',
                                    value: '妊娠している',
                                    title: Text('妊娠している'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ValueListenableListener(
                    valueListenable: context
                        .read<PatientResponseTreatmentModel>()
                        .createMedicalRecordPatientResponseTreatment,
                    onListen: () {
                      final value = context
                          .read<PatientResponseTreatmentModel>()
                          .createMedicalRecordPatientResponseTreatment
                          .value;

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
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<PatientResponseTreatmentModel>()
                            .createUpdateMedicalRecordPatientResponseTreatment(
                                (ReactiveForm.of(context) as FormGroup));
                      },
                      child: Text('保存する'),
                    ),
                  )
                ],
              ),
            ));
  }
}
