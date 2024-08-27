import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../overseas_medical_data/popup/detail_medical_oversea_data/detail_medical_oversea_data_screen.dart';
import 'create_domestic_medical_data_form.dart';
import 'domestic_medical_data_file.dart';
import 'domestic_medical_data_model.dart';

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
      child: Column(
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
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: false,
                onChanged: (value) {
                  selected.value = [];
                },
              ),
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
                '発行日', // Publication date
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
          Divider(),
          ValueListenableBuilder(
              valueListenable:
                  context.read<DomesticMedicalDataModel>().domesticMedicalData,
              builder: (context, value, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = value.data![index];
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Colors.grey),
                                ),
                                checkColor: Colors.white,
                                value: false,
                                onChanged: (value) {},
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Flexible(
                                          child: Text(item.category ?? '')),
                                    ],
                                  )),
                              const Expanded(child: Text('検査結果報告書')),
                              Expanded(
                                  child: Text(
                                'MRI ',
                                style: context.textTheme.bodySmall?.copyWith(
                                    color: context.appTheme.primaryColor),
                              )),
                              Expanded(child: Text('2023/06/30')),
                              Expanded(
                                  child: Icon(
                                Icons.qr_code_scanner,
                                color: context.appTheme.primaryColor,
                              )),
                              Expanded(child: Text('○')),
                              Expanded(child: Text('×')),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 0.5,
                      );
                    },
                    itemCount: value.data?.length ?? 0);
              }),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  '削除する',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '共有する',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  showDetailMedicalOverseaDialog(context);
                },
                child: const Text(
                  '閲覧する',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '印刷する',
                ),
              )
            ],
          ),
        ],
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
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
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
