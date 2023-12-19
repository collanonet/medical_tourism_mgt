import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'filter_web_appointment.dart';
import 'web_appointment_model.dart';

class WebAppointmentScreen extends StatelessWidget {
  const WebAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebAppointmentModel>(builder: (context, model, _) {
      return Column(
        children: [
          const WebAppointmentFilter(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Expanded(
            child: Skeletonizer(
              enabled: model.patientData.loading,
              child: DynamicTable(
                data: TableData(
                  columns: [
                    HeaderTableData(
                      flex: 2,
                      titleHeader: Text('病院名'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('状況'),
                    ),
                    HeaderTableData(
                      flex: 2,
                      titleHeader: Text('患者'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('予約日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('テストコール日'),
                    ),
                  ],
                  rows: (model.patientData.data?.items.length ?? 0) == 0
                      ? []
                      : List<RowTableData>.generate(
                          model.patientData.data?.items.length ?? 0,
                          (index) {
                            var item = model.patientData.data?.items[index];
                            return RowTableData(
                              onTap: () {},
                              cell: [
                                Text('りんくうメディカルクリニック'),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Color(0xff98A6B5),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Text(
                                        'CXL',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item?.firstName} ${item!.familyName}',
                                          style: TextStyle(
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                        ),
                                        const Text('刘 伟强 / 劉 偉強 / リュウ　イーチャン'),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '2023/08/22−2023/09/10',
                                ),
                                Text(
                                  '2023/07/05 14:30',
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
