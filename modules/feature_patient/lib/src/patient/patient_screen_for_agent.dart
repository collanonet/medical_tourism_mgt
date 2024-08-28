// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../feature_patient.dart';
import 'filter_patient_for_agent.dart';
import 'patient_model.dart';

class PatientScreenForAgent extends StatefulWidget {
  const PatientScreenForAgent({super.key});

  @override
  State<PatientScreenForAgent> createState() => _PatientScreenForAgentState();
}

class _PatientScreenForAgentState extends State<PatientScreenForAgent> {
  String filterText = 'all';
  ScrollController? horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModel>(
      builder: (context, model, _) {
        return Skeletonizer(
          enabled: model.patientData.loading,
          child: Column(
            children: [
              const PatientFilterForAgent(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      onPressed: () {
                        context.pushRoute(const PrePatientRoute());
                      },
                      child: Text(context.l10n.actionListOfPreMembers),
                    ),
                    const Spacer(),
                    SegmentedButton<String>(
                      showSelectedIcon: false,
                      style: ButtonStyle(
                        enableFeedback: true,
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                  color: context.appTheme.primaryColor)),
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                            context.appTheme.primaryColor),
                        side: MaterialStatePropertyAll(
                          BorderSide(color: context.appTheme.primaryColor),
                        ),
                      ),
                      segments: <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: '受注',
                          label: Text(
                            '受注のみ',
                            style: TextStyle(
                              color: filterText == '受注'
                                  ? Colors.white
                                  : context.appTheme.primaryColor,
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                          tooltip: context.l10n.labelOrdersOnly,
                        ),
                        ButtonSegment<String>(
                          value: 'CXL',
                          label: Text(
                            'CXL',
                            style: TextStyle(
                              color: filterText == 'CXL'
                                  ? Colors.white
                                  : context.appTheme.primaryColor,
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                            ),
                          ),
                          tooltip: context.l10n.labelCXL,
                        ),
                        ButtonSegment<String>(
                            value: 'all',
                            label: Text(
                              context.l10n.labelAll,
                              style: TextStyle(
                                color: filterText == 'all'
                                    ? Colors.white
                                    : context.appTheme.primaryColor,
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                            tooltip: context.l10n.labelAll),
                      ],
                      selected: <String>{filterText},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          filterText = newSelection.first;
                        });
                        if (newSelection.first == 'all') {
                          context.read<PatientModel>().patients();
                        } else {
                          context
                              .read<PatientModel>()
                              .patients(progress: newSelection.first);
                        }
                      },
                    ),
                    const SizedBox(width: 16),
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
                      onPressed: () {
                        context.router.push(DetailPatientRoute());
                      },
                      child: Text(context.l10n.actionNewRegistration),
                    ),
                  ],
                ),
              ),
              DynamicTable(
                enableScroll: false,
                rowsPerPage: (model.patientData.data?.items.length ?? 0) < 10
                    ? model.patientData.data?.items.length
                    : 10,
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
                      titleHeader:
                          Text(context.l10n.labelNumberOfGroupMembers),
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
                                context.router.push(
                                  DetailPatientRoute(
                                    patient: item,
                                    id: item?.id,
                                  ),
                                );
                              },
                              cell: [
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                                        const EdgeInsets.all(
                                                            4),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            4),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(4),
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
            ],
          ),
        );
      },
    );
  }
}
