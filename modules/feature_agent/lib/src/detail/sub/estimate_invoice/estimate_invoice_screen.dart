import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

class EstimateInvoiceScreen extends StatefulWidget {
  const EstimateInvoiceScreen({super.key});

  @override
  State<EstimateInvoiceScreen> createState() => _EstimateInvoiceScreenState();
}

class _EstimateInvoiceScreenState extends State<EstimateInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    filePicker().then((value) {
                      if (value != null) {
                        // todo: showCreateWithFileDialog(context, value);
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
                                    // todo: showCreateWithFileDialog(context, value);
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
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('削除する'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('印刷する'),
            )
          ],
        )
      ],
    );
  }
}
