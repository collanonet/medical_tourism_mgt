import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../web_reservation_model.dart';

class ReservationHistorySection extends StatefulWidget {
  const ReservationHistorySection({super.key});

  @override
  State<ReservationHistorySection> createState() =>
      _ReservationHistorySectionState();
}

class _ReservationHistorySectionState extends State<ReservationHistorySection> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.watch<WebAppointmentDetailModel>().webBookings,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: Container(
              height: 400,
              width: double.infinity,
              child: DynamicTable(
                rowsPerPage: value.data?.length ?? 0,
                data: TableData(
                  columns: [
                    HeaderTableData(
                      titleHeader: Text('状況'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('医療機関'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('予約日'),
                    ),
                    HeaderTableData(
                      titleHeader: Text('テストコール'),
                    ),
                  ],
                  rows: List<RowTableData>.generate(
                    value.data?.length ?? 0,
                    (index) {
                      final data = value.data![index];
                      return RowTableData(
                        onTap: () {
                          context
                              .read<WebAppointmentDetailModel>()
                              .selectReservation(
                                data,
                              );
                        },
                        cell: [
                          Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: context.textTheme.titleLarge?.copyWith(
                                    color: context.appTheme.primaryColor),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                            ],
                          ),
                          Text(
                            data.hospital?.hospitalNameKatakana ?? '',
                            style: context.textTheme.titleLarge?.copyWith(
                                color: context.appTheme.primaryColor),
                          ),
                          Text(
                            data.proposedDates
                                    ?.map((e) =>
                                        Dates.formShortDate(e.proposedDate))
                                    .join(' - ') ??
                                '',
                          ),
                          Text(
                            Dates.formatFullDateTime(data.createdAt),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
