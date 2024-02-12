import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_patient/src/detail_patient/overseas_medical_data/popup/summary_medical_oversea_data_screen.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showCreateWithFileDialog(context);
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
                          showCreateWithFileDialog(context);
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
          Row(
            children: [
              Checkbox(
                value: isSelectAll,
                onChanged: (value) {
                  setState(() {
                    isSelectAll = !isSelectAll;
                    if (isSelectAll) {
                      ids = List.generate(10, (index) => index.toString());
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
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              10,
              (index) => InkWell(
                onTap: () {
                  showDetailMedicalOverseaDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: ids.contains(index.toString()),
                        onChanged: (value) {
                          setState(() {
                            if (ids.contains(index.toString())) {
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
                            children: [
                              Flexible(child: Text('北京協和病院')),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.red),
                                ),
                                child: Text(
                                  '有効期限あり',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(color: Colors.red),
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: context.appTheme.primaryColor),
                            ),
                            child: Text('社内'),
                          ),
                        ],
                      )),
                      Expanded(flex: 2, child: Text('画像データ（DICOM）')),
                      Expanded(
                          child: Text(
                        'PET-CT',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: context.appTheme.primaryColor),
                      )),
                      Expanded(child: Text('2023/06/30')),
                      Expanded(
                          child: Icon(
                        Icons.qr_code_scanner,
                        color: context.appTheme.primaryColor,
                      )),
                      Expanded(child: Text('2023/06/30')),
                      Expanded(
                          child: Icon(
                        Icons.person,
                        color: context.appTheme.primaryColor,
                      )),
                      Expanded(
                          child: Icon(
                        Icons.chat,
                        color: context.appTheme.primaryColor,
                      )),
                    ],
                  ),
                ),
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
                  showSummaryDialog(context);
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
  }

  void showCreateWithUrlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ReactiveFormConfig(
          validationMessages: <String, ValidationMessageFunction>{
            ValidationMessage.required: (error) =>
                context.l10n.mgsFieldRequired,
          },
          child: ReactiveFormBuilder(
            form: () => createMedicalOverseaDataWithUrlForm(),
            builder: (context, formGroup, child) {
              return const CreateMedicalOverseaDataWithUrlScreen();
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('保存する'), // TODO: l10n 対応 (保存する) (save)
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('キャンセル'), // TODO: l10n 対応 (キャンセル) (cancel)
          ),
        ],
      ),
    );
  }

  void showCreateWithFileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ReactiveFormConfig(
          validationMessages: <String, ValidationMessageFunction>{
            ValidationMessage.required: (error) =>
                context.l10n.mgsFieldRequired,
          },
          child: ReactiveFormBuilder(
            form: () => createMedicalOverseaDataWithFileForm(),
            builder: (context, formGroup, child) {
              return const CreateMedicalOverseaDataWithFileScreen();
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('保存する'), // TODO: l10n 対応 (保存する) (save)
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('キャンセル'), // TODO: l10n 対応 (キャンセル) (cancel)
          ),
        ],
      ),
    );
  }

  void showSummaryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const SummaryMedicalOverseaDataScreen(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('コピーする'), // TODO: l10n 対応 (コピーする) (copy)
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
          ),
        ],
      ),
    );
  }

  void showDetailMedicalOverseaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const DetailMedicalOverseaDataScreen(),
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
    );
  }
}
