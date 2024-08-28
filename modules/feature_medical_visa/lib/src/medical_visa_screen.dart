// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../feature_medical_visa.gm.dart';
import 'filter_medical_visa.dart';
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
          const MedicalVisaFilter(),
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
                  child: const Text('報告済みにする'),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: const Text('取下申立書'),
                  icon: const Icon(Icons.note_add_rounded),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: const Text('出国報告書'),
                  icon: const Icon(Icons.note_add_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: Skeletonizer(
              enabled: model.patientData.loading,
              child: DynamicTable(
                rowsPerPage: (model.patientData.data?.items.length ?? 0) < 10
                    ? model.patientData.data?.items.length
                    : model.patientData.data?.items.length ?? 0,
                data: TableData(
                  columns: [
                    HeaderTableData(
                      titleHeader: const SizedBox(),
                    ),
                    HeaderTableData(
                      titleHeader: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('患者'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('状況'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('報告書'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('案件番号'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('同伴者'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('査証書類'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('査証発行日'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('査証有効日'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('滞在状況'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('来日日'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('帰国日'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('身元保証書発行日'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('取下げ'),
                    ),
                    HeaderTableData(
                      titleHeader: const Text('備考'),
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
                                context.router
                                    .push(const MedicalVisaDetailRoute());
                              },
                              cell: [
                                Checkbox(
                                    activeColor: Theme.of(context).primaryColor,
                                    checkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
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
                                        borderRadius: BorderRadius.circular(16),
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
                                      '${item?.firstNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.familyNameRomanized ?? '-'}',
                                      style: TextStyle(
                                        color: context.appTheme.primaryColor,
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                      ),
                                    ),
                                    Text(
                                        '${item?.firstNameChineseOrVietnamese ?? '-'} ${item?.middleNameChineseOrVietnamese ?? '-'} ${item?.familyNameChineseOrVietnamese ?? '-'} / ${item?.firstNameJapaneseForChinese ?? '-'} ${item?.middleNameJapaneseForChinese ?? '-'} ${item?.familyNameJapaneseForChinese ?? '-'} / ${item?.firstNameJapaneseForNonChinese ?? '-'} ${item?.middleNameJapaneseForNonChinese ?? '-'} ${item?.familyNameJapaneseForNonChinese ?? '-'} '),
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
                                            package: 'core_ui',
                                            color: Colors.white),
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
                                            package: 'core_ui',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '001-C-20-1',
                                ),
                                const Text(
                                  '1',
                                ),
                                const Text(
                                  '特定活動',
                                ),
                                const Text(
                                  '2020/04/22',
                                ),
                                const Text(
                                  '2020/04/22',
                                ),
                                const Text(
                                  '2020/06/22〜2020/07/10',
                                ),
                                const Text(
                                  '2020/04/22',
                                ),
                                const Text(
                                  '2020/04/22',
                                ),
                                const Text(
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
                                            package: 'core_ui',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
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
