import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../patient_model.dart';
import 'filter_pre_patient.dart';

class PrePatientScreen extends StatefulWidget {
  const PrePatientScreen({super.key});

  @override
  State<PrePatientScreen> createState() => _PrePatientScreenState();
}

class _PrePatientScreenState extends State<PrePatientScreen> {
  ScrollController? scrollController = ScrollController();
  ScrollController? horizontalScrollController = ScrollController();

  @override
  void initState() {
    context.read<PatientModel>().prePatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModel>(builder: (context, model, _) {
      if (model.prePatientData.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          const PrePatientFilter(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: DataTable2(
                columnSpacing: 8,
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
                  child: Text('Pre-Patient List'),
                ),
                columns: [
                  DataColumn2(
                    label: Text(context.l10n.labelAgents),
                  ),
                  DataColumn2(
                    label: Text(context.l10n.labelPatient),
                  ),
                  DataColumn2(
                    size: ColumnSize.S,
                    label: Text(context.l10n.labelDateOfBirth),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text(context.l10n.labelGender),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text(context.l10n.labelNationality),
                  ),
                  DataColumn2(
                    label: Text(context.l10n.labelClassification),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text(context.l10n.labelNameOfaDisease),
                  ),
                  const DataColumn2(
                    size: ColumnSize.L,
                    label: SizedBox(),
                  ),
                ],
                rows: model.prePatientData.data?.items.isNotEmpty == true
                    ? model.prePatientData.data!.items
                        .map(
                          (e) => DataRow(
                            // color: MaterialStatePropertyAll(index % 2 != 0
                            //     ? Colors.white
                            //     : const Color(0xffEDF8F8)),
                            cells: [
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
                                    Text(e.agents),
                                  ],
                                ),
                              ),
                              DataCell(
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'WANG MUCHEN',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Text(e.patient),
                                  ],
                                ),
                              ),
                              DataCell(Text(e.dateOfBirth.toString())),
                              DataCell(Text(e.gender)),
                              DataCell(Text(e.nationality)),
                              DataCell(Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      e.classification,
                                      style:
                                          const TextStyle(color: Colors.white),
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
                              DataCell(Text(e.nameOfDisease)),
                              DataCell(Row(
                                children: [
                                  FilledButton(
                                    onPressed: () {},
                                    child:
                                        Text(context.l10n.actionGoToRegister),
                                  ),
                                  const SizedBox(width: 16),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      context.l10n.actionDelete,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        )
                        .toList()
                    : [],
              ),
            ),
          ),
        ],
      );
    });
  }
}
