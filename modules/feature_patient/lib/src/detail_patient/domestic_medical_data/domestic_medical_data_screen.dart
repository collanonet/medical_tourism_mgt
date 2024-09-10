// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../overseas_medical_data/popup/detail_medical_oversea_data/detail_medical_oversea_data_screen.dart';
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
                        onTap: () {},
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
                                  dateFormat
                                      .format(item.dateOfIssue as DateTime),
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
                        onPressed: () {
                          if (sels.isNotEmpty) {
                            showDetailDialog(
                              context,
                              context
                                  .read<DomesticMedicalDataModel>()
                                  .domesticMedicalData
                                  .value
                                  .requireData
                                  .where((element) {
                                return sels.contains(element.id);
                              }).toList(),
                            );
                          }
                        },
                        child: const Text('閲覧する'),
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
              child: const Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('　印刷する　'), // TODO: l10n 対応 (閉じる) (close)
            ),
          ]),
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
