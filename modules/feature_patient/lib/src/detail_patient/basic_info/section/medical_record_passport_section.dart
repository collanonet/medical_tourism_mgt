// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../detail_patient_model.dart';
import '../basic_info_model.dart';

class MedicalRecordPassportSection extends StatefulWidget {
  const MedicalRecordPassportSection({super.key});

  @override
  State<MedicalRecordPassportSection> createState() =>
      _MedicalRecordPassportSectionState();
}

class _MedicalRecordPassportSectionState
    extends State<MedicalRecordPassportSection> {
  final formatter = InputFormatter();
  List visaType = ['medicalGuarantee', 'other'];

  String selectVisaType = 'medicalGuarantee';

  Row addRadioButton(int btnValue, String title, FormGroup formGroup) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: visaType[btnValue],
          groupValue: selectVisaType,
          onChanged: (value) {
            setState(() {
              formGroup.control('visaType').value = value;
              selectVisaType = value;
            });
          },
        ),
        Text(title == 'medicalGuarantee' ? '医療ビザ（身元保証書依頼）' : 'その他')
      ],
    );
  }

  List underConfirmation = [true, false];

  bool selectUnderConfirmation = false;

  Row addRadioUnderConfirmationButton(int btnValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        selectUnderConfirmation
            ? Icon(
                Icons.radio_button_checked_rounded,
                color: context.appTheme.primaryColor,
              )
            : const Icon(Icons.radio_button_off_rounded),
        const Text(
          '確認中', // TODO: l10n 対応 (確認中) (underConfirmation)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_PASSPORTS') as FormGroup;

    return ValueListenableListener(
      valueListenable: context.read<BasicInformationModel>().patientPassport,
      onListen: () {
        final value =
            context.read<BasicInformationModel>().patientPassport.value;

        if (value.hasData) {
          context.read<DetailPatientModel>().getPatientPassports();
        }
      },
      child: ValueListenableBuilder(
          valueListenable:
              context.read<BasicInformationModel>().patientPassport,
          builder: (context, value, _) {
            return Skeletonizer(
              enabled: value.loading,
              child: ReactiveForm(
                formGroup: formGroup,
                child: ColumnSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    const Text(
                      'パスポート',
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
                            formControlName: 'passportNumber',
                            decoration: const InputDecoration(
                              label: Text(
                                '旅券番号', //   TODO: l10n 対応 (旅券番号) (passportNumber)
                              ),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9]'),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: ReactiveDatePickerField(
                            formControlName: 'issueDate',
                            label: '発行日',
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: const [
                        Expanded(
                          child: ReactiveDatePickerField(
                            formControlName: 'expirationDate',
                            label: '有効期限',
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(child: SizedBox()),
                      ],
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ビザ', //  TODO: l10n 対応 (ビザ) (visa)
                              ),
                              Row(
                                children: <Widget>[
                                  IntrinsicWidth(
                                    stepWidth: 50,
                                    child: ReactiveRadioListTile<String?>(
                                      value: 'medicalGuarantee',
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'visaType',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text('医療ビザ（身元保証書依頼）'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 50,
                                    child: ReactiveRadioListTile<String?>(
                                      value: 'other',
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'visaType',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text('その他'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ビザ種類'),
                              ReactiveDropdownFormField(
                                formControlName: 'visaCategory',
                                decoration: InputDecoration(
                                  hintText: 'ビザ種類',
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
                                    value: 'intra_company_transferee_visa',
                                    child: Text('企業内転勤者ビザ'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'technical_intern_training_program',
                                    child: Text('技能実習制度'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'special_permanent_resident_visa',
                                    child: Text('特別永住者ビザ'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'other',
                                    child: Text('その他'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     const SizedBox(height: 20),
                        //     IntrinsicWidth(
                        //       stepWidth: 50,
                        //       child: ReactiveRadioListTile<bool?>(
                        //         value: false,
                        //         contentPadding: EdgeInsets.zero,
                        //         formControlName: 'underConfirmation',
                        //         controlAffinity:
                        //             ListTileControlAffinity.leading,
                        //         title: const Text('確認中'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
