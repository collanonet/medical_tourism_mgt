import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_patient/feature_patient.gm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../feature_web_appointment.gm.dart';
import 'filter_web_appointment.dart';
import 'web_appointment_model.dart';

class WebAppointmentScreen extends StatelessWidget {
  const WebAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WebAppointmentFilter(),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
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
                side:
                    BorderSide(color: context.appTheme.primaryColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                context.router.push(WebAppointmentDetailRoute());
              },
              child: Text(context.l10n.actionNewRegistration),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
                valueListenable:
                    context.read<WebAppointmentModel>().webBookingAdmin,
                builder: (context, value, _) {
                  return Skeletonizer(
                    enabled: value.loading,
                    child: DynamicTable(
                      rowsPerPage: (value.data?.length ?? 0) < 10
                          ? value.data?.length
                          : value.data?.length ?? 0,
                      data: TableData(
                        columns: [
                          HeaderTableData(
                            flex: 2,
                            titleHeader: Text(
                              '病院名',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                          ),
                          HeaderTableData(
                            titleHeader: Text(
                              '状況',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                          ),
                          HeaderTableData(
                            flex: 2,
                            titleHeader: Text(
                              '患者',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                          ),
                          HeaderTableData(
                            titleHeader: Text(
                              '予約日',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                          ),
                          HeaderTableData(
                            titleHeader: Text(
                              'テストコール日',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                              ),
                            ),
                          ),
                        ],
                        rows: (value.data?.length ?? 0) == 0
                            ? []
                            : List<RowTableData>.generate(
                                value.data?.length ?? 0,
                                (index) {
                                  var item = value.requireData[index];
                                  return RowTableData(
                                    onTap: () {
                                      context.router.push(
                                          WebAppointmentDetailRoute(
                                              id: item.id));
                                    },
                                    cell: [
                                      Text(
                                        item.hospital?.hospitalNameKatakana ??
                                            '-',
                                        style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Color(0xff98A6B5),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Text(
                                              item.patient?.progress ?? '-',
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
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${item.patient?.firstNameRomanized ?? '-'} ${item.patient?.middleNameRomanized ?? '-'} ${item.patient?.familyNameRomanized ?? '-'}',
                                                style: TextStyle(
                                                  color: context
                                                      .appTheme.primaryColor,
                                                  fontFamily: 'NotoSansJP',
                                                  package: 'core_ui',
                                                ),
                                              ),
                                              Text(
                                                  '${item.patient?.firstNameChineseOrVietnamese ?? '-'} ${item.patient?.middleNameChineseOrVietnamese ?? '-'} ${item.patient?.familyNameChineseOrVietnamese ?? '-'} / ${item.patient?.firstNameJapaneseForChinese ?? '-'} ${item.patient?.middleNameJapaneseForChinese ?? '-'} ${item.patient?.familyNameJapaneseForChinese ?? '-'} / ${item.patient?.firstNameJapaneseForNonChinese ?? '-'} ${item.patient?.middleNameJapaneseForNonChinese ?? '-'} ${item.patient?.familyNameJapaneseForNonChinese ?? '-'} '),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        item.proposedDates
                                                ?.map((e) =>
                                                    Dates.formShortDate(
                                                        e.proposedDate))
                                                .join(' - ') ??
                                            '-',
                                      ),
                                      Text(
                                        Dates.formatFullDateTime(
                                            item.createdAt),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
