import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:feature_patient/src/patient/filter_patient.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String filterText = "すべて";
  ScrollController? scrollController = ScrollController();
  ScrollController? horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                        side: BorderSide(color: context.appTheme.primaryColor)),
                  ),
                  foregroundColor:
                      MaterialStatePropertyAll(context.appTheme.primaryColor),
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
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: DataTable2(
              columnSpacing: 4,
              horizontalMargin: 16,
              minWidth: 450,
              dataRowHeight: 70,
              isVerticalScrollBarVisible: true,
              isHorizontalScrollBarVisible: true,
              scrollController: scrollController,
              horizontalScrollController: horizontalScrollController,
              headingTextStyle: const TextStyle(color: Colors.grey),
              dividerThickness: 0,
              empty: const Center(
                child: Text('Patient List'),
              ),
              columns: [
                const DataColumn2(
                  fixedWidth: 70,
                  label: SizedBox(),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Text(context.l10n.labelPatient),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Text(context.l10n.labelAgent),
                ),
                DataColumn2(
                  fixedWidth: 70,
                  label: Text(context.l10n.labelProgress),
                ),
                DataColumn2(
                  fixedWidth: 100,
                  label: Text(context.l10n.labelCaseNumber),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Text(context.l10n.labelClassification),
                ),
                DataColumn2(
                  fixedWidth: 100,
                  label: Text(context.l10n.labelEntryDate),
                ),
                DataColumn2(
                  fixedWidth: 100,
                  label: Text(context.l10n.labelExaminationDate),
                ),
                DataColumn2(
                  fixedWidth: 100,
                  label: Text(context.l10n.labelReturnDate),
                ),
                DataColumn2(
                  fixedWidth: 50,
                  label: Text(context.l10n.labelNationality),
                ),
                DataColumn2(
                  fixedWidth: 50,
                  label: Text(context.l10n.labelNameOfaDisease),
                ),
                DataColumn2(
                  fixedWidth: 50,
                  label: Text(context.l10n.labelSale),
                ),
                DataColumn2(
                  fixedWidth: 50,
                  label: Text(context.l10n.labelStaffName),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Text(context.l10n.labelAdmittedToHospital),
                ),
                DataColumn2(
                  fixedWidth: 20,
                  label: Text(context.l10n.labelNumberOfGroupMembers),
                ),
              ],
              rows: List<DataRow>.generate(
                25,
                (index) => DataRow(
                  color: MaterialStatePropertyAll(
                      index % 2 != 0 ? Colors.white : const Color(0xffEDF8F8)),
                  cells: [
                    DataCell(
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade400,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ), onTap: () {
                      context.pushRoute(
                        const DetailPatientRoute(),
                      );
                    }),
                    DataCell(
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '大瀚人力资源集团',
                            style: TextStyle(
                              color: context.appTheme.primaryColor,
                            ),
                          ),
                          const Text('張翔'),
                        ],
                      ),
                    ),
                    const DataCell(
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          '受注',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const DataCell(Text('001-C-20-1')),
                    DataCell(Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            '治療',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            '再生',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )),
                    const DataCell(Text('2020/04/22')),
                    const DataCell(Text('2020/04/22')),
                    const DataCell(Text('2020/04/22')),
                    const DataCell(Text('中国')),
                    const DataCell(Text('検診')),
                    const DataCell(Text('ガー')),
                    const DataCell(Text('ガー')),
                    DataCell(
                      Text(
                        'りんくうメディカルクリニック',
                        style: TextStyle(
                          color: context.appTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(Text('7')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
