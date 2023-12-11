import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../feature_patient.dart';
import 'filter_patient.dart';
import 'package:flutter/material.dart';

import 'patient_model.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String filterText = 'すべて';
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
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
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
                        value: context.l10n.labelOrdersOnly,
                        label: Text(
                          context.l10n.labelOrdersOnly,
                          style: TextStyle(
                            color: filterText == context.l10n.labelOrdersOnly
                                ? Colors.white
                                : context.appTheme.primaryColor,
                          ),
                        ),
                        tooltip: context.l10n.labelOrdersOnly,
                      ),
                      ButtonSegment<String>(
                        value: context.l10n.labelCXL,
                        label: Text(
                          context.l10n.labelCXL,
                          style: TextStyle(
                            color: filterText == context.l10n.labelCXL
                                ? Colors.white
                                : context.appTheme.primaryColor,
                          ),
                        ),
                        tooltip: context.l10n.labelCXL,
                      ),
                      ButtonSegment<String>(
                          value: context.l10n.labelAll,
                          label: Text(
                            context.l10n.labelAll,
                            style: TextStyle(
                              color: filterText == context.l10n.labelAll
                                  ? Colors.white
                                  : context.appTheme.primaryColor,
                            ),
                          ),
                          tooltip: context.l10n.labelAll),
                    ],
                    selected: <String>{filterText},
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        filterText = newSelection.first;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () {},
                    child: Text(context.l10n.actionNewRegistration),
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
                        titleHeader: const SizedBox(),
                      ),
                      HeaderTableData(
                        titleHeader: Text(context.l10n.labelPatient),
                      ),
                      HeaderTableData(
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
                                  context.pushRoute(
                                    DetailPatientRoute(
                                      patient: item,
                                      id: item.id,
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
                                              BorderRadius.circular(4),
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
                                        '${item?.firstName} ${item!.familyName}',
                                        style: TextStyle(
                                          color: context.appTheme.primaryColor,
                                        ),
                                      ),
                                      const Text('--'),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'WANG MUCHEN',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Text('王　沐宸'),
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
                                          '受注',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '001-C-20-1',
                                  ),
                                  Column(
                                    children: [
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: const Text(
                                              '治療',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Colors.purple,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: const Text(
                                              '再生',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
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
                                  Text(
                                    '中国',
                                  ),
                                  Text(
                                    '検診',
                                  ),
                                  Text(
                                    'ガー',
                                  ),
                                  Text(
                                    'ガー',
                                  ),
                                  Text(
                                    'りんくうメディカルクリニック',
                                    style: TextStyle(
                                      color: context.appTheme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '7',
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
