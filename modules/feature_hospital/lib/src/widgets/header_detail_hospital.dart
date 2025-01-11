// Flutter imports:
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../detail/hospital_detail_model.dart';

class HeaderDetailHospital extends StatelessWidget {
  const HeaderDetailHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            context.watch<HospitalDetailModel>().basicInformationData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: Container(
              padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    context.appTheme.spacing.borderRadiusMedium),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Skeletonizer(
                    enabled: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(value.data?.hospitalNameChinese ?? '--'),
                          ],
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginSmall,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(value.data?.hospitalNameKatakana ?? '--'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RowSeparated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 16);
                        },
                        children: [
                          const Text('種別'),
                          if (value.data?.healthCheckup ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('健診'),
                            ),
                          if (value.data?.treatment ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('治療'),
                            ),
                          if (value.data?.heavyIonBeam ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('重粒子線'),
                            ),
                          if (value.data?.protonBeam ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('陽子線'),
                            ),
                          if (value.data?.regenerativeMedicine ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('再生医療'),
                            ),
                          if (value.data?.beauty ?? false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff53A6FF),
                              ),
                              onPressed: () {},
                              child: const Text('美容'),
                            ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
