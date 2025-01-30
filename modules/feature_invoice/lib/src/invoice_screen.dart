// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'invoice_form.dart';
import 'invoice_model.dart';
import 'invoice_table_list.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => formInvoice()..markAllAsTouched(),
      builder: (context, formGroup, child) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveTextField(
                          formControlName: 'nameOfHospital',
                          decoration: const InputDecoration(
                            label: Text('病院名'),
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveTextField(
                          formControlName: 'agentName',
                          decoration: const InputDecoration(
                            label: Text('エージェント名'),
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveTextField(
                          formControlName: 'patientName',
                          decoration: const InputDecoration(
                            label: Text('患者名'),
                          ),
                        ),
                      )
                    ],
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    separatorBuilder: (context, index) => SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    children: [
                      InkWell(
                        onTap: () {
                          final periodFrom =
                              formGroup.control('issue_date_from');
                          final periodTo = formGroup.control('issue_date_to');
                          final valueDate = periodFrom.value ?? DateTime.now();
                          periodFrom.value =
                              DateTime(valueDate.year, valueDate.month - 1, 1);
                          periodTo.value =
                              DateTime(valueDate.year, valueDate.month, 0);
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                      ),
                      const IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePickerField(
                          formControlName: 'issue_date_from',
                          label: '発行日（自）',
                        ),
                      ),
                      const Text(
                        '~',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePickerField(
                          formControlName: 'issue_date_to',
                          label: '発行日（至）',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final periodFrom =
                              formGroup.control('issue_date_from');
                          final periodTo = formGroup.control('issue_date_to');
                          final valueDate = periodTo.value ?? DateTime.now();
                          periodFrom.value =
                              DateTime(valueDate.year, valueDate.month + 1, 1);
                          periodTo.value =
                              DateTime(valueDate.year, valueDate.month + 2, 0);
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                      ),
                      const IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDropdownFormField(
                          formControlName: 'invoice',
                          items: [
                            DropdownMenuItem(
                              value: '見積書',
                              child: Text(
                                '見積書',
                              ),
                            ),
                            DropdownMenuItem(
                              value: '精算書',
                              child: Text(
                                '精算書',
                              ),
                            ),
                          ],
                          decoration: InputDecoration(
                            label: Text('見積書/精算書'),
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDropdownFormField(
                          formControlName: 'prospects',
                          items: [
                            'A',
                            'B',
                            'C',
                          ]
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                    ),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            label: Text('見込み'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<InvoiceModel>().fetchInvoices();
                        },
                        // clear
                        child: const Center(
                          child: Text('クリア'),
                        ),
                      ),
                      SizedBox(width: context.appTheme.spacing.marginMedium),
                      ElevatedButton(
                        onPressed: () {
                          context.read<InvoiceModel>().searchInvoices(
                                nameOfHospital:
                                    formGroup.control('nameOfHospital').value,
                                agentName: formGroup.control('agentName').value,
                                patientName:
                                    formGroup.control('patientName').value,
                                issueDateFrom:
                                    formGroup.control('issue_date_from').value,
                                issueDateTo:
                                    formGroup.control('issue_date_to').value,
                                invoice: formGroup.control('invoice').value,
                                prospects: formGroup.control('prospects').value,
                              );
                        },
                        child: const Center(
                          child: Text('検索'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: context.appTheme.spacing.marginMedium),
            const Expanded(child: InvoiceTableList())
          ],
        );
      },
    );
  }
}
