import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'patient_response_other_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientResponseOtherScreen extends StatefulWidget {
  const PatientResponseOtherScreen({super.key});

  @override
  State<PatientResponseOtherScreen> createState() =>
      _PatientResponseOtherScreenState();
}

class _PatientResponseOtherScreenState
    extends State<PatientResponseOtherScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable: context.read<PatientResponseOtherModel>().other,
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
                            Text(
                              '本人',
                              style: context.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '有効なビザをもっていますか？',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName: 'doYouHaveAValidVisa',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? 'はい'
                                            : 'いいえ',
                                        values: const ['いいえ', 'はい'],
                                        iconList: const [
                                          Text('いいえ'),
                                          Text('はい'),
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
                                          control.value = i == 'はい';
                                        },
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              'どんなビザを取得予定ですか',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            IntrinsicWidth(
                              child: ReactiveDropdownFormField(
                                formControlName: 'visa',
                                decoration: const InputDecoration(
                                  label: Text(
                                    'ビザ',
                                  ),
                                ),
                                items: [
                                  '医療ビザ',
                                  '短期滞在ビザ ',
                                  '観光ビザ',
                                  '親族訪問ビザ',
                                  '商用ビザ',
                                  '留学ビザ',
                                  '就業ビザ',
                                  '技術者・人文知識・国際業務ビザ',
                                  '配偶者ビザ',
                                  '定住者ビザ',
                                  '特定技能ビザ',
                                  '文化活動ビザ',
                                  '宗教ビザ',
                                  '人道上の理由による在留資格',
                                  '特例ビザ',
                                  '企業内転勤者ビザ ',
                                  '技能実習制度',
                                  '特別永住者ビザ',
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                formControlName:
                                    'requestingAPersonalGuaranteeForObtainingAMedicalVisa',
                                title: Text(
                                  '医療ビザ取得のための身元保証書を希望する',
                                  style: context.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              '診療データ　その他の方法で提出',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            IntrinsicWidth(
                              stepWidth: 300,
                              child: ReactiveTextField(
                                formControlName: 'remarks',
                                decoration: const InputDecoration(
                                  hintText: '備考',
                                ),
                              ),
                            ),
                            const Divider(),
                            Text(
                              '同行者',
                              style: context.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            const Text(
                              '有効なビザをもっていますか？',
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                ReactiveValueListenableBuilder(
                                    formControlName:
                                        'companionDoYouHaveAValidVisa',
                                    builder: (context, control, _) {
                                      return AnimatedToggleSwitch<String>.size(
                                        textDirection: TextDirection.rtl,
                                        current: control.value == true
                                            ? 'はい'
                                            : 'いいえ',
                                        values: const ['いいえ', 'はい'],
                                        iconList: const [
                                          Text('いいえ'),
                                          Text('はい'),
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
                                          control.value = i == 'はい';
                                        },
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text(
                              'どんなビザを取得予定ですか',
                              style: context.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            IntrinsicWidth(
                              child: ReactiveDropdownFormField(
                                formControlName: 'companionVisa',
                                decoration: const InputDecoration(
                                  label: Text(
                                    'ビザ',
                                  ),
                                ),
                                items: [
                                  '医療ビザ',
                                  '短期滞在ビザ ',
                                  '観光ビザ',
                                  '親族訪問ビザ',
                                  '商用ビザ',
                                  '留学ビザ',
                                  '就業ビザ',
                                  '技術者・人文知識・国際業務ビザ',
                                  '配偶者ビザ',
                                  '定住者ビザ',
                                  '特定技能ビザ',
                                  '文化活動ビザ',
                                  '宗教ビザ',
                                  '人道上の理由による在留資格',
                                  '特例ビザ',
                                  '企業内転勤者ビザ ',
                                  '技能実習制度',
                                  '特別永住者ビザ',
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveCheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName:
                                        'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa',
                                    title: Text(
                                      '医療ビザ取得のための身元保証書を希望する',
                                      style: context.textTheme.titleMedium,
                                    ),
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
                    valueListenable:
                        context.read<PatientResponseOtherModel>().createOther,
                    onListen: () {
                      final value = context
                          .read<PatientResponseOtherModel>()
                          .createOther
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
                            .read<PatientResponseOtherModel>()
                            .createMedicalRecordPatientResponseOther(formGroup);
                      },
                      child: const Text('保存する'),
                    ),
                  ),
                ],
              ),
            ));
  }
}
