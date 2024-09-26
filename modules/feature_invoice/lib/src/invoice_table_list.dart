// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'invoice_model.dart';

class InvoiceTableList extends StatefulWidget {
  const InvoiceTableList({super.key});

  @override
  State<InvoiceTableList> createState() => _InvoiceTableListState();
}

class _InvoiceTableListState extends State<InvoiceTableList> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          const Row(
            children: [
              Expanded(child: Text('書類番号')), //Document Number
              Expanded(child: SizedBox(width: 100)),
              Expanded(child: Text('宛先')), // address
              Expanded(flex: 2, child: Text('タイトル')), // title
              Expanded(child: Text('発行日')), // Issue date
              Expanded(child: Text('見込み')), // Prospects
              Expanded(child: Text('売上管理')), // Sales Management
            ],
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: context.watch<InvoiceModel>().medicalInvoiceData,
              builder: (context, value, child) {
                return Skeletonizer(
                  enabled: value.loading,
                  child: ListView.builder(
                    itemCount: value.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var data = value.data?[index];
                      return InkWell(
                        onTap: data?.fileNamePdfJP != null
                            ? () {
                          openUrlInBrowser(fileName: data!.fileNamePdfJP!);
                        }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? context.appTheme.primaryColor.withOpacity(0.1)
                                : Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: RowSeparated(
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 16);
                            },
                            children: [
                              Expanded(
                                child: Text(
                                  data?.invoiceNumber ?? '',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              boxRequired(
                                enabled: data?.type ?? false,
                                label: data?.type ?? false ? '精算書' : '見積書',
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: context.textTheme.bodySmall,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data?.invoiceDate != null
                                      ? Dates.formatFullDate(data!.invoiceDate!)
                                      : '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
