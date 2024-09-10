// Flutter imports:
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'medical_payment_details_file.dart';
import 'medical_payment_details_form.dart';
import 'medical_payment_details_model.dart';
import 'view_popup.dart';

class MedicalPaymentDetailScreen extends StatefulWidget {
  const MedicalPaymentDetailScreen({super.key, this.id});
  final String? id;

  @override
  State<MedicalPaymentDetailScreen> createState() =>
      _MedicalPaymentDetailScreenState();
}

class _MedicalPaymentDetailScreenState
    extends State<MedicalPaymentDetailScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable:
            context.read<MedicalPaymentDetailModel>().medicalPaymentData,
        builder: (context, value, child) {
          var dateFormat = DateFormat('yyyy-MM-dd');
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
                    onPressed: () {},
                    child: const Text(
                      '外部URLを追加',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
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
                    '病院名',
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
                ],
              ),
              const Divider(),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(value.data?.length ?? 0, (index) {
                  final data = value.data?[index];
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
                            },
                          ),
                          Expanded(
                            child: Text(
                                '${value.data?[index].theNameOfTheHospital}'),
                          ),
                          Expanded(
                              child: Text(
                            '${value.data?[index].documentName}',
                            style: context.textTheme.bodySmall?.copyWith(
                                color: context.appTheme.primaryColor),
                          )),
                          Expanded(
                            child: Text(dateFormat.format(
                                value.data![index].dateOfIssue as DateTime)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                            context.read<MedicalPaymentDetailModel>().delete,
                        onListen: () {
                          var delete = context
                              .read<MedicalPaymentDetailModel>()
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
                              context.read<MedicalPaymentDetailModel>().delete,
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
                                                  MedicalPaymentDetailModel>(),
                                              child: AlertDialog(
                                                title: const Text('削除確認'),
                                                content: const Text(
                                                    '選択したデータを削除しますか？'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('キャンセル'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              MedicalPaymentDetailModel>()
                                                          .deleteMaterials(
                                                              sels);
                                                      Navigator.of(context)
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
                          if (sels.isNotEmpty) {
                            showDetailDialog(
                              context,
                              context
                                  .read<MedicalPaymentDetailModel>()
                                  .medicalPaymentData
                                  .value
                                  .requireData
                                  .where((element) {
                                return sels.contains(element.id);
                              }).toList(),
                            );
                          }
                        },
                        child: const Text('サマリー用に項目を出力'),
                      ),
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
        value: context.read<MedicalPaymentDetailModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () =>
                  medicalPaymentForm(medicalRecordId: widget.id!, file: file)
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
      BuildContext context, List<MedicalPaymentResponse> datas) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: ViewPopup(datas: datas),
      ),
    );
  }
}
