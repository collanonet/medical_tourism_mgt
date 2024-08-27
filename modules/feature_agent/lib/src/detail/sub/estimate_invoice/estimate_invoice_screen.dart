import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'estimate_invoice_file.dart';
import 'estimate_invoice_form.dart';
import 'estimate_invoice_model.dart';

class EstimateInvoiceScreen extends StatefulWidget {
  const EstimateInvoiceScreen({super.key, required this.id});
  final String id;
  @override
  State<EstimateInvoiceScreen> createState() => _EstimateInvoiceScreenState();
}

class _EstimateInvoiceScreenState extends State<EstimateInvoiceScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            context.read<EstimateInvoiceModel>().estimateInvoiceData,
        builder: (context, value, _) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        filePicker().then((value) {
                          if (value != null) {
                            showCreateWithFileDialog(context, value);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          context.appTheme.spacing.marginExtraLarge,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(
                            context.appTheme.spacing.borderRadiusMedium,
                          )),
                          border: Border.all(
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy_all_rounded,
                              size: 50,
                              color: context.appTheme.primaryColor,
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            Column(
                              children: [
                                Text(
                                  '見積書・請求書をここにドラッグ＆ドロップ',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    filePicker().then((value) {
                                      if (value != null) {
                                        showCreateWithFileDialog(
                                            context, value);
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'またはファイルを選択する',
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: selected,
                            builder: (context, ids, _) {
                              return Checkbox(
                                value: ids.isEmpty
                                    ? false
                                    : value.data?.length == ids.length,
                                onChanged: (select) {
                                  if (select != null) {
                                    if (select) {
                                      if (value.hasData) {
                                        selected.value = value.requireData
                                            .map((e) => e.id.toString())
                                            .toList();
                                      }
                                    } else {
                                      selected.value = [];
                                    }
                                  }
                                },
                              );
                            }),
                        Expanded(flex: 2, child: Text('書類名')),
                        Expanded(child: Text('発行元')),
                        Expanded(child: Text('発行日')),
                        Expanded(child: Text('支払期限')),
                        Expanded(child: Text('入金日')),
                        Expanded(child: Text('支払い方法')),
                      ],
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: value.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = value.data?[index];

                          return Row(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: selected,
                                  builder: (context, sels, _) {
                                    return Checkbox(
                                      value: sels.contains(data?.id),
                                      onChanged: (sel) {
                                        if (sel != null) {
                                          if (sel) {
                                            selected.value = [
                                              ...sels,
                                              data?.id ?? ''
                                            ];
                                          } else {
                                            selected.value = [
                                              ...sels
                                                  .where((e) => e != data?.id)
                                            ];
                                          }
                                        }
                                      },
                                    );
                                  }),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    value.requireData[index].documentName ??
                                        ''),
                              ),
                              Expanded(
                                child: Text(
                                    value.requireData[index].publisher ?? ''),
                              ),
                              Expanded(
                                child: Text(value
                                            .requireData[index].dateOfIssue ==
                                        null
                                    ? ''
                                    : Dates.formShortDate(
                                        value.requireData[index].dateOfIssue)),
                              ),
                              Expanded(
                                child: Text(
                                    value.requireData[index].dateOfPayment ==
                                            null
                                        ? ''
                                        : Dates.formShortDate(value
                                            .requireData[index].dateOfPayment)),
                              ),
                              Expanded(
                                child: Text(value
                                            .requireData[index].paymentDay ==
                                        null
                                    ? ''
                                    : Dates.formShortDate(
                                        value.requireData[index].paymentDay)),
                              ),
                              Expanded(
                                child: Text(
                                    value.requireData[index].methodOfPayment ??
                                        ''),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.grey,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, sels, _) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ValueListenableListener(
                          valueListenable:
                              context.read<EstimateInvoiceModel>().delete,
                          onListen: () {
                            var delete = context
                                .read<EstimateInvoiceModel>()
                                .delete
                                .value;

                            if (delete.hasError) {
                              snackBarWidget(
                                message: '削除に失敗しました',
                                backgroundColor: Colors.red,
                                prefixIcon: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              );
                            }

                            if (delete.hasData) {
                              selected.value = [];
                              snackBarWidget(
                                message: '削除しました',
                                prefixIcon: const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                          child: ValueListenableBuilder(
                              valueListenable:
                                  context.read<EstimateInvoiceModel>().delete,
                              builder: (context, value, _) {
                                return OutlinedButton(
                                    onPressed: sels.isEmpty || value.loading
                                        ? null
                                        : () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return Provider.value(
                                                    value: context.read<
                                                        EstimateInvoiceModel>(),
                                                    child: AlertDialog(
                                                      title: Text("削除確認"),
                                                      content: Text(
                                                          "選択した書類を削除しますか？"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("キャンセル"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    EstimateInvoiceModel>()
                                                                .deleteEstimateInvoice(
                                                                    sels);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("削除する"),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                    child: WithLoadingButton(
                                      isLoading: value.loading,
                                      loadingColor:
                                          context.appTheme.primaryColor,
                                      child: Text(
                                        "削除する",
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                                color: context
                                                    .appTheme.primaryColor),
                                      ),
                                    ));
                              }),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('印刷する'),
                        )
                      ],
                    );
                  })
            ],
          );
        });
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<EstimateInvoiceModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () =>
                  estimateInvoiceForm(agentRecordId: widget.id, file: file)
                    ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
