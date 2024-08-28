// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';

class SummaryMedicalOverseaDataScreen extends StatelessWidget {
  const SummaryMedicalOverseaDataScreen({super.key, required this.data});
  final List<MedicalRecordOverseaData> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'サマリー転記用に項目を出力しました。コピーして利用してください。',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close)),
          ],
        ),
        const Text('テキスト'),
        TextFormField(
          minLines: 3,
          maxLines: 10,
          enabled: false,
          decoration: InputDecoration(
              isDense: true,
              hintText: data
                  .map((e) =>
                      '${e.hospitalName!}    ${e.documentName!}    ${e.category!}    ${Dates.formShortDate(e.issueDate)}')
                  .join('\n')),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                copyToClipboard(data
                    .map((e) =>
                        '${e.hospitalName!}    ${e.documentName!}    ${e.category!}    ${Dates.formShortDate(e.issueDate)}')
                    .join('\n'));
                snackBarWidget(
                    message: 'コピーされました',
                    prefixIcon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ));
                Navigator.pop(context);
              },

              child: const Text('コピーする'), // TODO: l10n 対応 (コピーする) (copy)
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
            ),
          ],
        )
      ],
    );
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
