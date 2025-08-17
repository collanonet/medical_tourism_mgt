// Flutter imports:
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
              Expanded(child: Text('案件番号', textAlign: TextAlign.left)),
              Expanded(flex: 2, child: Text('患者名', textAlign: TextAlign.left)),
              Expanded(child: Text('見積書発行日', textAlign: TextAlign.left)),
              Expanded(child: Text('請求書発行日', textAlign: TextAlign.left)),
              Expanded(child: Text('ステータス', textAlign: TextAlign.left)),
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
                                        title: Text(data?.type == true ? '精算書' : '見積書'),
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
                              // 案件番号（8桁）
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      _formatCaseNumber(data?.caseNumber ?? ''),
                                      style: context.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (data?.originalEstimateId != null)
                                      InkWell(
                                        onTap: () {
                                          // 元の見積書へのリンク処理
                                          _showOriginalEstimateDialog(context, data!);
                                        },
                                        child: Text(
                                          '元の見積書',
                                          style: TextStyle(
                                            color: context.appTheme.primaryColor,
                                            fontSize: 12,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // 患者名
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
                              // 見積書発行日
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.left,
                                  data?.startDate != null
                                      ? Dates.formatFullDate(data!.startDate!)
                                      : '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              // 請求書発行日
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.left,
                                  data?.invoiceDate != null
                                      ? Dates.formatFullDate(data!.invoiceDate!)
                                      : '--',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              // ステータス
                              Expanded(
                                child: _buildStatusWidget(data),
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

  // 案件番号を8桁でフォーマット
  String _formatCaseNumber(String caseNumber) {
    if (caseNumber.isEmpty) return '--';
    // 8桁にパディング（例: 202506061 -> 202506061）
    return caseNumber.padLeft(8, '0');
  }

  // ステータスウィジェットを構築
  Widget _buildStatusWidget(dynamic data) {
    if (data?.isIssued == true) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          '発行済',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          '未発行',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  // 元の見積書ダイアログを表示
  void _showOriginalEstimateDialog(BuildContext context, dynamic data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('元の見積書'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('案件番号: ${_formatCaseNumber(data.caseNumber ?? '')}'),
            Text('患者名: ${data.patient?.firstNameRomanized ?? ''} ${data.patient?.familyNameRomanized ?? ''}'),
            const SizedBox(height: 16),
            const Text('元の見積書の詳細を表示しますか？'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () {
              // 元の見積書の詳細画面に遷移する処理
              Navigator.of(context).pop();
              // TODO: 元の見積書の詳細画面に遷移
            },
            child: const Text('詳細表示'),
          ),
        ],
      ),
    );
  }
}
