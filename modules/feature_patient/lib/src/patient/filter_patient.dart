import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'patient_model.dart';
import 'filter_patient_form.dart';

class PatientFilter extends StatelessWidget {
  const PatientFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    return Consumer<PatientModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterPatient(),
            builder: (context, formGroup, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.labelPatientSearch,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'patientName',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'companyAGENTS',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelAgentCompanyName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'acceptingHospital',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelHospitalName,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
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
                                value: 'その他',
                                child: Text('その他'),
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
                                value: '旅行',
                                child: Text('旅行'),
                              ),
                              DropdownMenuItem(
                                value: '視察',
                                child: Text('視察'),
                              ),
                              DropdownMenuItem(
                                value: '再生',
                                child: Text('再生'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'salesStaff',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelSalesRepresentative,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Spacer(flex: 4)
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'dateOfEntryfrom',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelEntryDateFrom,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'dateOfEntryto',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelEntryDateTo,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'medicalDayfrom',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelExaminationDateFrom,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'medicalDayto',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelExaminationDateTo,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'returnDatefrom',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelReturnDateFrom,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField<DateTime>(
                            formControlName: 'returnDateto',
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelReturnDateTo,
                              ),
                              suffixIcon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                            inputFormatters: [
                              formatter.dateFormatter,
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            formGroup.reset();
                            model.patients();
                          },
                          child: Text(
                            context.l10n.actionClear,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            model.patients(form: formGroup);
                          },
                          child: Text(context.l10n.actionSearch),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
