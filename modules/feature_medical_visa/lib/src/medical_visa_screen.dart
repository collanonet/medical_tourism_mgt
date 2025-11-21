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
import '../feature_medical_visa.gm.dart';
import 'filter_medical_visa.dart';
import 'medical_visa_model.dart';
import 'package:feature_patient/src/utils/progress_stage_helper.dart';
import 'package:feature_patient/src/widgets/progress_badge.dart';

class MedicalVisaScreen extends StatefulWidget {
  const MedicalVisaScreen({super.key});

  @override
  State<MedicalVisaScreen> createState() => _MedicalVisaScreenState();
}

class _MedicalVisaScreenState extends State<MedicalVisaScreen> {
  String filterText = 'すべて';
  ScrollController? scrollController = ScrollController();
  ScrollController? horizontalScrollController = ScrollController();
  final ValueNotifier<List<String>> selectedIds = ValueNotifier<List<String>>([]);

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
                          flex: 1,
                          titleHeader: ValueListenableBuilder<List<String>>(
                            valueListenable: selectedIds,
                            builder: (context, ids, _) {
                              final allSelected = model.patientData.data?.items.isNotEmpty == true &&
                                  ids.length == model.patientData.data!.items.length;
                              return Checkbox(
                                value: allSelected,
                                onChanged: (value) {
                                  if (value == true) {
                                    selectedIds.value = model.patientData.data?.items
                                        .map((e) => e.id ?? '')
                                        .where((id) => id.isNotEmpty)
                                        .toList() ?? [];
                                  } else {
                                    selectedIds.value = [];
                                  }
                                },
                              );
                            },
                          ),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
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
                              Text(context.l10n.labelNumberOfGroupMembers),
                              const SizedBox(width: 4),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 9, 239, 235),
                                  size: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                          ],
                          rows: (model.patientData.data?.items.length ?? 0) == 0
                          ? []
                          : List<RowTableData>.generate(
                              model.patientData.data?.items.length ?? 0,
                              (index) {
                                var item = model.patientData.data?.items[index];
                                final stage = resolveProgressStage(item?.progress);
                                return RowTableData(
                                  onTap: () {
                                    context.router.push(MedicalVisaDetailRoute(
                                      patient: item,
                                      id: item?.id,
                                    ));
                                  },
                                  cell: [
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       height: 60,
                                    //       width: 60,
                                    //       decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(16),
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
                                    ValueListenableBuilder<List<String>>(
                                      valueListenable: selectedIds,
                                      builder: (context, ids, _) {
                                        return Checkbox(
                                          value: ids.contains(item?.id ?? ''),
                                          onChanged: (value) {
                                            final currentIds = List<String>.from(ids);
                                            final itemId = item?.id ?? '';
                                            if (value == true && itemId.isNotEmpty) {
                                              if (!currentIds.contains(itemId)) {
                                                currentIds.add(itemId);
                                              }
                                            } else {
                                              currentIds.remove(itemId);
                                            }
                                            selectedIds.value = currentIds;
                                          },
                                        );
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item?.familyNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.firstNameRomanized ?? '-'}',
                                          style: TextStyle(
                                            color:
                                                context.appTheme.primaryColor,
                                            fontFamily: 'NotoSansJP',
                                            package: 'core_ui',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
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
                                            color: Colors.blueGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
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
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Wrap(
                                      spacing: 3,
                                      runSpacing: 3,
                                      children: item?.type?.map((e) {
                                            return e == null
                                                ? const SizedBox()
                                                : Container(
                                                    padding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      horizontal: 6,
                                                      vertical: 3,
                                                    ),
                                                    decoration:
                                                        BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(4),
                                                    ),
                                                    child: Text(
                                                      e,
                                                      style:
                                                          const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  );
                                          }).toList() ??
                                          [],
                                    ),
                                    Text(
                                      Dates.formShortDate(
                                          item?.receptionDate),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      Dates.formShortDate(
                                          item?.medicalDay),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      item?.nationality ?? '--',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      item?.groupSize ?? '--',
                                      style: const TextStyle(fontSize: 13),
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
      );
    });
  }
}
