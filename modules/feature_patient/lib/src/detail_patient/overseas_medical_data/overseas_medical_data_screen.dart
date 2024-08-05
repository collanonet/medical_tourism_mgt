
import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'popup/summary_medical_oversea_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'overseas_medical_data_model.dart';
import 'popup/create_medical_oversea_data_with_file_form.dart';
import 'popup/create_medical_oversea_data_with_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'popup/create_medical_oversea_data_with_url_form.dart';
import 'popup/create_medical_oversea_data_with_url_screen.dart';
import 'popup/detail_medical_oversea_data/detail_medical_oversea_data_screen.dart';

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
                      '診療データをここにドラッグ＆ドロップ',
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
                                '発行日',
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
                                      showDetailMedicalOverseaDialog(context,data);
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
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      padding:
                                                          EdgeInsets.all(4),
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
                                                padding: EdgeInsets.all(4),
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
                                              child: data.qrCode == null
                                                  ? SizedBox()
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
                                              child: Icon(
                                            CupertinoIcons.chat_bubble_2_fill,
                                            color:
                                                context.appTheme.primaryColor,
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
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  '削除する',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              ElevatedButton(
                                onPressed: () {},
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
                                onPressed: () {
                                  showSummaryDialog(
                                      context,
                                      ids.map((e) {
                                        return value.requireData[int.parse(e)];
                                      }).toList());
                                },
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
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  createMedicalOverseaDataWithUrlForm()..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const CreateMedicalOverseaDataWithUrlScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  createMedicalOverseaDataWithFileForm(file)
                    ..markAllAsTouched(),
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

  void showDetailMedicalOverseaDialog(BuildContext context, MedicalRecordOverseaData data) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
            content: DetailMedicalOverseaDataScreen(medicalRecordOverseaData: data,),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('　共有する　'), // TODO: l10n 対応 (閉じる) (close)
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('　印刷する　'), // TODO: l10n 対応 (閉じる) (close)
              ),
            ]),
      ),
    );
  }
}
