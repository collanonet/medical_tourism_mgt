import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../feature_process_chart.gm.dart';
import 'filter_process_chart.dart';
import 'process_chart_model.dart';

class ProcessChartScreen extends StatelessWidget {
  const ProcessChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.watch<ProcessChartModel>().itinerraryData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProcessChartFilter(),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.router.push(const ItinerarySimplifiedRoute());
                      },
                      child: const Text('簡易版行程表を新規作成')),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.router.push(DetailProcessChartRoute());
                      },
                      child: const Text('ツアー行程表を新規作成')),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Expanded(flex: 2, child: Text('ツアー名')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          const Expanded(flex: 2, child: Text('日程')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          const Expanded(child: Text('人数')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          const Expanded(child: Text('グループ')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          const Expanded(child: Text('種別')),
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable:
                              context.read<ProcessChartModel>().itinerraryData,
                          builder: (context, value, _) {
                            return ListView.builder(
                              itemCount: value.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                var item = value.requireData[index];
                                logger.d('leng ${value.data?.length}');
                                return InkWell(
                                  onTap: () {
                                    context.router.push(
                                        DetailProcessChartRoute(id: item.id));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      context.appTheme.spacing.marginMedium,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium,
                                        ),
                                        color: index % 2 == 0
                                            ? const Color(0xffEDF8F8)
                                            : Colors.white),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                value.data?[index].tourName ??
                                                    '--')),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text(value.data?[index].day
                                                        ?.isEmpty ==
                                                    true
                                                ? '--'
                                                : value.data?[index].day
                                                            ?.length ==
                                                        1
                                                    ? '${value.data?[index].day?.first.date == null ? '' : Dates.formatFullDate(value.data![index].day!.first.date!)}'
                                                    : '${value.data?[index].day?.first.date == null ? '' : Dates.formatFullDate(value.data![index].day!.first.date!)}〜${value.data?[index].day?.last.date == null ? '' : Dates.formatFullDate(value.data![index].day!.last.date!)}')),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                            child: Text(
                                                '${value.data?[index].peopleNumber ?? '--'}')),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                            child: Text(
                                                '${value.data?[index].group ?? '--'}')),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              margin: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: value.data?[index]
                                                            .classification ==
                                                        '変更'
                                                    ? const Color(0xffF7654A)
                                                    : value.data?[index]
                                                                .classification ==
                                                            '新規見積依頼'
                                                        ? const Color(
                                                            0xff53A6FF)
                                                        : value.data?[index]
                                                                    .classification ==
                                                                '新規手配依頼'
                                                            ? const Color(
                                                                0xff98DE51)
                                                            : value.data?[index]
                                                                        .classification ==
                                                                    'キャンセル'
                                                                ? Colors
                                                                    .blueGrey
                                                                : value.data?[index].classification ==
                                                                        'Final'
                                                                    ? const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        185,
                                                                        30,
                                                                        30)
                                                                    : const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        185,
                                                                        30,
                                                                        30),
                                              ),
                                              child: Text(
                                                value.data?[index]
                                                            .classification ==
                                                        '新規見積依頼'
                                                    ? '新規見積依頼'
                                                    : value.data?[index]
                                                                .classification ==
                                                            '新規手配依頼'
                                                        ? '新規手配依頼'
                                                        : value.data?[index]
                                                                    .classification ==
                                                                '変更'
                                                            ? '変更'
                                                            : value.data?[index]
                                                                        .classification ==
                                                                    'Final '
                                                                ? 'Final '
                                                                : value.data?[index].classification ==
                                                                        'キャンセル'
                                                                    ? 'キャンセル'
                                                                    : value.data?[index]
                                                                            .classification ??
                                                                        '--',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
