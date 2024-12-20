// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'patient_response_medical_checkup_model.dart';

class PatientResponseMedicalCheckupScreen extends StatefulWidget {
  const PatientResponseMedicalCheckupScreen({super.key});

  @override
  State<PatientResponseMedicalCheckupScreen> createState() =>
      _PatientResponseMedicalCheckupScreenState();
}

class _PatientResponseMedicalCheckupScreenState
    extends State<PatientResponseMedicalCheckupScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.read<PatientResponseMedicalCheckupModel>().medicalCheckup,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '健診希望日',
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                boxRequired(label: '必須', enabled: true),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   '第１希望',
                            //   style: context.textTheme.bodyMedium,
                            // ),
                            const SizedBox(
                              height: 8,
                            ),
                            const IntrinsicWidth(
                              stepWidth: 250,
                              child: ReactiveDatePickerField(
                                formControlName: 'date1',
                                label: '第１希望',
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   '第 2 希望',
                            //   style: context.textTheme.bodyMedium,
                            // ),
                            const SizedBox(
                              height: 8,
                            ),
                            const IntrinsicWidth(
                              stepWidth: 250,
                              child: ReactiveDatePickerField(
                                formControlName: 'date2',
                                label: '第 2 希望',
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   '第 3 希望',
                            //   style: context.textTheme.bodyMedium,
                            // ),
                            const SizedBox(height: 8),
                            const IntrinsicWidth(
                              stepWidth: 250,
                              child: ReactiveDatePickerField(
                                formControlName: 'date3',
                                label: '第 3 希望',
                              ),
                            ),
                            const SizedBox(height: 8),
                            IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                formControlName: 'desiredDate',
                                onChanged: (control) {},
                                title: const Text('希望日なし'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '備考',
                              style: context.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            ReactiveTextField(
                              maxLines: 3,
                              formControlName: 'remarks',
                            ),
                            const Divider(),
                            Text(
                              'その他の健診希望者',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: context.appTheme.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {
                                          formGroup
                                              .control(
                                                  'numberOfPeopleRequestingMedicalCheckup')
                                              .value = (formGroup
                                                  .control(
                                                      'numberOfPeopleRequestingMedicalCheckup')
                                                  .value as int) +
                                              1;
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ))),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                IntrinsicWidth(
                                  stepWidth: 250,
                                  child: ReactiveTextField(
                                    formControlName:
                                        'numberOfPeopleRequestingMedicalCheckup',
                                    decoration: const InputDecoration(
                                      label: Text('健診希望人数'),
                                    ),
                                    keyboardType: TextInputType.number,
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
                                    decoration: BoxDecoration(
                                        color: context.appTheme.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {
                                          if ((formGroup
                                                  .control(
                                                      'numberOfPeopleRequestingMedicalCheckup')
                                                  .value as int) >
                                              0) {
                                            formGroup
                                                .control(
                                                    'numberOfPeopleRequestingMedicalCheckup')
                                                .value = (formGroup
                                                    .control(
                                                        'numberOfPeopleRequestingMedicalCheckup')
                                                    .value as int) -
                                                1;
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 100,
                                  child: ReactiveTextField(
                                    formControlName: 'age',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    decoration: const InputDecoration(
                                      label: Text('年齢'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                Text(
                                  '歳',
                                  style: context.textTheme.bodyMedium,
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '性別',
                              style: context.textTheme.bodyMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'sex',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? '男性' : '女性',
                                    values: const ['女性', '男性'],
                                    iconList: const [
                                      Text('女性'),
                                      Text('男性'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                      control.value = i == '男性';
                                    }),
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            IntrinsicWidth(
                              stepWidth: 350,
                              child: ReactiveTextField(
                                formControlName: 'relationshipBetweenPerson',
                                decoration: const InputDecoration(
                                  label: Text('本人との関係'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const Divider(),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('希望医療機関',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('希望する医療機関はありますか',
                                style: context.textTheme.titleMedium),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName:
                                    'isThereMedicalInstitutionToAttend',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName:
                                        'desiredAreaOrMedicalInstitutionName',
                                    maxLines: 3,
                                    minLines: 2,
                                    decoration: const InputDecoration(
                                      label: Text('希望するエリア・医療機関名'),
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
                                    formControlName: 'reason',
                                    maxLines: 3,
                                    minLines: 2,
                                    decoration: const InputDecoration(
                                      label: Text('理由'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('希望するメニュー',
                                style: context.textTheme.titleMedium),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('PET-CT'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName: 'petCT',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? '希望する'
                                                : '希望しない',
                                            values: const ['希望しない', '希望する'],
                                            iconList: const [
                                              Text('希望しない'),
                                              Text('希望する'),
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
                                                const BoxShadow(
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
                                            onChanged: (i) {
                                              control.value = i == '希望する';
                                            },
                                          );
                                        }),
                                  ],
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('MRI'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName: 'mri',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? '希望する'
                                                : '希望しない',
                                            values: const ['希望しない', '希望する'],
                                            iconList: const [
                                              Text('希望しない'),
                                              Text('希望する'),
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
                                                const BoxShadow(
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
                                            onChanged: (i) {
                                              control.value = i == '希望する';
                                            },
                                          );
                                        }),
                                  ],
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('胃カメラ'),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ReactiveValueListenableBuilder(
                                        formControlName: 'gastroscope',
                                        builder: (context, control, _) {
                                          return AnimatedToggleSwitch<
                                              String>.size(
                                            textDirection: TextDirection.rtl,
                                            current: control.value == true
                                                ? '希望する'
                                                : '希望しない',
                                            values: const ['希望しない', '希望する'],
                                            iconList: const [
                                              Text('希望しない'),
                                              Text('希望する'),
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
                                                const BoxShadow(
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
                                            onChanged: (i) {
                                              control.value = i == '希望する';
                                            },
                                          );
                                        }),
                                  ],
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
                                    formControlName: 'freeInput',
                                    maxLines: 3,
                                    minLines: 2,
                                    decoration: const InputDecoration(
                                      label: Text('自由入力'),
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
                                    formControlName: 'currentConcerns',
                                    maxLines: 3,
                                    minLines: 2,
                                    decoration: const InputDecoration(
                                      label: Text('現在気になっていること'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            SizedBox(
                              width: 300,
                              child: ReactiveTextField(
                                formControlName: 'brokerageCompanyOrIntroducer',
                                decoration: const InputDecoration(
                                  label: Text('仲介会社・紹介者'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('がんについて',
                                style: context.textTheme.titleMedium),
                            const Text('がんの既往歴'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'historyOfCancer',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            SizedBox(
                              width: 300,
                              child: ReactiveTextField(
                                formControlName: 'cancerSite',
                                decoration: const InputDecoration(
                                  label: Text('がんの部位'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('糖尿病について',
                                style: context.textTheme.titleMedium),
                            const Text('現在糖尿病'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'currentlyDiabetes',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const Text('糖尿病服薬'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'diabetesMedication',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const Text('空腹時血糖'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'fastingBloodSugarMgPerDl',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                Text(
                                  'mg/dL',
                                  style: context.textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: ReactiveTextField(
                                    formControlName:
                                        'fastingBloodSugarMmolPerL',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                Text(
                                  'mmol/L',
                                  style: context.textTheme.bodyMedium,
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              'インプラント',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'implant',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const Text('インプラントをした時期'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'implantYear',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                Text(
                                  '年',
                                  style: context.textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'implantMonth',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                Text(
                                  '月頃',
                                  style: context.textTheme.bodyMedium,
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '体内金属/刺青（tatooo）',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'bodyMetalOrTattoo',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '体内金属後に/刺青後にMRI受診したことが',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'hadMriAfterMetalOrTattoo',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            SizedBox(
                              width: 300,
                              child: ReactiveTextField(
                                formControlName: 'partAndItsMaterial',
                                decoration: const InputDecoration(
                                  hintText: '部位とその材質',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '閉所恐怖症',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            ReactiveValueListenableBuilder(
                                formControlName: 'claustrophobia',
                                builder: (context, control, _) {
                                  return AnimatedToggleSwitch<String>.size(
                                    textDirection: TextDirection.rtl,
                                    current:
                                        control.value == true ? 'あり' : 'なし',
                                    values: const ['なし', 'あり'],
                                    iconList: const [
                                      Text('なし'),
                                      Text('あり'),
                                    ],
                                    indicatorSize: const Size.fromWidth(100),
                                    borderWidth: 4.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        const BoxShadow(
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
                                    onChanged: (i) {
                                      control.value = i == 'あり';
                                    },
                                  );
                                }),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ValueListenableListener(
                    valueListenable: context
                        .read<PatientResponseMedicalCheckupModel>()
                        .createMedicalCheckup,
                    onListen: () {
                      final value = context
                          .read<PatientResponseMedicalCheckupModel>()
                          .createMedicalCheckup
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
                            .read<PatientResponseMedicalCheckupModel>()
                            .postMedicalRecordPatientResponseMedicalCheckup(
                                formGroup);
                      },
                      child: const Text('保存する'),
                    ),
                  ),
                ],
              ),
            ));
  }
}
