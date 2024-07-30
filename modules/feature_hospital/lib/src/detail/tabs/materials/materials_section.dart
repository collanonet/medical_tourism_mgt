import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'material_model.dart';
import 'materials_form.dart';
import 'popup.dart';

class MaterialSection extends StatefulWidget {
  const MaterialSection({super.key, required this.id});
  final String id;
  @override
  State<MaterialSection> createState() => MaterialSectionState();
}

class MaterialSectionState extends State<MaterialSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                                width: context.appTheme.spacing.marginMedium,
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
                Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(flex: 2, child: Text('パンフレット名')),
                        Expanded(child: Text('作成者')),
                        Expanded(child: Text('発行日')),
                        Expanded(flex: 1, child: Text('共有')),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: ValueListenableBuilder(
                        valueListenable:
                            context.read<MaterialsModel>().materialsData,
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
                                        child: Text(value.requireData[index]
                                                .brochureName ??
                                            ''),
                                      ),
                                      Expanded(
                                        child: Text(
                                            value.requireData[index].author ??
                                                ''),
                                      ),
                                      Expanded(
                                        child: Text(value.requireData[index]
                                                    .dateOfIssue ==
                                                null
                                            ? ''
                                            : Dates.formShortDate(value
                                                .requireData[index]
                                                .dateOfIssue)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: value.requireData[index].share ==
                                                null
                                            ? SizedBox()
                                            : Icon(Icons.person),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  color: Colors.grey,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                '共有する',
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
                '閲覧する',
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
          ],
        ),
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
}
