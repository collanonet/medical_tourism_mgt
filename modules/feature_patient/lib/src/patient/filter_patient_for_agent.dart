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

class PatientFilterForAgent extends StatelessWidget {
  const PatientFilterForAgent({super.key});

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
                    color: const Color(0xffF0F3F5)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelPatientName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'patientName',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelAgentCompanyName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'companyAGENTS',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelHospitalName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'acceptingHospital',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '種別',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              const ReactiveDropdownFormField(
                                formControlName: 'type',
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
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelSalesRepresentative,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'salesStaff',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Spacer(flex: 4)
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelEntryDateFrom,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'dateOfEntryfrom',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'dateOfEntryfrom',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelEntryDateTo,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'dateOfEntryto',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'dateOfEntryto',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelExaminationDateFrom,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'medicalDayfrom',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'medicalDayfrom',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelExaminationDateTo,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'medicalDayto',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'medicalDayto',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelReturnDateFrom,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'returnDatefrom',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'returnDatefrom',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelReturnDateTo,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                  formControlName: 'returnDateto',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, picker, child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'returnDateto',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                          onPressed: picker.showPicker,
                                        ),
                                      ),
                                      inputFormatters: [
                                        formatter.dateFormatter,
                                      ],
                                    );
                                  }),
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
