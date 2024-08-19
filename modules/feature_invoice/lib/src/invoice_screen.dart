import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'detail/quote_screen.dart';
import 'invoice_form.dart';
import 'invoice_model.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => formInvoice(),
      builder: (context, formGroup, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: ColumnSeparated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '見積書/請求書　検索',
                      style: context.textTheme.titleMedium,
                    ),
                    RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('病院名'),
                              ReactiveTextField(
                                formControlName: 'nameOfHospital',
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('エージェント名'),
                              ReactiveTextField(
                                formControlName: 'agentName',
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('患者名'),
                              ReactiveTextField(
                                formControlName: 'patientName',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        InkWell(
                          onTap: () {
                            final periodFrom =
                                formGroup.control('issue_date_from');
                            final periodTo = formGroup.control('issue_date_to');
                            final valueDate =
                                periodFrom.value ?? DateTime.now();
                            periodFrom.value = DateTime(
                                valueDate.year, valueDate.month - 1, 1);
                            periodTo.value =
                                DateTime(valueDate.year, valueDate.month, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: context.appTheme.primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('発行日（自）'),
                            IntrinsicWidth(
                              stepWidth: 200,
                              child: ReactiveDatePicker<DateTime>(
                                formControlName: 'issue_date_from',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (context, picker, child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'issue_date_from',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          '~',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('発行日（至）'),
                            IntrinsicWidth(
                              stepWidth: 200,
                              child: ReactiveDatePicker<DateTime>(
                                formControlName: 'issue_date_to',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (context, picker, child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'issue_date_to',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            final periodFrom =
                                formGroup.control('issue_date_from');
                            final periodTo = formGroup.control('issue_date_to');
                            final valueDate = periodTo.value ?? DateTime.now();
                            periodFrom.value = DateTime(
                                valueDate.year, valueDate.month + 1, 1);
                            periodTo.value = DateTime(
                                valueDate.year, valueDate.month + 2, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: context.appTheme.primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('見積書/請求書'),
                            IntrinsicWidth(
                              stepWidth: 200,
                              child: ValueListenableBuilder(
                                valueListenable:
                                    context.read<InvoiceModel>().prospects,
                                builder: (context, value, _) {
                                  return ReactiveDropdownFormField(
                                    formControlName: 'invoice',
                                    items: value
                                        .map((e) => DropdownMenuItem(
                                              value: e.item,
                                              child: Text(
                                                e.item,
                                              ),
                                            ))
                                        .toList(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('見込み'),
                            IntrinsicWidth(
                              stepWidth: 200,
                              child: ValueListenableBuilder(
                                valueListenable:
                                    context.read<InvoiceModel>().invoices,
                                builder: (context, value, _) {
                                  return ReactiveDropdownFormField(
                                    formControlName: 'prospects',
                                    items: value
                                        .map((e) => DropdownMenuItem(
                                              value: e.item,
                                              child: Text(
                                                e.item,
                                              ),
                                            ))
                                        .toList(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: context.appTheme.spacing.marginLarge),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text('　検索　'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.appTheme.spacing.marginMedium),
              const QuoteScreen()
            ],
          ),
        );
      },
    );
  }
}
