
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReservationHistorySection extends StatefulWidget {
  const ReservationHistorySection({super.key});

  @override
  State<ReservationHistorySection> createState() =>
      _ReservationHistorySectionState();
}

class _ReservationHistorySectionState extends State<ReservationHistorySection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: context.appTheme.spacing.formSpacing),
        children: [
          Text(
            '予約履歴',
            style: context.textTheme.bodyLarge,
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
              headingTextStyle: const TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  color: Colors.grey),
              dividerThickness: 0,
              columns: [
                ...['状況', '患者', '予約日', 'テストコール'].map((e) => DataColumn2(
                      label: Text(
                        e,
                        style: context.textTheme.bodySmall,
                      ),
                    )),
              ],
              rows: List.generate(6, (index) {
                return DataRow2(
                  cells: [
                    DataCell(RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.formSpacing,
                      ),
                      children: [
                        Text(
                          (index + 1).toString().padLeft(3, '0'),
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: context.appTheme.primaryColor),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: context.appTheme.primaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '予約済',
                            style: context.textTheme.bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                    DataCell(RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.formSpacing,
                      ),
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.network(
                            'https://picsum.photos/200/300?random=$index',
                            fit: BoxFit.cover,
                          ),
                        ),
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Text(
                                'LIU　WEIQIANG',
                                style: context.textTheme.bodyLarge!.copyWith(
                                    color: context.appTheme.primaryColor),
                              ),
                              Text(
                                '刘 伟强/ 劉 偉強/ リュウ　イーチャン',
                                style: context.textTheme.bodyMedium,
                              )
                            ])
                      ],
                    )),
                    const DataCell(Text('2023/08/22−2023/09/10')),
                    const DataCell(Text('2023/07/05 14:30')),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
