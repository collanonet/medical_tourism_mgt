import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

import 'tab/facility_page.dart';
import 'tab/hotel_registration_page.dart';
import 'tab/hotel_search_page.dart';
import 'tab/itinerary_page.dart';
import 'tab/itinerary_simple_version_page.dart';
import 'tab/related_parties_page.dart';

class DetailProcessChartScreen extends StatefulWidget {
  const DetailProcessChartScreen({super.key});

  @override
  State<DetailProcessChartScreen> createState() =>
      _DetailProcessChartScreenState();
}

class _DetailProcessChartScreenState extends State<DetailProcessChartScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  List<String> menu = [
    '行程', // Itinerary
    '施設', // Facility
    'ホテル検索', // HotelSearch
    'ホテル登録', // HotelRegistration
    '関係者', // RelatedParties
    '行程表', //Itinerary
  ];

  List<Widget> pages = const [
    ItineraryPage(),
    FacilityPage(),
    HotelSearchPage(),
    HotelRegistrationPage(),
    RelatedPartiesPage(),
    ItinerarySimpleVersionPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
                    '母子保健健康視察ツアー　４泊５日',
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Text('2023/11/11〜2023/11/15')
                ],
              ),
              Spacer(),
              Text('進捗'),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(onPressed: () {}, child: Text('新規見積依頼'))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: context.appTheme.spacing.marginMedium,
              left: context.appTheme.spacing.marginMedium),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return Wrap(
                children: [
                  TabBarWidget(
                    selectedIndex: value,
                    menu: menu,
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
                padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium),
                  color: Colors.white,
                ),
                child: pages[index],
              ),
            );
          },
        )
      ],
    );
  }
}
