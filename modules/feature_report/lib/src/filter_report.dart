import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_report_form.dart';
import 'report_model.dart';

class ReportFilter extends StatefulWidget {
  const ReportFilter({super.key});

  @override
  State<ReportFilter> createState() => _ReportFilterState();
}

class _ReportFilterState extends State<ReportFilter> {
  bool _check = false;
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportModel>(
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
                      '契約書検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'patientName',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                ),
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
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'hospitalName',
                            decoration: InputDecoration(
                              label: Text(
                                '報告書',
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                ),
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
                        Text(
                          '取下対象者',
                          style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            package: 'core_ui',
                          ),
                        )
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
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                ),
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
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                ),
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
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              builder: (context, picker, child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'entry_date_from',
                                  valueAccessor: DateTimeValueAccessor(
                                    dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                  ),
                                  decoration: InputDecoration(
                                    label: Text(
                                      context.l10n.labelEntryDateFrom,
                                      style: TextStyle(
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                      ),
                                    ),
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
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '〜',
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                              formControlName: 'entry_date_to',
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              builder: (context, picker, child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'entry_date_to',
                                  valueAccessor: DateTimeValueAccessor(
                                    dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                  ),
                                  decoration: InputDecoration(
                                    label: Text(
                                      context.l10n.labelEntryDateTo,
                                      style: TextStyle(
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                      ),
                                    ),
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
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'examination_date_from',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'examination_date_from',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelExaminationDateFrom,
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
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
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '〜',
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'examination_date_to',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'examination_date_to',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelExaminationDateTo,
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
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
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_from',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_from',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelReturnDateFrom,
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
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
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '〜',
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_to',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_to',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelReturnDateTo,
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
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
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            context.l10n.actionSearch,
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
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
