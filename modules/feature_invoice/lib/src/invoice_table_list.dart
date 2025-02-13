// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
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
              Expanded(child: Text('書類番号',textAlign: TextAlign.left,)), //Document Number
              Expanded(flex: 2,child: Text('患者名',textAlign: TextAlign.left,)),
              Expanded(child: Text('発行日',textAlign: TextAlign.left,)), // Issue date
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
                                        title: const Text('精算書'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (data?.fileNamePdfJP != null)
                                              ListTile(
                                                title: const Text('日本語'),
                                                onTap: () {
                                                  showPreviewFile(
                                                    context,
                                                    fileSelect: FileSelect(
                                                      // file name from object model
                                                        url: data?.fileNamePdfJP ??
                                                            ''
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (data?.fileNamePdfEN != null)
                                              ListTile(
                                                title: const Text('英語'),
                                                onTap: () {

                                                  showPreviewFile(
                                                    context,
                                                    fileSelect: FileSelect(
                                                      // file name from object model
                                                        url: data?.fileNamePdfEN ??
                                                            ''
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (data?.fileNamePdfVN != null)
                                              ListTile(
                                                title: const Text('ベトナム語'),
                                                onTap: () {
                                                  showPreviewFile(
                                                    context,
                                                    fileSelect: FileSelect(
                                                      // file name from object model
                                                        url: data?.fileNamePdfVN ??
                                                            ''
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (data?.fileNamePdfZH != null)
                                              ListTile(
                                                title: const Text('中国語'),
                                                onTap: () {
                                                  showPreviewFile(
                                                    context,
                                                    fileSelect: FileSelect(
                                                      // file name from object model
                                                        url: data?.fileNamePdfZH ??
                                                            ''
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (data?.fileNamePdfZHTW != null)
                                              ListTile(
                                                title: const Text('繁体字'),
                                                onTap: () {
                                                  showPreviewFile(
                                                    context,
                                                    fileSelect: FileSelect(
                                                      // file name from object model
                                                        url: data?.fileNamePdfZHTW ??
                                                            ''
                                                    ),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      );
                                    });
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 16);
                            },
                            children: [
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.left,
                                  data?.invoiceNumber ?? '',
                                  style: context.textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.left,
                                          '${data?.patient?.firstNameRomanized ?? '-'} ${data?.patient?.middleNameRomanized ?? '-'} ${data?.patient?.familyNameRomanized ?? '-'}',
                                          style: TextStyle(
                                            color: context.appTheme.primaryColor,
                                            fontFamily: 'NotoSansJP',
                                            package: 'core_ui',
                                          ),
                                        ),
                                        Text(
                                            '${data?.patient?.firstNameChineseOrVietnamese ?? '-'} ${data?.patient?.middleNameChineseOrVietnamese ?? '-'} ${data?.patient?.familyNameChineseOrVietnamese ?? '-'} / ${data?.patient?.firstNameJapaneseForChinese ?? '-'} ${data?.patient?.middleNameJapaneseForChinese ?? '-'} ${data?.patient?.familyNameJapaneseForChinese ?? '-'} / ${data?.patient?.firstNameJapaneseForNonChinese ?? '-'} ${data?.patient?.middleNameJapaneseForNonChinese ?? '-'} ${data?.patient?.familyNameJapaneseForNonChinese ?? '-'} '),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    boxRequired(
                                      enabled: data?.type ?? false,
                                      label: data?.type ?? false ? '精算書' : '見積書',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.left,
                                  data?.invoiceDate != null
                                      ? Dates.formatFullDate(data!.invoiceDate!)
                                      : '--',
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
