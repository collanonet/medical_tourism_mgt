import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'estimate_model.dart';

class EstimateScreenList extends StatefulWidget {
  const EstimateScreenList({super.key});

  @override
  State<EstimateScreenList> createState() => _EstimateScreenListState();
}

class _EstimateScreenListState extends State<EstimateScreenList> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);
  @override
  void dispose() {
    context.watch<EstimateModel>().medicalQuotationData;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable: context.watch<EstimateModel>().medicalQuotationData,
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    },
                  ),
                  Expanded(
                      child: Text(
                    '書類番号', // Document Number
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '種別', // type
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '宛先', // address
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '発行日', // Issue date
                      style: context.textTheme.bodySmall,
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        '件名', // subject
                        style: context.textTheme.bodySmall,
                      )),
                  Expanded(
                      child: Text(
                    'エージェントへ開示', // Disclosure to Agent
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '患者へ開示', // Disclosure to patients
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '見込み', // Prospects
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                    child: SizedBox(
                      width: context.appTheme.spacing.marginLarge,
                    ),
                  ),
                ],
              ),
              const Divider(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: value.data?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = value.data?[index];
                  return InkWell(
                    onTap: data?.fileNamePdfJP != null ||
                            data?.fileNamePdfEN != null ||
                            data?.fileNamePdfZH != null ||
                            data?.fileNamePdfZHTW != null ||
                            data?.fileNamePdfVN != null
                        ? () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: const Text('見積書'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (data?.fileNamePdfJP != null)
                                          ListTile(
                                            title: const Text('日本語'),
                                            onTap: () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data?.fileNamePdfJP ??
                                                          '');
                                            },
                                          ),
                                        if (data?.fileNamePdfEN != null)
                                          ListTile(
                                            title: const Text('英語'),
                                            onTap: () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data?.fileNamePdfEN ??
                                                          '');
                                            },
                                          ),
                                        if (data?.fileNamePdfVN != null)
                                          ListTile(
                                            title: const Text('ベトナム語'),
                                            onTap: () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data?.fileNamePdfVN ??
                                                          '');
                                            },
                                          ),
                                        if (data?.fileNamePdfZH != null)
                                          ListTile(
                                            title: const Text('中国語'),
                                            onTap: () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data?.fileNamePdfZH ??
                                                          '');
                                            },
                                          ),
                                        if (data?.fileNamePdfZHTW != null)
                                          ListTile(
                                            title: const Text('繁体字'),
                                            onTap: () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data?.fileNamePdfZHTW ??
                                                          '');
                                            },
                                          ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
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
                                        ...sels.where((e) => e != data?.id)
                                      ];
                                    }
                                  }
                                },
                              );
                            },
                          ),
                          Expanded(
                              child: Text(
                            data?.invoiceNumber ?? '',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context
                                        .appTheme.spacing.marginExtraSmall,
                                    vertical: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(context
                                        .appTheme.spacing.borderRadiusMedium),
                                  ),
                                  child: Text(
                                    '見積書',
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(
                            data?.address ?? '',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              data?.invoiceDate != null
                                  ? Dates.formatFullDate(data!.invoiceDate!)
                                  : '',
                              style: context.textTheme.bodySmall,
                            ),
                          )),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  '--',
                                  style: context.textTheme.bodySmall,
                                ),
                              )),
                          Expanded(
                              child: Text(
                            '--',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '--',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '--',
                            style: context.textTheme.bodySmall,
                          )),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<EstimateModel>().editQuotation(
                                        invoice: data!,
                                        formGroup: formGroup,
                                      );
                                },
                                child: const Text(
                                  '編集',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                  );
                },
              ),
              Divider(),
              ValueListenableBuilder(
                valueListenable: selected,
                builder: (context, sels, _) {
                  return RowSeparated(
                    separatorBuilder: (context, index) =>
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableListener(
                        valueListenable: context.read<EstimateModel>().delete,
                        onListen: () {
                          var delete =
                              context.read<EstimateModel>().delete.value;

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
                          valueListenable: context.read<EstimateModel>().delete,
                          builder: (context, value, _) {
                            return OutlinedButton(
                              onPressed: sels.isEmpty || value.loading
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Provider.value(
                                              value:
                                                  context.read<EstimateModel>(),
                                              child: AlertDialog(
                                                title: const Text('削除確認'),
                                                content: const Text(
                                                    '選択したデータを削除しますか？'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('キャンセル'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<EstimateModel>()
                                                          .deleteInvoice(sels);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('削除する'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                              child: WithLoadingButton(
                                isLoading: value.loading,
                                loadingColor: context.appTheme.primaryColor,
                                child: Text(
                                  '削除する',
                                  style: context.textTheme.labelLarge?.copyWith(
                                      color: context.appTheme.primaryColor),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ValueListenableListener(
                        onListen: () {
                          var submitMoveToInvoice = context
                              .read<EstimateModel>()
                              .submitMoveToInvoice
                              .value;
                          if (submitMoveToInvoice.hasData &&
                              submitMoveToInvoice.loading == false) {
                            selected.value = [];
                            snackBarWidget(
                              message: '請求書に移動しました',
                              prefixIcon: const Icon(Icons.check_circle,
                                  color: Colors.white),
                            );
                          }
                          if (submitMoveToInvoice.hasError) {
                            selected.value = [];
                            snackBarWidget(
                              message: '請求書に移動できませんでした',
                              backgroundColor: Colors.red,
                              prefixIcon:
                                  const Icon(Icons.error, color: Colors.white),
                            );
                          }
                        },
                        valueListenable:
                            context.read<EstimateModel>().submitMoveToInvoice,
                        child: ValueListenableBuilder(
                            valueListenable: context
                                .watch<EstimateModel>()
                                .submitMoveToInvoice,
                            builder: (context, submitMoveToInvoice, _) {
                              return ElevatedButton(
                                onPressed: submitMoveToInvoice.loading
                                    ? null
                                    : () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return Provider.value(
                                                value: context
                                                    .read<EstimateModel>(),
                                                child: AlertDialog(
                                                  title: const Text('請求書に移動'),
                                                  content: const Text(
                                                      '選択したデータを請求書に移動しますか？'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('キャンセル'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                            context
                                                            .read<
                                                                EstimateModel>()
                                                            .moveToInvoice(
                                                                sels);
                                                        Navigator.of(context)
                                                            .pop();
                                                        });
                                                        
                                                      },
                                                      child: const Text('移動する'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                child: WithLoadingButton(
                                  isLoading: submitMoveToInvoice.loading,
                                  child: const Text(
                                    '請求書に移動',
                                  ),
                                ),
                              );
                            }),
                      ),
                      // OutlinedButton(
                      //   onPressed: () {},
                      //   child: Text('CSV出力'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     'コピーして新規作成',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     '新規作成',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ],
          );
        });
  }
}
