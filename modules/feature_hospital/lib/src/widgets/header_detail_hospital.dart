import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade400,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Skeletonizer(
                    enabled: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(value.data?.hospitalNameChinese ?? '--'),
                            // '${value.data?.hospitalNameJapaneseForChinese ?? '--'} '),
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
                      Row(
                        children: [
                          const Text('種別'),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff53A6FF),
                            ),
                            onPressed: () {},
                            child: const Text('--'),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff53A6FF),
                            ),
                            onPressed: () {},
                            child: const Text('--'),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff53A6FF),
                            ),
                            onPressed: () {},
                            child: const Text('--'),
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
