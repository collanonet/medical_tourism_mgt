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
import '../utils/progress_stage_helper.dart';
import '../widgets/progress_badge.dart';

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
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 1600,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Skeletonizer(
                          enabled: model.patientData.loading,
                          child: DynamicTable(
                            rowsPerPage:
                                model.patientData.data?.items.length ?? 0,
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
                                  flex: 1,
                                  titleHeader: const SizedBox(),
                                ),
                                HeaderTableData(
                                  flex: 2,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelPatient),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color.fromARGB(
                                                255, 9, 239, 235),
                                            size: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 2,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelAgent),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 2,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelProgress),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelCaseNumber),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelClassification),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      const Text('受付日'),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      const Text('受診日'),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      Text(context.l10n.labelNationality),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                HeaderTableData(
                                  flex: 1,
                                  titleHeader: Row(
                                    children: [
                                      Text(context
                                          .l10n.labelNumberOfGroupMembers),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color.fromARGB(
                                              255, 9, 239, 235),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              rows: (model.patientData.data?.items.length ??
                                          0) ==
                                      0
                                  ? []
                                  : List<RowTableData>.generate(
                                      model.patientData.data?.items.length ??
                                          0,
                                      (index) {
                                        final item = model.patientData.data
                                            ?.items[index];
                                        final stage = resolveProgressStage(
                                            item?.progress);
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
                                            const SizedBox(width: 12),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${item?.familyNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.firstNameRomanized ?? '-'}',
                                                  style: TextStyle(
                                                    color: context.appTheme
                                                        .primaryColor,
                                                    fontFamily: 'NotoSansJP',
                                                    package: 'core_ui',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  '${item?.familyNameChineseOrVietnamese ?? '-'} ${item?.middleNameChineseOrVietnamese ?? '-'} ${item?.firstNameChineseOrVietnamese ?? '-'} / ${item?.familyNameJapaneseForChinese ?? '-'} ${item?.middleNameJapaneseForChinese ?? '-'} ${item?.firstNameJapaneseForChinese ?? '-'} / ${item?.familyNameJapaneseForNonChinese ?? '-'} ${item?.middleNameJapaneseForNonChinese ?? '-'} ${item?.firstNameJapaneseForNonChinese ?? '-'} ',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
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
                                                  item?.companyAGENTS ?? '-',
                                                  style: const TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  '${item?.nameInKanjiAGENTS ?? '--'} / ${item?.nameInKanaAGENTS ?? '--'}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: ProgressBadge(
                                                stage: stage,
                                                maxWidth: 220,
                                              ),
                                            ),
                                            Text(
                                              item?.proposalNumber ?? '--',
                                              style: const TextStyle(
                                                  fontSize: 13),
                                            ),
                                            Wrap(
                                              spacing: 3,
                                              runSpacing: 3,
                                              children:
                                                  item?.type?.map((e) {
                                                        return e == null
                                                            ? const SizedBox()
                                                            : Container(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                  horizontal:
                                                                      6,
                                                                  vertical:
                                                                      3,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .blueGrey,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          4),
                                                                ),
                                                                child: Text(
                                                                  e,
                                                                  style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                                ),
                                                              );
                                                      }).toList() ??
                                                      [],
                                            ),
                                            Text(
                                              Dates.formShortDate(
                                                  item?.receptionDate),
                                              style: const TextStyle(
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              Dates.formShortDate(
                                                  item?.medicalDay),
                                              style: const TextStyle(
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              item?.nationality ?? '--',
                                              style: const TextStyle(
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              item?.groupSize ?? '--',
                                              style: const TextStyle(
                                                  fontSize: 13),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
