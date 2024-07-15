import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'document_file.dart';
import 'document_form.dart';
import 'document_model.dart';

class DocumentSection extends StatefulWidget {
  const DocumentSection({super.key, required this.id});
  final String id;
  @override
  State<DocumentSection> createState() => _DocumentSectionState();
}

class _DocumentSectionState extends State<DocumentSection> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
        separatorBuilder: (context, index) => SizedBox(
              height: context.appTheme.spacing.formSpacing,
            ),
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
                        'パンフレットや資料をここにドラッグ＆ドロップ',
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
                              showCreateWithFileDialog(context, value);
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
          const Row(
            children: [
              Expanded(flex: 2, child: Text('書類名')),
              Expanded(child: Text('更新日')),
              Expanded(child: Text('翻訳言語')),
              Expanded(child: Text('翻訳者')),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: context.read<DocumentModel>().documentData,
              builder: (context, value, _) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                  value.requireData[index].documentName ?? ''),
                            ),
                            Expanded(
                              child: Text(
                                  value.requireData[index].updatedOn == null
                                      ? ''
                                      : Dates.formShortDate(
                                          value.requireData[index].updatedOn)),
                            ),
                            Expanded(
                              child: Text(value
                                      .requireData[index].translationLanguage ??
                                  ''),
                            ),
                            Expanded(
                              child: Text(
                                  value.requireData[index].translator ?? ''),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                  ),
                );
              }),
          RowSeparated(
            mainAxisAlignment: MainAxisAlignment.end,
            separatorBuilder: (context, index) => SizedBox(
              width: context.appTheme.spacing.formSpacing,
            ),
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.appTheme.spacing.marginSmall,
                        vertical: context.appTheme.spacing.buttonVertical,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Text(
                    "削除する",
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: context.appTheme.primaryColor),
                  )),
              ElevatedButton(onPressed: () {}, child: const Text('共有する')),
              ElevatedButton(onPressed: () {}, child: const Text('印刷する'))
            ],
          ),
        ]);
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<DocumentModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () => documentForm(hospitalRecordId: widget.id, file: file)
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
