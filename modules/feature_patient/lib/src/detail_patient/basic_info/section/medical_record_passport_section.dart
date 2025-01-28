// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
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

    return ValueListenableBuilder(
        valueListenable: context.read<BasicInformationModel>().patientPassport,
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
                                // addRadioButton(
                                //     0, 'medicalGuarantee', formGroup),
                                // addRadioButton(1, 'other', formGroup),
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
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ビザ種類'),
                            ReactiveTextField(
                              formControlName: 'visaCategory',
                              decoration: const InputDecoration(
                                hintText: 'ビザ種類',
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         formGroup.control('underConfirmation').value =
                      //             !selectUnderConfirmation;
                      //         selectUnderConfirmation =
                      //             !selectUnderConfirmation;
                      //       });
                      //     },
                      //     child: addRadioUnderConfirmationButton(
                      //         selectUnderConfirmation ? 0 : 1),
                      //   ),
                      // )
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          IntrinsicWidth(
                            stepWidth: 50,
                            child: ReactiveRadioListTile<bool?>(
                              value: false,
                              contentPadding: EdgeInsets.zero,
                              formControlName: 'underConfirmation',
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text('確認中'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
