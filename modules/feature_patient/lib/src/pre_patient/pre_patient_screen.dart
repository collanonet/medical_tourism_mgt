import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data_table_2/data_table_2.dart';
import 'pre_patient_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  Widget build(BuildContext context) {
    return Consumer<PrePatientModel>(builder: (context, model, _) {
      return Column(
        children: [
          const PrePatientFilter(),
          Expanded(
            child: Skeletonizer(
              enabled: model.prePatientData.loading,
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
                      ? List.generate(model.prePatientData.data!.items.length,
                          (index) {
                          final item = model.prePatientData.data!.items[index];
                          return DataRow(
                            color: MaterialStatePropertyAll(index % 2 != 0
                                ? Colors.white
                                : const Color(0xffEDF8F8)),
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
                                    Text('${item.agents}'),
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
                                    Text('${item.patient}'),
                                  ],
                                ),
                              ),
                              DataCell(Text(item.dateOfBirth.toString())),
                              DataCell(Text('${item.gender}')),
                              DataCell(Text('${item.nationality}')),
                              DataCell(Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      '${item.classification}',
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
                              DataCell(Text('${item.nameOfDisease}')),
                              DataCell(item.isDeleted
                                  ? FilledButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.grey,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(context.l10n.actionDeleted),
                                    )
                                  : Row(
                                      children: [
                                        FilledButton(
                                          onPressed: model.deletePrePatientData
                                                      .loading &&
                                                  model.prePatientId == item.id
                                              ? null
                                              : () {
                                                  model.postPatient(
                                                      PatientRequest(
                                                    dateOfBirth:
                                                        item.dateOfBirth,
                                                    age: 1,
                                                    gender: item.gender,
                                                    familyName: item.patient,
                                                    firstName: item.patient,
                                                    prePatient: item.id,
                                                  ));
                                                },
                                          child: model.deletePrePatientData
                                                      .loading &&
                                                  model.prePatientId == item.id
                                              ? const CircularProgressIndicator()
                                              : Text(context
                                                  .l10n.actionGoToRegister),
                                        ),
                                        const SizedBox(width: 16),
                                        OutlinedButton(
                                          onPressed:
                                              model.deletePrePatientData.loading
                                                  ? null
                                                  : () {
                                                      model.deletePrePatient(
                                                          item.id);
                                                    },
                                          child: model.deletePrePatientData
                                                      .loading &&
                                                  model.deletePrePatientData
                                                          .data ==
                                                      item.id
                                              ? const CircularProgressIndicator()
                                              : Text(
                                                  context.l10n.actionDelete,
                                                ),
                                        ),
                                      ],
                                    )),
                            ],
                          );
                        }).toList()

                      // model.prePatientData.data!.items
                      //         .map(
                      //           (e) => DataRow(
                      //             // color: MaterialStatePropertyAll(index % 2 != 0
                      //             //     ? Colors.white
                      //             //     : const Color(0xffEDF8F8)),
                      //             cells: [
                      //               DataCell(
                      //                 Column(
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       '大瀚人力资源集团',
                      //                       style: TextStyle(
                      //                         color: context.appTheme.primaryColor,
                      //                       ),
                      //                     ),
                      //                     Text(e.agents),
                      //                   ],
                      //                 ),
                      //               ),
                      //               DataCell(
                      //                 Column(
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     const Text(
                      //                       'WANG MUCHEN',
                      //                       style: TextStyle(
                      //                         color: Colors.blueGrey,
                      //                       ),
                      //                     ),
                      //                     Text(e.patient),
                      //                   ],
                      //                 ),
                      //               ),
                      //               DataCell(Text(e.dateOfBirth.toString())),
                      //               DataCell(Text(e.gender)),
                      //               DataCell(Text(e.nationality)),
                      //               DataCell(Row(
                      //                 children: [
                      //                   Container(
                      //                     padding: const EdgeInsets.symmetric(
                      //                         horizontal: 8, vertical: 4),
                      //                     decoration: BoxDecoration(
                      //                         color: Colors.blue,
                      //                         borderRadius:
                      //                             BorderRadius.circular(4)),
                      //                     child: Text(
                      //                       e.classification,
                      //                       style: const TextStyle(
                      //                           color: Colors.white),
                      //                     ),
                      //                   ),
                      //                   const SizedBox(width: 4),
                      //                   Container(
                      //                     padding: const EdgeInsets.symmetric(
                      //                         horizontal: 8, vertical: 4),
                      //                     decoration: BoxDecoration(
                      //                         color: Colors.purple,
                      //                         borderRadius:
                      //                             BorderRadius.circular(4)),
                      //                     child: const Text(
                      //                       '再生',
                      //                       style: TextStyle(color: Colors.white),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )),
                      //               DataCell(Text(e.nameOfDisease)),
                      //               DataCell(e.isDeleted
                      //                   ? FilledButton(
                      //                       style: ButtonStyle(
                      //                         backgroundColor:
                      //                             MaterialStateProperty.all(
                      //                           Colors.grey,
                      //                         ),
                      //                       ),
                      //                       onPressed: () {},
                      //                       child: Text(context.l10n.actionDeleted),
                      //                     )
                      //                   : Row(
                      //                       children: [
                      //                         FilledButton(
                      //                           onPressed: () {},
                      //                           child: Text(context
                      //                               .l10n.actionGoToRegister),
                      //                         ),
                      //                         const SizedBox(width: 16),
                      //                         OutlinedButton(
                      //                           onPressed: model
                      //                                   .deletePrePatientData
                      //                                   .loading
                      //                               ? null
                      //                               : () {
                      //                                   model
                      //                                       .deletePrePatient(e.id);
                      //                                 },
                      //                           child: model.deletePrePatientData
                      //                                       .loading &&
                      //                                   model.deletePrePatientData
                      //                                           .data ==
                      //                                       e.id
                      //                               ? const CircularProgressIndicator()
                      //                               : Text(
                      //                                   context.l10n.actionDelete,
                      //                                 ),
                      //                         ),
                      //                       ],
                      //                     )),
                      //             ],
                      //           ),
                      //         )
                      //         .toList()
                      : [],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
