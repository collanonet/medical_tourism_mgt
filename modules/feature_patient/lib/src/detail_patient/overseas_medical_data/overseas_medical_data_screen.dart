// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Dart imports:
import 'dart:html' as html;

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'overseas_medical_data_model.dart';
import 'popup/create_medical_oversea_data_with_file_form.dart';
import 'popup/create_medical_oversea_data_with_file_screen.dart';
import 'popup/create_medical_oversea_data_with_url_form.dart';
import 'popup/create_medical_oversea_data_with_url_screen.dart';
import 'popup/detail_medical_oversea_data/detail_medical_oversea_data_screen.dart';
import 'popup/summary_medical_oversea_data_screen.dart';

class OverseasMedicalDataScreen extends StatefulWidget {
  const OverseasMedicalDataScreen({super.key});

  @override
  State<OverseasMedicalDataScreen> createState() =>
      _OverseasMedicalDataScreenState();
}

class _OverseasMedicalDataScreenState extends State<OverseasMedicalDataScreen> {
  List<String> ids = [];
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DragTarget<List<html.File>>(
                onAccept: (files) async {
                  try {
                    final dicomFiles = await uploadDICOMFilesFromDrop(files);
                    if (dicomFiles.isNotEmpty) {
                      showCreateWithFileDialog(
                          context, dicomFiles: dicomFiles, documentFile: null);
                    }
                  } catch (e) {
                    snackBarWidget(
                      message:
                          'ファイル DICOM のアップロードでエラーが発生しました。ファイルが DICOM であることを確認してください',
                      backgroundColor: Colors.red,
                      prefixIcon: const Icon(Icons.error, color: Colors.white),
                    );
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  return InkWell(
                    onTap: () {
                      uploadDICOMFile().then((value) {
                        if (value.isNotEmpty) {
                          showCreateWithFileDialog(
                              context, dicomFiles: value, documentFile: null);
                        }
                      }).catchError((e) {
                        snackBarWidget(
                          message:
                              'ファイル DICOM のアップロードでエラーが発生しました。ファイルが DICOM であることを確認してください',
                          backgroundColor: Colors.red,
                          prefixIcon: const Icon(Icons.error, color: Colors.white),
                        );
                      });
                    },
                    child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginLarge,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_information,
                        size: 40,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      Text(
                        'DICOMデータ',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          uploadDICOMFile().then((value) {
                            if (value.isNotEmpty) {
                              showCreateWithFileDialog(
                                  context, dicomFiles: value, documentFile: null);
                            }
                          }).catchError((e) {
                            snackBarWidget(
                              message:
                                  'ファイル DICOM のアップロードでエラーが発生しました。ファイルが DICOM であることを確認してください',
                              backgroundColor: Colors.red,
                              prefixIcon:
                                  const Icon(Icons.error, color: Colors.white),
                            );
                          });
                        },
                        child: const Text(
                          'DICOMを選択',
                        ),
                      )
                    ],
                  ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: DragTarget<List<html.File>>(
                onAccept: (files) async {
                  try {
                    final documentFile = await handleFileDrop(files);
                    if (documentFile != null) {
                      showCreateWithFileDialog(
                          context, dicomFiles: null, documentFile: documentFile);
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
                  return InkWell(
                    onTap: () {
                      filePicker().then((value) {
                        if (value != null) {
                          showCreateWithFileDialog(
                              context, dicomFiles: null, documentFile: value);
                        }
                      });
                    },
                    child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginLarge,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description,
                        size: 40,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      Text(
                        '診断書・資料',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          filePicker().then((value) {
                            if (value != null) {
                              showCreateWithFileDialog(
                                  context, dicomFiles: null, documentFile: value);
                            }
                          });
                        },
                        child: const Text(
                          '診断書を選択',
                        ),
                      )
                    ],
                  ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                showCreateWithUrlDialog(context);
              },
              child: const Text(
                '外部URLを追加',
              ),
            )
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ValueListenableBuilder(
            valueListenable: context
                .read<OverseasMedicalDataModel>()
                .medicalRecordsOverseasData,
            builder: (context, value, _) {
              return value.loading
                  ? const CircularProgressIndicator.adaptive()
                  : Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isSelectAll,
                                onChanged: (_) {
                                  setState(() {
                                    isSelectAll = !isSelectAll;
                                    if (isSelectAll) {
                                      ids = List.generate(
                                          value.hasData
                                              ? value.requireData.length
                                              : 0,
                                          (index) => index.toString());
                                    } else {
                                      ids = [];
                                    }
                                  });
                                },
                              ),

                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    '病院名',
                                    style: context.textTheme.bodySmall,
                                  )),
                              Expanded(
                                  child: Text(
                                '保管場所',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'カテゴリ',
                                    style: context.textTheme.bodySmall,
                                  )),
                              Expanded(
                                  child: Text(
                                '書類名',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Text(
                                '撮影日',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Text(
                                '入手日',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'QR',
                                  style: context.textTheme.bodySmall,
                                ),
                              )),
                              Expanded(
                                  child: Text(
                                '閲覧有効期限',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  '共有',
                                  style: context.textTheme.bodySmall,
                                ),
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'コメント',
                                  style: context.textTheme.bodySmall,
                                ),
                              )),
                            ],
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView(
                              children: List.generate(
                                value.hasData ? value.requireData.length : 0,
                                (index) {
                                  final MedicalRecordOverseaData data =
                                      value.requireData[index];
                                  return InkWell(
                                    onTap: () {
                                      showDetailMedicalOverseaDialog(
                                        context,
                                        value.requireData,
                                        index,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                ids.contains(index.toString()),
                                            onChanged: (value) {
                                              setState(() {
                                                if (ids.contains(
                                                    index.toString())) {
                                                  ids.remove(index.toString());
                                                } else {
                                                  ids.add(index.toString());
                                                }
                                              });
                                            },
                                          ),

                                          Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                          data.hospitalName ??
                                                              '--')),
                                                  if (data.expirationDate !=
                                                      null) ...{
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        border: Border.all(
                                                            color: Colors.red),
                                                      ),
                                                      child: Text(
                                                        '有効期限あり',
                                                        style: context
                                                            .textTheme.bodySmall
                                                            ?.copyWith(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                    )
                                                  }
                                                ],
                                              )),
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: context.appTheme
                                                          .primaryColor),
                                                ),
                                                child: Text(
                                                  '社内',
                                                  style: context
                                                      .textTheme.bodySmall
                                                      ?.copyWith(
                                                          color: context
                                                              .appTheme
                                                              .primaryColor),
                                                ),
                                              )
                                            ],
                                          )),
                                          Expanded(
                                              flex: 2,
                                              child:
                                                  Text(data.category ?? '--')),
                                          Expanded(
                                              child: Text(
                                            data.documentName ?? '--',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                                    color: context
                                                        .appTheme.primaryColor),
                                          )),
                                          Expanded(
                                              child: Text(data.issueDate != null
                                                  ? Dates.formShortDate(
                                                      data.issueDate)
                                                  : '--')),
                                          Expanded(
                                              child: Text(data.acquisitionDate != null
                                                  ? Dates.formShortDate(
                                                      data.acquisitionDate)
                                                  : '--')),
                                          Expanded(
                                              child: data.qrCode == null
                                                  ? const SizedBox()
                                                  : Icon(
                                                      Icons
                                                          .qr_code_scanner_rounded,
                                                      color: context.appTheme
                                                          .primaryColor,
                                                    )),
                                          Expanded(
                                              child: Text(
                                                  data.expirationDate != null
                                                      ? Dates.formShortDate(
                                                          data.expirationDate)
                                                      : '--')),
                                          Expanded(
                                              child: Icon(
                                            Icons.person,
                                            color:
                                                context.appTheme.primaryColor,
                                          )),
                                          Expanded(
                                              child: Row(
                                            children: [
                                              if (data.commentDicomFile !=
                                                      null &&
                                                  data.commentDicomFile!
                                                      .isNotEmpty)
                                                Icon(
                                                  CupertinoIcons
                                                      .chat_bubble_2_fill,
                                                  color: context
                                                      .appTheme.primaryColor,
                                                ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: context
                                      .watch<OverseasMedicalDataModel>()
                                      .delete,
                                  builder: (context, d, child) {
                                    return ElevatedButton(
                                        onPressed: ids.isNotEmpty
                                            ? () async {
                                                try {
                                                  List<String> mongoseIds =
                                                      ids.map((e) {
                                                    return value
                                                        .requireData[
                                                            int.parse(e)]
                                                        .id;
                                                  }).toList();
                                                  await context
                                                      .read<
                                                          OverseasMedicalDataModel>()
                                                      .deleteMedicalRecordOverseaData(
                                                          mongoseIds);
                                                  ids = [];
                                                } catch (e) {
                                                  snackBarWidget(message: '$e');
                                                }
                                              }
                                            : null,
                                        child: WithLoadingButton(
                                          isLoading: d.loading,
                                          child: const Text(
                                            '削除する',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ));
                                  }),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              ElevatedButton(
                                onPressed: ids.isNotEmpty
                                    ? () async {
                                        var list = ids.map((e) {
                                          return value
                                              .requireData[int.parse(e)];
                                        }).toList();
                                        showDetailMedicalOverseaDialog(
                                          context,
                                          list,
                                          0,
                                        );
                                      }
                                    : null,
                                child: const Text(
                                  '印刷する',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              ElevatedButton(
                                onPressed: ids.isNotEmpty
                                    ? () {
                                        showSummaryDialog(
                                            context,
                                            ids.map((e) {
                                              return value
                                                  .requireData[int.parse(e)];
                                            }).toList());
                                      }
                                    : null,
                                child: const Text(
                                  'サマリー用に項目を出力',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
            }),
      ],
    );
  }

  void showCreateWithUrlDialog(BuildContext context) {
    final model = context.read<OverseasMedicalDataModel>();
    final existingHospitals = model.medicalRecordsOverseasData.value.hasData
        ? model.medicalRecordsOverseasData.value.requireData
            .map((e) => e.hospitalName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList()
        : <String>[];

    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: model,
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => createMedicalOverseaDataWithUrlForm(
                existingHospitals,
              )..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const CreateMedicalOverseaDataWithUrlScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showCreateWithFileDialog(
    BuildContext context, {
    List<DicomDetailResponse>? dicomFiles,
    FileSelect? documentFile,
  }) {
    final model = context.read<OverseasMedicalDataModel>();
    final existingHospitals = model.medicalRecordsOverseasData.value.hasData
        ? model.medicalRecordsOverseasData.value.requireData
            .map((e) => e.hospitalName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList()
        : <String>[];
    
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: model,
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => createMedicalOverseaDataWithFileForm(
                dicomFiles,
                documentFile,
                existingHospitals,
              )..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const CreateMedicalOverseaDataWithFileScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showSummaryDialog(
      BuildContext context, List<MedicalRecordOverseaData> data) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: SummaryMedicalOverseaDataScreen(
            data: data,
          ),
        ),
      ),
    );
  }

  void showDetailMedicalOverseaDialog(
    BuildContext context,
    List<MedicalRecordOverseaData> data,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
            content: DetailMedicalOverseaDataScreen(
              medicalRecordOverseaDatas: data,
              index: index,
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('　印刷する　'), // TODO: l10n 対応 (閉じる) (close)
              ),
            ]),
      ),
    );
  }
}
