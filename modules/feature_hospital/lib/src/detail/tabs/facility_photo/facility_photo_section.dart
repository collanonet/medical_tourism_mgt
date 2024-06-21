import 'dart:js';

import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class FacilityPhotoSection extends StatefulWidget {
  const FacilityPhotoSection({super.key});

  @override
  State<FacilityPhotoSection> createState() => _FacilityPhotoSectionState();
}

class _FacilityPhotoSectionState extends State<FacilityPhotoSection> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: context.appTheme.spacing.formSpacing),
      children: [
        //Drag and drop file
        InkWell(
          onTap: () {
            filePicker().then((value) {
              debugPrint(value.toString());
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
                          debugPrint(value.toString());
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
              ...['病院名病院名', '撮影', '撮影日', '共有', ''].map((e) => DataColumn2(
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
                    'パンフレット名',
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: context.appTheme.primaryColor),
                  )),
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
                  DataCell(Icon(
                    Icons.person,
                    color: context.appTheme.primaryColor,
                  )),
                  DataCell(
                    SizedBox(
                      width: 200.0,
                      height: 300.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/200/300?random=$index',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
