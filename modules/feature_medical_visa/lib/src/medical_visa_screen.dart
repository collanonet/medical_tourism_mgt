// Flutter imports:
import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
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
                rowsPerPage: model.patientData.data?.items.length ?? 0,
                totalPages: model.patientData.data?.totalPages ?? 1,
                isLoading: model.patientData.loading,
                onScrollMax: () {
                  if (model.patientData.loading == false) {
                    model.fetchMorePatients();
                  }
                },
                data: TableData(
                  columns: [
                    HeaderTableData(
                      titleHeader: const SizedBox(),
                    ),
                    HeaderTableData(
                      flex: 3,
                      titleHeader: Text(context.l10n.labelPatient),
                    ),
                    HeaderTableData(
                      flex: 2,
                      titleHeader: Text(context.l10n.labelAgent),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelProgress),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelCaseNumber),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelClassification),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelEntryDate),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelExaminationDate),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelReturnDate),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelNationality),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelNameOfaDisease),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelSale),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelStaffName),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelAdmittedToHospital),
                    ),
                    HeaderTableData(
                      titleHeader: Text(context.l10n.labelNumberOfGroupMembers),
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
                                context.router.push(MedicalVisaDetailRoute(
                                  patient: item,
                                  id: item?.id,
                                ));
                              },
                              cell: [
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item?.companyAGENTS ?? '-',
                                      style: const TextStyle(
                                          color: Colors.blueGrey),
                                    ),
                                    Text(
                                        '${item?.nameInKanjiAGENTS ?? '--'} / ${item?.nameInKanaAGENTS ?? '--'}'),
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
                                      child: Text(
                                        item?.progress ?? '--',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  item?.proposalNumber ?? '--',
                                ),
                                Column(
                                  children: [
                                    Wrap(
                                      children: item?.type?.map((e) {
                                            return e == null
                                                ? const SizedBox()
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    margin:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      e,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                          }).toList() ??
                                          [],
                                    ),
                                  ],
                                ),
                                Text(
                                  Dates.formShortDate(item?.dateOfEntry),
                                ),
                                Text(
                                  Dates.formShortDate(item?.medicalDay),
                                ),
                                Text(
                                  Dates.formShortDate(item?.returnDate),
                                ),
                                Text(
                                  item?.nationality ?? '--',
                                ),
                                Text(
                                  item?.diseaseName ?? '--',
                                ),
                                Text(
                                  item?.salesStaff ?? '--',
                                ),
                                Text(
                                  item?.businessStaff ?? '--',
                                ),
                                Text(
                                  item?.acceptingHospital ?? '--',
                                  style: TextStyle(
                                    color: context.appTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item?.groupSize ?? '--',
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
