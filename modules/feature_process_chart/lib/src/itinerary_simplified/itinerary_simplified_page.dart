import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../filter_process_chart_form.dart';
import 'itinerary_simplified_form.dart';
import 'itinerary_simplified_model.dart';
import 'itinerary_simplified_screen.dart';

@RoutePage()
class ItinerarySimplifiedPage extends StatefulWidget {
  const ItinerarySimplifiedPage({super.key});

  @override
  State<ItinerarySimplifiedPage> createState() =>
      _ItinerarySimplifiedPageState();
}

class _ItinerarySimplifiedPageState extends State<ItinerarySimplifiedPage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  List<String> menu = [
    '行程表',
  ];

  List<Widget> pages = const [
    ItinerarySimpleVersionScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessagesFilterPatient(context),
      child: ReactiveFormBuilder(
        form: () => inerarySimpleVersionForm(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) =>
                GetIt.I<ItinerarySimpleVersionModel>()..fetchData(formGroup),
            child: Builder(builder: (context) {
              return LayoutView(
                selectedIndex: 4,
                page: ValueListenableBuilder(
                    valueListenable:
                        context.watch<ItinerarySimpleVersionModel>().submit,
                    builder: (context, value, child) {
                      return Skeletonizer(
                        enabled: value.loading,
                        child: Column(
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
                                          context.appTheme.spacing
                                              .borderRadiusMedium,
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '母子保健健康視察ツアー　４泊５日',
                                        style: context.textTheme.titleLarge,
                                      ),
                                      SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Text('2023/11/11〜2023/11/15')
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: context.appTheme.spacing.marginMedium,
                                  left: context.appTheme.spacing.marginMedium),
                              child: ValueListenableBuilder<int>(
                                valueListenable: _selectedIndex,
                                builder: (BuildContext context, int value,
                                    Widget? child) {
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
                              builder: (BuildContext context, int index,
                                  Widget? child) {
                                return Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium),
                                      color: Colors.white,
                                    ),
                                    child: pages[index],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }),
              );
            }),
          );
        },
      ),
    );
  }
}
