// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'document_form.dart';
import 'document_form_create.dart';
import 'document_model.dart';

class DocumentSection extends StatefulWidget {
  const DocumentSection({super.key, required this.id});
  final String id;
  @override
  State<DocumentSection> createState() => _DocumentSectionState();
}

class _DocumentSectionState extends State<DocumentSection> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.read<DocumentModel>().documentData,
        builder: (context, value, _) {
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
                              '書類データをここにドラッグ＆ドロップ',
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
                    const Expanded(flex: 2, child: Text('書類名')),
                    const Expanded(child: Text('更新日')),
                    const Expanded(child: Text('翻訳言語')),
                    const Expanded(child: Text('翻訳者')),
                  ],
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
                                          ...sels.where((e) => e != data?.id)
                                        ];
                                      }
                                    }
                                  },
                                );
                              }),
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
                            child: Text(
                                value.requireData[index].translationLanguage ??
                                    ''),
                          ),
                          Expanded(
                            child:
                                Text(value.requireData[index].translator ?? ''),
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
                ),
                ValueListenableBuilder(
                    valueListenable: selected,
                    builder: (context, sels, _) {
                      return RowSeparated(
                        mainAxisAlignment: MainAxisAlignment.end,
                        separatorBuilder: (context, index) => SizedBox(
                          width: context.appTheme.spacing.formSpacing,
                        ),
                        children: [
                          ValueListenableListener(
                            valueListenable:
                                context.read<DocumentModel>().delete,
                            onListen: () {
                              var delete =
                                  context.read<DocumentModel>().delete.value;

                              if (delete.hasError) {
                                snackBarWidget(
                                  message: '削除できませんでした。 もう一度試してください。',
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
                                  message: '正常に削除されました',
                                  prefixIcon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                );
                              }
                            },
                            child: ValueListenableBuilder(
                                valueListenable:
                                    context.read<DocumentModel>().delete,
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
                                                          DocumentModel>(),
                                                      child: AlertDialog(
                                                        title: const Text('削除確認'),
                                                        content: const Text(
                                                            '選択した書類を削除しますか？'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                const Text('キャンセル'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      DocumentModel>()
                                                                  .deleteDocument(
                                                                      sels);
                                                              Navigator.of(
                                                                      context)
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
                                        loadingColor:
                                            context.appTheme.primaryColor,
                                        child: Text(
                                          '削除する',
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                                  color: context
                                                      .appTheme.primaryColor),
                                        ),
                                      ));
                                }),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('印刷する'))
                        ],
                      );
                    }),
              ]);
        });
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<DocumentModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => documentForm(hospitalRecordId: widget.id, file: file)
                ..markAllAsTouched(),
              builder: (_, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
