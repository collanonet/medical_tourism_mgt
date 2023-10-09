import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'basic_info_model.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
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
              form: () => MedicalRecord.buildFormGroup(
                medicalRecord: model.medicalRecord.data,
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
                                child: ReactiveDatePicker(
                                  formControlName: 'dateOfBirth',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'dateOfBirth',
                                      readOnly: true,
                                      onTap: (value) => picker.showPicker(),
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
                                child: ReactiveTextFormField(
                                  formControlName: 'age',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffix: Text(
                                      '歳', // TODO: l10n 対応 (歳) (age)
                                    ),
                                    label: Text(
                                      '年齢', // TODO: l10n 対応 (年齢) (age)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'gender',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '性別', // TODO:
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: ReactiveDatePicker(
                                  formControlName: 'arrivalDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'arrivalDate',
                                      readOnly: true,
                                      onTap: (value) => picker.showPicker(),
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
                                child: ReactiveDatePicker(
                                  formControlName: 'examinationDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'examinationDate',
                                      readOnly: true,
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
                                child: ReactiveDatePicker(
                                  formControlName: 'departureDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'departureDate',
                                      readOnly: true,
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
                                child: ReactiveDatePicker(
                                  formControlName: 'receptionDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'receptionDate',
                                      readOnly: true,
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
                                child: ReactiveDatePicker(
                                  formControlName: 'advancePaymentDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextFormField(
                                      formControlName: 'advancePaymentDate',
                                      readOnly: true,
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
                                child: ReactiveTextFormField(
                                  formControlName: 'paymentMethod',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '受取方法', //  TODO: l10n 対応 (受取方法) (receptionMethod)
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
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.appTheme.spacing.marginMedium,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReactiveFormConsumer(builder: (context, form, _) {
                          return ElevatedButton(
                            onPressed: form.valid
                                ? () {
                                    Map<String, Object?> value = form.value;
                                    value['age'] = int.tryParse(
                                            form.control('age').value ?? '') ??
                                        0;
                                    MedicalRecordRequest request =
                                        MedicalRecordRequest.fromJson(
                                            form.value);
                                    logger.d(request);
                                    if (model.medicalRecord.data != null) {
                                      model.updateMedicalRecords(
                                          model.medicalRecord.data!.id,
                                          request);
                                    } else {
                                      model.postMedicalRecords(request);
                                    }
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
