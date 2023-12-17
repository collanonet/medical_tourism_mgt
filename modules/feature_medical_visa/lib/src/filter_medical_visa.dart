import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_medical_visa_form.dart';
import 'medical_visa_model.dart';

class MedicalVisaFilter extends StatefulWidget {
  const MedicalVisaFilter({super.key});

  @override
  State<MedicalVisaFilter> createState() => _MedicalVisaFilterState();
}

class _MedicalVisaFilterState extends State<MedicalVisaFilter> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalVisaModel>(
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
                      '医療ビザ管理検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'patient_name',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'agent_company_name',
                            decoration: InputDecoration(
                              label: Text(
                                '査証',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'hospital_name',
                            decoration: InputDecoration(
                              label: Text(
                                '報告書',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 1 checkbok and text widget
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('取下対象者')
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'classification',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelClassification,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'sales_representative',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelSalesRepresentative,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Spacer(flex: 4)
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'entry_date_from',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'entry_date_from',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'entry_date_to',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'entry_date_to',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'examination_date_from',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'examination_date_from',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'examination_date_to',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'examination_date_to',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_from',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_from',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_to',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_to',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
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
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            formGroup.reset();
                          },
                          child: Text(
                            context.l10n.actionClear,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {},
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
