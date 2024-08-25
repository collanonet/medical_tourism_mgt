import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'material_model.dart';
import 'materials_form.dart';
import 'popup.dart';
import 'view_popup.dart';

class MaterialSection extends StatefulWidget {
  const MaterialSection({super.key, required this.id});
  final String id;
  @override
  State<MaterialSection> createState() => MaterialSectionState();
}

class MaterialSectionState extends State<MaterialSection> {
  final formatter = InputFormatter();
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: context.read<MaterialsModel>().materialsData,
              builder: (context, value, _) {
                return SingleChildScrollView(
                  child: ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: context.appTheme.spacing.formSpacing),
                    children: [
                      // Memo
                      ValueListenableBuilder(
                        valueListenable:
                            context.read<MaterialsModel>().memoMaterialsData,
                        builder: (context, value, _) {
                          return Skeletonizer(
                            enabled: value.loading,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'メモ',
                                    ),
                                    ReactiveTextField(
                                      formControlName: 'memo',
                                      maxLines: 6,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Make as a copy button
                                    ElevatedButton(
                                      onPressed: () {
                                        // todo: copy memo to clipboard
                                      },
                                      child: const Text(
                                        'コピーする',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    // Save button
                                    ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<MaterialsModel>()
                                            .submitMemoData(formGroup);
                                      },
                                      child: const Text(
                                        '保存する',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      Column(
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'パンフレット、資料をここにドラッグ＆ドロップ',
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          filePicker().then((value) {
                                            if (value != null) {
                                              showCreateWithFileDialog(
                                                  context, value);
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
                              Expanded(flex: 2, child: Text('パンフレット名')),
                              Expanded(child: Text('作成者')),
                              Expanded(child: Text('発行日')),
                              Expanded(child: Text('共有')),
                            ],
                          ),
                          const Divider(
                            height: 2,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Color(0xff98A6B5),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                                                  ...sels.where(
                                                      (e) => e != data?.id)
                                                ];
                                              }
                                            }
                                          },
                                        );
                                      }),
                                  Expanded(
                                    flex: 2,
                                    child: Text(data?.brochureName ?? ''),
                                  ),
                                  Expanded(
                                    child: Text(data?.author ?? ''),
                                  ),
                                  Expanded(
                                    child: Text(data?.dateOfIssue == null
                                        ? ''
                                        : Dates.formShortDate(
                                            data?.dateOfIssue)),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: data?.share == null
                                        ? SizedBox()
                                        : Icon(Icons.person),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                color: Colors.grey,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder(
            valueListenable: selected,
            builder: (context, sels, _) {
              return RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16);
                },
                children: [
                  Spacer(),
                  ValueListenableListener(
                    valueListenable: context.read<MaterialsModel>().delete,
                    onListen: () {
                      var delete = context.read<MaterialsModel>().delete.value;

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
                        valueListenable: context.read<MaterialsModel>().delete,
                        builder: (context, value, _) {
                          return OutlinedButton(
                              onPressed: sels.isEmpty || value.loading
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Provider.value(
                                              value: context
                                                  .read<MaterialsModel>(),
                                              child: AlertDialog(
                                                title: Text("削除確認"),
                                                content:
                                                    Text("選択したデータを削除しますか？"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("キャンセル"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              MaterialsModel>()
                                                          .deleteMaterials(
                                                              sels);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("削除する"),
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
                                  "削除する",
                                  style: context.textTheme.labelLarge?.copyWith(
                                      color: context.appTheme.primaryColor),
                                ),
                              ));
                        }),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("共有する"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (sels.isNotEmpty) {
                        showDetailDialog(
                          context,
                          context
                              .read<MaterialsModel>()
                              .materialsData
                              .value
                              .requireData
                              .where((element) {
                            return sels.contains(element.id);
                          }).toList(),
                        );
                      }
                    },
                    child: Text("閲覧する"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("印刷する"),
                  ),
                ],
              );
            }),
      ],
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<MaterialsModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () => materialsForm(hospitalRecordId: widget.id, file: file)
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
      BuildContext context, List<MaterialHospitalResponse> datas) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: ViewPopup(datas: datas),
      ),
    );
  }
}
