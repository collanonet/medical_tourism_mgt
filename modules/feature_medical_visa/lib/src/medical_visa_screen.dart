import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature_medical_visa.gm.dart';
import 'filter_medical_visa.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'medical_visa_model.dart';

class MedicalVisaScreen extends StatefulWidget {
  const MedicalVisaScreen({super.key});

  @override
  State<MedicalVisaScreen> createState() => _MedicalVisaScreenState();
}

class _MedicalVisaScreenState extends State<MedicalVisaScreen> {
  String filterText = 'すべて';
  ScrollController? scrollController = ScrollController();
  ScrollController? horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalVisaModel>(builder: (context, model, _) {
      return Column(
        children: [
          MedicalVisaFilter(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: context.appTheme.primaryColor,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                    side: BorderSide(
                        color: context.appTheme.primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('報告済みにする'),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('取下申立書'),
                  icon: Icon(Icons.note_add_rounded),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('出国報告書'),
                  icon: Icon(Icons.note_add_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: Skeletonizer(
              enabled: model.patientData.loading,
              child: DynamicTable(
                data: TableData(
                  columns: [
                    HeaderTableData(
                      titleHeader: SizedBox(),
                    ),
                    HeaderTableData(
                      titleHeader: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    HeaderTableData(
                      titleHeader: Text('患者'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('状況'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('報告書'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('案件番号'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('同伴者'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('査証書類'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('査証発行日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('査証有効日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('滞在状況'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('来日日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('帰国日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('身元保証書発行日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('取下げ'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('備考'),
                    ),
                  ],
                  rows: (model.patientData.data?.items.length ?? 0) == 0
                      ? []
                      : List<RowTableData>.generate(
                          model.patientData.data?.items.length ?? 0,
                          (index) {
                            var item = model.patientData.data?.items[index];
                            return RowTableData(
                              onTap: () {
                                context.router.push(const MedicalVisaDetailRoute());
                              },
                              cell: [
                                Checkbox(
                                    activeColor: Theme.of(context).primaryColor,
                                    checkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    value: false,
                                    onChanged: (value) {}),
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
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item?.firstName} ${item!.familyName}',
                                      style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                                        color: context.appTheme.primaryColor,
                                      ),
                                    ),
                                    const Text('刘 伟强 / 劉 偉強 / リュウ　イーチャン'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Text(
                                        '帰国済',
                                        style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Text(
                                        '報告済',
                                        style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '001-C-20-1',
                                ),
                                Text(
                                  '1',
                                ),
                                Text(
                                  '特定活動',
                                ),
                                Text(
                                  '2020/04/22',
                                ),
                                Text(
                                  '2020/04/22',
                                ),
                                Text(
                                  '2020/06/22〜2020/07/10',
                                ),
                                Text(
                                  '2020/04/22',
                                ),
                                Text(
                                  '2020/04/22',
                                ),
                                Text(
                                  '2020/04/22',
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Text(
                                        '取下げ',
                                        style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '要望があったため',
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
