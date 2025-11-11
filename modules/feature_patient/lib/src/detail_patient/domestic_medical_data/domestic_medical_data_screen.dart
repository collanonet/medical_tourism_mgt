// Flutter imports:
import 'package:flutter/material.dart';

// Dart imports:
import 'dart:html' as html;

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'create_domestic_medical_data_form.dart';
import 'domestic_medical_data_file.dart';
import 'domestic_medical_data_model.dart';
import 'view_popup.dart';

class DomesticMedicalDataScreen extends StatefulWidget {
  const DomesticMedicalDataScreen({super.key, this.id});

  final String? id;

  @override
  State<DomesticMedicalDataScreen> createState() =>
      _DomesticMedicalDataScreenState();
}

class _DomesticMedicalDataScreenState extends State<DomesticMedicalDataScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable:
            context.read<DomesticMedicalDataModel>().domesticMedicalData,
        builder: (context, value, child) {
          return Column(
            children: [
              DragTarget<List<html.File>>(
                onAccept: (files) async {
                  try {
                    final documentFile = await handleFileDrop(files);
                    if (documentFile != null) {
                      showCreateWithFileDialog(context, documentFile);
                    }
                  } catch (e) {
                    snackBarWidget(
                      message: 'ファイルのアップロードでエラーが発生しました: $e',
                      backgroundColor: Colors.red,
                      prefixIcon: const Icon(Icons.error, color: Colors.white),
                    );
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          filePicker().then((value) {
                            if (value != null) {
                              showCreateWithFileDialog(context, value);
                            }
                          });
                        },
                        child: const Text(
                          'ファイルを選択する',
                        ),
                      ),
                    ],
                  );
                },
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
                    },
                  ),
                  Expanded(
                      child: Text(
                    '入手日',
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        '病院名', // Hospital name
                        style: context.textTheme.bodySmall,
                      )),
                  Expanded(
                      child: Text(
                    'カテゴリ', // category
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '書類名', // Document name
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                    child: Text(
                      '備考欄',
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    '撮影日', // Publication date
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '入手日',
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '共有URL発行', // Shared URL issue
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '患者へ開示', // Disclosure to patient
                    style: context.textTheme.bodySmall,
                  )),
                  Expanded(
                      child: Text(
                    '他病院へ開示', // Disclosure to other hospitals
                    style: context.textTheme.bodySmall,
                  )),
                ],
              ),
              const Divider(),
              ValueListenableBuilder(
                valueListenable: context
                    .read<DomesticMedicalDataModel>()
                    .domesticMedicalData,
                builder: (context, value, child) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = value.data![index];
                      var dateFormat = DateFormat('yyyy-MM-dd');
                      return InkWell(
                        onTap: () {
                          if (item.file != null) {
                            openUrlInBrowser(fileName: item.file!);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: selected,
                                builder: (context, sels, _) {
                                  return Checkbox(
                                    value: sels.contains(item.id),
                                    onChanged: (sel) {
                                      if (sel != null) {
                                        if (sel) {
                                          selected.value = [...sels, item.id];
                                        } else {
                                          selected.value = [
                                            ...sels.where((e) => e != item.id)
                                          ];
                                        }
                                      }
                                    },
                                  );
                                },
                              ),
                              Expanded(
                                child: Text(
                                  item.acquisitionDate == null
                                      ? '-'
                                      : dateFormat
                                          .format(item.acquisitionDate as DateTime),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                            item.medicalInstitutionName ?? '')),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(item.category ?? ''),
                              ),
                              Expanded(
                                child: Text(
                                  item.documentName ?? '',
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: context.appTheme.primaryColor),
                                ),
                              ),
                              Expanded(child: Text(item.remarks ?? '')),
                              Expanded(
                                child: Text(
                                  item.dateOfIssue == null
                                      ? '-'
                                      : dateFormat
                                          .format(item.dateOfIssue as DateTime),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  item.acquisitionDate == null
                                      ? '-'
                                      : dateFormat
                                          .format(item.acquisitionDate as DateTime),
                                ),
                              ),
                              const Expanded(
                                child: Icon(Icons.person),
                              ),
                              Expanded(
                                child: Text(item.disclosureToPatient == true
                                    ? 'o'
                                    : 'x'),
                              ),
                              Expanded(
                                child: Text(
                                    item.disclosureToOtherMedicalInstitutions ==
                                            true
                                        ? 'o'
                                        : 'x'),
                              ),
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
                    itemCount: value.data?.length ?? 0,
                  );
                },
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ValueListenableBuilder(
                valueListenable: selected,
                builder: (context, sels, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableListener(
                        valueListenable:
                            context.read<DomesticMedicalDataModel>().delete,
                        onListen: () {
                          var delete = context
                              .read<DomesticMedicalDataModel>()
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
                              context.read<DomesticMedicalDataModel>().delete,
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
                                                DomesticMedicalDataModel>(),
                                            child: AlertDialog(
                                              title: const Text('削除確認'),
                                              content:
                                                  const Text('選択したデータを削除しますか？'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('キャンセル'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            DomesticMedicalDataModel>()
                                                        .deleteDomesticMedical(
                                                            sels);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('削除する'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
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
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (sels.isEmpty) {
                            return;
                          }

                          final selectedItems = context
                              .read<DomesticMedicalDataModel>()
                              .domesticMedicalData
                              .value
                              .requireData
                              .where((element) => sels.contains(element.id))
                              .toList();

                          final itemsWithFiles = selectedItems
                              .where(
                                (element) =>
                                    element.file != null &&
                                    element.file!.isNotEmpty,
                              )
                              .toList();

                          if (itemsWithFiles.isEmpty) {
                            snackBarWidget(
                              message: 'ダウンロード可能なファイルがありません',
                              backgroundColor: Colors.red,
                              prefixIcon: const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                            );
                            return;
                          }

                          for (final item in itemsWithFiles) {
                            final file = item.file!;
                            final downloadName = file.split('/').last;
                            try {
                              await downloadFile(
                                fileName: file,
                                downloadName: downloadName,
                              );
                            } catch (_) {
                              snackBarWidget(
                                message: 'ファイルのダウンロードに失敗しました',
                                backgroundColor: Colors.red,
                                prefixIcon: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              );
                              break;
                            }
                          }
                        },
                        child: const Text('ダウンロードする'),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var ids = context
                              .read<DomesticMedicalDataModel>()
                              .domesticMedicalData
                              .value;
                          var list = ids.data!
                              .where((e) => sels.contains(e.id))
                              .toList();
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: ViewAndPrintFileWidget(list
                                        .map((e) =>
                                            'https://medical-tourism-api-dev-collabonet.pixelplatforms.com/files/${e.file}')
                                        .toList()),
                                  ));
                        },
                        child: const Text(
                          '印刷する',
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<DomesticMedicalDataModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => domesticMedicalDataForm(
                  medicalRecordId: widget.id!, file: file)
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

  void showDetailDialog(
      BuildContext context, List<DomesticMedicalDataResponse> datas) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: ViewPopup(datas: datas),
      ),
    );
  }
}
