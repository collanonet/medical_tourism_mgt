import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'basic_info_form.dart';
import 'basic_info_model.dart';

class MedicalRecordInput extends StatefulWidget {
  const MedicalRecordInput({super.key});

  @override
  State<MedicalRecordInput> createState() => _MedicalRecordInputState();
}

class _MedicalRecordInputState extends State<MedicalRecordInput> {
  List gender = ["male", "female"];

  String selectGender = "male";

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
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicInformationModel>(
      builder: (context, model, child) {
        return Skeletonizer(
          enabled: model.medicalRecord.loading,
          child: ReactiveFormConfig(
            validationMessages: {
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () => basicInfoForm(
                medicalRecord: model.medicalRecord.data,
                medicalRecordHospital: model.medicalRecordHospitals.data?.first,
                patientId: model.patient.id,
              ),
              builder: (context, formGroup, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('メモ'), // TODO: l10n 対応 (memo)
                    ReactiveTextFormField(
                      formControlName: 'memo',
                      maxLines: 3,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                        color: Color(0xffF8F8D9),
                      ),
                      padding:
                          EdgeInsets.all(context.appTheme.spacing.marginMedium),
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          );
                        },
                        children: [
                          Text('本人'), // TODO: l10n 対応 (本人)  (patient)
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
                                    return ReactiveTextFormField<DateTime>(
                                      formControlName: 'dateOfBirth',
                                      readOnly: true,
                                      onTap: (value) => picker.showPicker(),
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '生年月日', // TODO: l10n 対応 (生年月日) (dateOfBirth)
                                        ),
                                        suffixIcon: const Icon(
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
                                flex: 2,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '年齢', // TODO: l10n 対応 (年齢) (age)
                                        ),
                                        Text(
                                          '${int.tryParse(formGroup.control('age').value) ?? 0}歳', // TODO: l10n 対応 (歳) (age)
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '性別', //
                                        ),
                                        Row(
                                          children: <Widget>[
                                            addRadioButton(
                                                0, 'Male', formGroup),
                                            addRadioButton(
                                                1, 'Female', formGroup),
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
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'arrivalDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField<DateTime>(
                                      formControlName: 'arrivalDate',
                                      readOnly: true,
                                      onTap: (value) => picker.showPicker(),
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '来日日', // TODO: l10n 対応 (来日日) (arrivalDate)
                                        ),
                                        suffixIcon: const Icon(
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
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'examinationDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField<DateTime>(
                                      formControlName: 'examinationDate',
                                      readOnly: true,
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      onTap: (value) => picker.showPicker(),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '受診日', // TODO: l10n 対応 (受診日) (examinationDate)
                                        ),
                                        suffixIcon: const Icon(
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
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'departureDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'departureDate',
                                      readOnly: true,
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      onTap: (value) => picker.showPicker(),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '帰国日', // TODO: l10n 対応 (帰国日) (departureDate)
                                        ),
                                        suffixIcon: const Icon(
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
                              Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'caseNumber',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '案件番号', // TODO: l10n 対応 (案件番号) (caseNumber)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'receptionDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField<DateTime>(
                                      formControlName: 'receptionDate',
                                      readOnly: true,
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      onTap: (value) => picker.showPicker(),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '受付日', // TODO: l10n 対応 (受付日) (receptionDate)
                                        ),
                                        suffixIcon: const Icon(
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
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'type',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '種別', //  TODO: l10n 対応 (種別) (type)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'progress',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '進捗', //  TODO: l10n 対応 (進捗) (progress)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'advancePaymentDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField<DateTime>(
                                      formControlName: 'advancePaymentDate',
                                      readOnly: true,
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('dd MMM yyyy'),
                                      ),
                                      onTap: (value) => picker.showPicker(),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '前金受取日', //  TODO: l10n 対応 (前金受取日) (advancePaymentDate)
                                        ),
                                        suffixIcon: const Icon(
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
                                child: ReactiveDropdownFormField(
                                  formControlName: 'paymentMethod',
                                  decoration: InputDecoration(
                                      label: Text(
                                    '受取方法', //  TODO: l10n 対応 (受取方法) (receptionMethod)
                                  )),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'WeChat',
                                      child: const Text('WeChat'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Visa Card',
                                      child: const Text('Visa Card'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    model.medicalRecord.data != null
                                        ? const SizedBox()
                                        : ReactiveFormConsumer(
                                            builder: (context, form, _) {
                                            return ElevatedButton(
                                              onPressed: form.valid
                                                  ? () {
                                                      model
                                                          .createUpdateMedicalRecords(
                                                              form);
                                                    }
                                                  : null,
                                              child: Text(
                                                '保存する', // TODO: l10n 対応 (保存する) (save)
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Skeletonizer(
                            enabled: model.medicalRecordHospitals.loading,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('病院'), // TODO: l10n 対応 (病院) (hospital)
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                // model.medicalRecordHospitals.data == null ||
                                //         model.medicalRecordHospitals.data!
                                //             .isEmpty
                                //     ?
                                Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextFormField(
                                              formControlName: 'hospitalName',
                                              decoration: InputDecoration(
                                                  label: Text(
                                                    '病院名', //   TODO: l10n 対応 (病院名) (hospitalName)
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: ReactiveTextFormField(
                                              formControlName:
                                                  'medicalCardNumber',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '診察券番号', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // ReactiveFormConsumer(builder:
                                                //     (context, form, _) {
                                                //   return ElevatedButton(
                                                //     onPressed: form.valid
                                                //         ? () {
                                                //             model
                                                //                 .createUpdateMedicalRecordHospital(
                                                //                     formGroup:
                                                //                         form);
                                                //           }
                                                //         : null,
                                                //     child: Text(
                                                //       '保存する', // TODO: l10n 対応 (保存する) (save)
                                                //       style: TextStyle(
                                                //         color: Colors.white,
                                                //       ),
                                                //     ),
                                                //   );
                                                // }),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    // : ListView.builder(
                                    //     itemCount: model.medicalRecordHospitals
                                    //             .data?.length ??
                                    //         0,
                                    //     shrinkWrap: true,
                                    //     physics:
                                    //         const NeverScrollableScrollPhysics(),
                                    //     itemBuilder: (context, index) {
                                    //       return Row(
                                    //         children: [
                                    //           Expanded(
                                    //             child: ReactiveTextFormField(
                                    //               formControlName:
                                    //                   'hospitalName',
                                    //               decoration: InputDecoration(
                                    //                   label: Text(
                                    //                     '病院名', //   TODO: l10n 対応 (病院名) (hospitalName)
                                    //                   ),
                                    //                   suffixIcon: Icon(
                                    //                     Icons.search,
                                    //                     color: Colors.grey,
                                    //                   )),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             width: context.appTheme.spacing
                                    //                 .marginMedium,
                                    //           ),
                                    //           Expanded(
                                    //             child: ReactiveTextFormField(
                                    //               formControlName:
                                    //                   'medicalCardNumber',
                                    //               decoration: InputDecoration(
                                    //                 label: Text(
                                    //                   '診察券番号', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             width: context.appTheme.spacing
                                    //                 .marginMedium,
                                    //           ),
                                    //           Expanded(
                                    //             child: Row(
                                    //               mainAxisSize:
                                    //                   MainAxisSize.min,
                                    //               crossAxisAlignment:
                                    //                   CrossAxisAlignment.start,
                                    //               mainAxisAlignment:
                                    //                   MainAxisAlignment.start,
                                    //               children: [
                                    //                 ReactiveFormConsumer(
                                    //                     builder:
                                    //                         (context, form, _) {
                                    //                   return ElevatedButton(
                                    //                     onPressed: form.valid
                                    //                         ? () {
                                    //                             model.createUpdateMedicalRecordHospital(
                                    //                                 formGroup:
                                    //                                     form);
                                    //                           }
                                    //                         : null,
                                    //                     child: Text(
                                    //                       '保存する', // TODO: l10n 対応 (保存する) (save)
                                    //                       style: TextStyle(
                                    //                         color: Colors.white,
                                    //                       ),
                                    //                     ),
                                    //                   );
                                    //                 }),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       );
                                    //     }),

                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        '病院を追加',
                                        style: TextStyle(
                                            color:
                                                context.appTheme.primaryColor),
                                      ) // TODO: l10n 対応 (病院を追加) (addHospital)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReactiveFormConsumer(builder: (context, form, _) {
                          return ElevatedButton(
                            onPressed: form.valid
                                ? () {
                                    model.createUpdateMedicalRecords(form);
                                  }
                                : null,
                            child: Text(
                              '保存する', // TODO: l10n 対応 (保存する) (save)
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        })
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
