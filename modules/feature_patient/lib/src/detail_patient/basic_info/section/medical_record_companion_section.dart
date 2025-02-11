// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_info_model.dart';

class MedicalRecordCompanionSection extends StatefulWidget {
  const MedicalRecordCompanionSection({super.key});

  @override
  State<MedicalRecordCompanionSection> createState() =>
      _MedicalRecordCompanionSectionState();
}

class _MedicalRecordCompanionSectionState
    extends State<MedicalRecordCompanionSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_Companion') as FormArray;

    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().medicalRecordCompanions,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                );
              },
              children: [
                ReactiveFormArray(
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
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: [
                                  Text(
                                    '同行者 ${formArray.controls.indexOf(currentForm) + 1}',
                                    style: const TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), // TODO: l10n 対応 (同行者) (companion)
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: ReactiveCheckboxListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            formControlName: 'leader',
                                            title: const Text('同行者のリーダーとする')),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'remarks',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '備考', //    TODO: l10n 対応 (備考) (remarks
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '氏名（ローマ字）',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'familyNameRomanized',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'middleNameRomanized',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'firstNameRomanized',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '氏名（中国語漢字/ベトナム語表記）',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'familyNameChineseOrVietnamese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'middleNameChineseOrVietnamese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'firstNameChineseOrVietnamese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '氏名（日本語漢字）※中国人のみ',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'familyNameJapaneseForChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'middleNameJapaneseForChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'firstNameJapaneseForChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '氏名（カナ）',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'familyNameJapaneseForNonChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'middleNameJapaneseForNonChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'firstNameJapaneseForNonChinese',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
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
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'nationality',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '国籍', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: ReactiveDropdownFormField(
                                          formControlName: 'relationship',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '本人との関係', //
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
                                      Expanded(
                                        child: SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: ReactiveDatePickerField(
                                          formControlName: 'dateOfBirth',
                                          label: '生年月日',
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  '年齢', // TODO: l10n 対応 (年齢) (age)
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginSmall,
                                                ),
                                                ReactiveValueListenableBuilder<
                                                        DateTime>(
                                                    formControlName:
                                                        'dateOfBirth',
                                                    builder: (context, value,
                                                        child) {
                                                      var age = 0;
                                                      if (value.value != null) {
                                                        age = DateTime.now()
                                                                .year -
                                                            value.value!.year;
                                                        currentForm
                                                                .control('age')
                                                                .value =
                                                            DateTime.now()
                                                                    .year -
                                                                value.value!
                                                                    .year;
                                                      }
                                                      return Text(
                                                        '$age 歳', // TODO: l10n 対応 (歳) (age)
                                                      );
                                                    }),
                                              ],
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  '性別', //
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: 100,
                                                      child:
                                                          ReactiveCheckboxListTile(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        formControlName:
                                                            'isMale',
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        onChanged: (value) {
                                                          currentForm
                                                              .control('gender')
                                                              .value = value
                                                                  .value ==
                                                              true;
                                                          currentForm
                                                              .control(
                                                                  'isFemale')
                                                              .value = value
                                                                  .value ==
                                                              false;
                                                        },
                                                        title: const Text('男性'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child:
                                                          ReactiveCheckboxListTile(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        formControlName:
                                                            'isFemale',
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        onChanged: (value) {
                                                          currentForm
                                                              .control('gender')
                                                              .value = value
                                                                  .value ==
                                                              false;
                                                          currentForm
                                                              .control('isMale')
                                                              .value = value
                                                                  .value ==
                                                              false;
                                                        },
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
                                  const Text('連絡先'),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'mobileNumber',
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            prefixText: '+',
                                            label: Text(
                                              '携帯番号',
                                            ),
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'email',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'Email',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ReactiveFormArray(
                                    formArrayName: 'chatToolLink',
                                    builder: (context, formArray, child) {
                                      final rows = formArray.controls
                                          .map(
                                              (control) => control as FormGroup)
                                          .map(
                                            (currentForm) => ReactiveForm(
                                              formGroup: currentForm,
                                              child: RowSeparated(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium,
                                                  );
                                                },
                                                children: [
                                                  Expanded(
                                                    child: ReactiveTextField(
                                                      formControlName:
                                                          'chatToolLink',
                                                      keyboardType:
                                                          TextInputType.url,
                                                      decoration:
                                                          const InputDecoration(
                                                        label: Text(
                                                          'チャットツールリンク',
                                                        ),
                                                      ),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                                RegExp(r'\s')),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );

                                      return ColumnSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        children: rows.toList(),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      (currentForm.control('chatToolLink')
                                              as FormArray)
                                          .add(
                                        FormGroup({
                                          'chatToolLink': FormControl<String>(),
                                        }),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle,
                                          color: context.appTheme.primaryColor,
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginSmall,
                                        ),
                                        Text(
                                          'チャットツールリンクを追加',
                                          style: TextStyle(
                                              fontFamily: 'NotoSansJP',
                                              package: 'core_ui',
                                              color: context
                                                  .appTheme.primaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 250,
                                        padding: EdgeInsets.all(context
                                            .appTheme.spacing.marginMedium),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: context
                                                  .appTheme.primaryColor),
                                          borderRadius: BorderRadius.circular(
                                              context.appTheme.spacing
                                                  .borderRadiusMedium),
                                        ),
                                        child: Image.asset(
                                          Images.sampleQr,
                                          package: 'core_ui',
                                        ),
                                      ),
                                      qRChatCompanion(currentForm, context),
                                    ],
                                  ),
                                  const Text('パスポート',
                                      // TODO: l10n 対応 (パスポート) (passport)
                                      style: TextStyle(
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'passportNumber',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '旅券番号', //   TODO: l10n 対応 (旅券番号) (passportNumber)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: ReactiveDatePickerField(
                                          formControlName: 'issueDate',
                                          label: '発行日',
                                        ),
                                      ),
                                      const Expanded(
                                        child: ReactiveDatePickerField(
                                          formControlName: 'expirationDate',
                                          label: '有効期限',
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
                                              value: 'medicalVisa',
                                              child: Text('医療ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'short_term_stay_visa',
                                              child: Text('短期滞在ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'touristVisa',
                                              child: Text('観光ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'familyVisitingVisa',
                                              child: Text('親族訪問ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'businessVisa',
                                              child: Text('商用ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'studentVisa',
                                              child: Text('留学ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'workingVisa',
                                              child: Text('就業ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value:
                                                  'engineer_specialist_humanities_international_business_visa',
                                              child: Text('技術者・人文知識・国際業務ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'spouseVisa',
                                              child: Text('配偶者ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'long_term_resident_visa',
                                              child: Text('定住者ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'specifiedSkills',
                                              child: Text('特定技能ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'culturalActivities',
                                              child: Text('文化活動ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'religiousVisa',
                                              child: Text('宗教ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value:
                                                  'status_of_residence_for_humanitarian_reasons',
                                              child: Text('人道上の理由による在留資格'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'specialVisa',
                                              child: Text('特例ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value:
                                                  'intra_company_transferee_visa',
                                              child: Text('企業内転勤者ビザ'),
                                            ),
                                            DropdownMenuItem(
                                              value:
                                                  'technical_intern_training_program',
                                              child: Text('技能実習制度'),
                                            ),
                                            DropdownMenuItem(
                                              value:
                                                  'special_permanent_resident_visa',
                                              child: Text('特別永住者ビザ'),
                                            ),
                                            // DropdownMenuItem(
                                            //   value: 'medicalGuarantee',
                                            //   child: Text('ビザ'),
                                            // ),
                                            // DropdownMenuItem(
                                            //   value: 'other',
                                            //   child: Text('その他（ビザの種類）'),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
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
                InkWell(
                  onTap: () => formArray.add(
                    FormGroup({
                      '_id': FormControl<String?>(),
                      'leader': FormControl<bool>(),
                      'remarks': FormControl<String?>(),
                      'familyNameRomanized': FormControl<String?>(),
                      'middleNameRomanized': FormControl<String?>(),
                      'firstNameRomanized': FormControl<String?>(),
                      'familyNameChineseOrVietnamese': FormControl<String?>(),
                      'middleNameChineseOrVietnamese': FormControl<String?>(),
                      'firstNameChineseOrVietnamese': FormControl<String?>(),
                      'familyNameJapaneseForChinese': FormControl<String?>(),
                      'middleNameJapaneseForChinese': FormControl<String?>(),
                      'firstNameJapaneseForChinese': FormControl<String?>(),
                      'familyNameJapaneseForNonChinese': FormControl<String?>(),
                      'middleNameJapaneseForNonChinese': FormControl<String?>(),
                      'firstNameJapaneseForNonChinese': FormControl<String?>(),
                      'nationality': FormControl<String?>(),
                      'relationship': FormControl<String>(),
                      'dateOfBirth': FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                      'age': FormControl<int?>(),
                      'gender': FormControl<bool>(
                        value: true,
                      ), // 性別
                      'isMale': FormControl<bool>(
                        value: true,
                      ), // 男性
                      'isFemale': FormControl<bool>(), // 女
                      'mobileNumber': FormControl<String?>(),
                      'email': FormControl<String?>(
                        validators: [
                          Validators.email,
                        ],
                      ),
                      'chatToolLink': FormArray([
                        FormGroup({
                          'chatToolLink': FormControl<String>(),
                        })
                      ]),
                      'chatQrImage': FormControl<FileSelect>(),
                      'passportNumber': FormControl<String?>(),
                      'issueDate': FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                      'expirationDate': FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                      'visaType': FormControl<String>(),
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
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget qRChatCompanion(FormGroup currentForm, BuildContext context) {
    final file = currentForm.control('chatQrImage').value as FileSelect?;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            imagePicker().then((value) {
              currentForm.control('chatQrImage').value = value;
            });
          },
          child: Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            decoration: BoxDecoration(
              border: Border.all(color: context.appTheme.primaryColor),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            child: file != null && file.file != null
                ? Image.memory(
                    file.file!,
                    fit: BoxFit.fill,
                  )
                : file != null && file.url != null
                    ? Avatar.network(
                        file.url,
                        placeholder: const AssetImage(
                          Images.logoMadical,
                          package: 'core_ui',
                        ),
                        shape: BoxShape.rectangle,
                        customSize: const Size(250, 250),
                      )
                    : ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          );
                        },
                        children: [
                          const Icon(Icons.copy_all_rounded),
                          const Text('QRコードをここにドラッグ＆ドロップ'),
                          ElevatedButton(
                              onPressed: () {
                                imagePicker().then((value) {
                                  currentForm.control('chatQrImage').value =
                                      value;
                                });
                              },
                              child: const Text('またはファイルを選択する'))
                        ],
                      ),
          ),
        ),
        if (file != null)
          IconButton(
            onPressed: () {
              currentForm.control('chatQrImage').value = null;
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
      ],
    );
  }
}

int getCurrentFormIndex(FormArray formArray, FormGroup currentForm) {
  for (int i = 0; i < formArray.controls.length; i++) {
    if (formArray.controls[i] == currentForm) {
      return i;
    }
  }
  return -1; // Return -1 if the form is not found
}
