import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_process_chart_model.dart';
import 'tab/facility/facility_page.dart';
import 'tab/hotel_registration/hotel_registration_page.dart';
import 'tab/hotel_search/hotel_search_page.dart';
import 'tab/itinerary/itinerary_page.dart';
import 'tab/related_parties_page.dart';

class DetailProcessChartScreen extends StatefulWidget {
  const DetailProcessChartScreen({super.key, this.id});

  final String? id;

  @override
  State<DetailProcessChartScreen> createState() =>
      _DetailProcessChartScreenState();
}

class _DetailProcessChartScreenState extends State<DetailProcessChartScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.watch<DetailProcessChartModel>().getProcessData,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(
                context.appTheme.spacing.marginMedium,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    context.appTheme.spacing.borderRadiusMedium,
                  ),
                  color: Colors.white),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginMedium,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: Colors.grey.withOpacity(0.1)),
                    child: Icon(
                      Icons.mode_of_travel_rounded,
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.hasData ? value.requireData.tourName ?? '' : '',
                        style: context.textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      if (value.hasData)
                        Text(
                          value.requireData.day?.isEmpty ?? true
                              ? '--'
                              : value.requireData.day?.length == 1
                                  ? value.requireData.day?.first.date == null
                                      ? ''
                                      : Dates.formatFullDate(
                                          value.requireData.day!.first.date!)
                                  : '${value.requireData.day?.first.date == null ? '' : Dates.formatFullDate(value.requireData.day!.first.date!)}〜${value.requireData.day?.last.date == null ? '' : Dates.formatFullDate(value.requireData.day!.last.date!)}',
                        )
                    ],
                  ),
                  Spacer(),
                  Text('進捗'),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Chip(
                    label: Text(
                      '新規見積依頼',
                    ),
                    labelStyle: context.textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
                    backgroundColor: context.appTheme.primaryColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.appTheme.spacing.marginMedium,
                  left: context.appTheme.spacing.marginMedium),
              child: ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (BuildContext context, int valueInt, Widget? child) {
                  return Wrap(
                    children: [
                      TabBarWidget(
                        selectedIndex: valueInt,
                        menu: [
                          '行程',
                          if (value.hasData) ...[
                            '施設',
                            'ホテル検索',
                            'ホテル登録',
                            '関係者',
                          ]
                        ],
                        onPressed: (index) {
                          _selectedIndex.value = index;
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (BuildContext context, int index, Widget? child) {
                return Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.all(context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                      color: Colors.white,
                    ),
                    child: [
                      ItineraryPage(id: widget.id),
                      if (value.hasData) ...[
                        FacilityPage(id: value.requireData.id ?? ''),
                        HotelSearchPage(id: value.requireData.id),
                        HotelRegistrationPage(id: value.requireData.id),
                        RelatedPartiesPage(id: value.requireData.id ?? ''),
                      ]
                    ][index],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
