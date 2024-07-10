import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return SingleChildScrollView(
      child: ColumnSeparated(
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: context.appTheme.spacing.formSpacing),
        children: [
          // Memo
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Make as a copy button
              ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
                child: const Text(
                  '保存する',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          //Drag and drop file
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
                            if (value != null) {}
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
          // InkWell(
          //   onTap: () {
          //     filePicker().then((value) {
          //       debugPrint(value.toString());
          //     });
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(
          //       context.appTheme.spacing.marginExtraLarge,
          //     ),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(
          //         context.appTheme.spacing.borderRadiusMedium,
          //       )),
          //       border: Border.all(
          //         color: context.appTheme.primaryColor,
          //       ),
          //     ),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           Icons.copy_all_rounded,
          //           size: 50,
          //           color: context.appTheme.primaryColor,
          //         ),
          //         SizedBox(
          //           width: context.appTheme.spacing.marginMedium,
          //         ),
          //         Column(
          //           children: [
          //             Text(
          //               'パンフレットや資料をここにドラッグ＆ドロップ',
          //               style: context.textTheme.bodySmall?.copyWith(
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             SizedBox(
          //               height: context.appTheme.spacing.marginMedium,
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 filePicker().then((value) {
          //                   debugPrint(value.toString());
          //                 });
          //               },
          //               child: const Text(
          //                 'またはファイルを選択する',
          //               ),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 500,
            child: DataTable2(
              columnSpacing: 8,
              horizontalMargin: 16,
              minWidth: 450,
              dataRowHeight: 70,
              isVerticalScrollBarVisible: true,
              isHorizontalScrollBarVisible: true,
              showCheckboxColumn: true,
              onSelectAll: (bool? value) {},
              datarowCheckboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.resolveWith(
                    (states) => context.appTheme.primaryColor),
              ),
              headingTextStyle: const TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  color: Colors.grey),
              dividerThickness: 0,
              columns: [
                ...[
                  'パンフレット名',
                  '作成者',
                  '発行日',
                  '共有',
                ].map((e) => DataColumn2(
                      label: Text(
                        e,
                        style: context.textTheme.bodySmall,
                      ),
                    )),
              ],
              rows: List.generate(6, (index) {
                return DataRow2(
                  selected: false,
                  onSelectChanged: (value) => debugPrint('row selected'),
                  cells: [
                    const DataCell(Text('パンフレット名')),
                    DataCell(Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            '作成者',
                            style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    )),
                    const DataCell(Text('2021-09-01')),
                    const DataCell(Icon(Icons.person)),
                  ],
                );
              }).toList(),
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
      ),
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
