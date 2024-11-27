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
import 'filter_patient.dart';
import 'patient_model.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String filterText = 'all';
  ScrollController? scrollController = ScrollController();
  ScrollController? horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModel>(
      builder: (context, model, _) {
        return Column(
          children: [
            const PatientFilter(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                        flex: 2,
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelPatient),
                            SizedBox(
                                width: context.appTheme.spacing.marginMedium),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelProgress),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Text(context.l10n.labelCaseNumber),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelClassification),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelEntryDate),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelExaminationDate),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelReturnDate),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelNationality),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 9, 239, 235),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelNameOfaDisease),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelSale),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTableData(
                        titleHeader: Row(
                          children: [
                            Text(context.l10n.labelStaffName),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
                                ),
                              ),
                            )
                          ],
                        ),
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
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       height: 60,
                                  //       width: 60,
                                  //       decoration: BoxDecoration(
                                  //         borderRadius:
                                  //             BorderRadius.circular(16),
                                  //         color: Colors.grey.shade300,
                                  //       ),
                                  //       child: const Icon(
                                  //         Icons.person,
                                  //         color: Colors.white,
                                  //         size: 50,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
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
              ),
            ),
          ],
        );
      },
    );
  }
}
