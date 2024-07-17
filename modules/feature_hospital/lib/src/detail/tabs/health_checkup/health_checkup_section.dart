import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'health_checkup_file.dart';
import 'health_checkup_form.dart';
import 'health_checkup_model.dart';

class HealthCheckupSection extends StatefulWidget {
  const HealthCheckupSection({super.key, required this.id});
  final String id;

  @override
  State<HealthCheckupSection> createState() => _HealthCheckupSectionState();
}

class _HealthCheckupSectionState extends State<HealthCheckupSection> {
  @override
  Widget build(BuildContext context) {
    HealthResponse? data;
    return ColumnSeparated(
        separatorBuilder: (context, index) => SizedBox(
              height: context.appTheme.spacing.formSpacing,
            ),
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
                image: DecorationImage(image: NetworkImage(data!.uploadFile.toString()))
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
                        'パンフレットや資料をここにドラッグ＆ドロップ',
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

          Expanded(
            child: DataTable2(
              columnSpacing: 16,
              horizontalMargin: 16,
              minWidth: 450,
              dataRowHeight: 70,
              border: const TableBorder(
                horizontalInside: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
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
                ...['ファイル名ファイル名', '更新日', ''].map((e) => DataColumn2(
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
                    DataCell(Text(
                      '吹田徳洲会病院　人間ドック検査項目一覧表',
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.appTheme.primaryColor),
                    )),
                    const DataCell(Text('2023/06/30')),
                    DataCell(ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'エクセルを開く',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ],
                );
              }),
          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
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
          ),
        ]);
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<HealthModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  healthCheckupForm(hospitalRecordId: widget.id, file: file)
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
