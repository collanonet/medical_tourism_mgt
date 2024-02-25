import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../detail_patient/detail_patient_model.dart';

class HeaderDetailPatient extends StatelessWidget {
  const HeaderDetailPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(context.appTheme.spacing.borderRadiusMedium),
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
          ValueListenableBuilder(
              valueListenable: context.read<DetailPatientModel>().patientNames,
              builder: (context, value, _) {
                return Skeletonizer(
                  enabled: value.loading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                              '${value.data?.firstNameRomanized ?? '--'} ${value.data?.middleNameRomanized ?? '--'} ${value.data?.familyNameRomanized ?? '--'}'),
                          // SizedBox(
                          //   width: context.appTheme.spacing.marginMedium,
                          // ),
                          // Icon(
                          //   Icons.star,
                          //   color: Colors.orange,
                          // ),
                          // SizedBox(
                          //   width: context.appTheme.spacing.marginSmall,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(
                          //       context.appTheme.spacing.marginSmall),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(4),
                          //     color: Colors.red,
                          //   ),
                          //   child: Text(
                          //     '出国報告書対象者',
                          //     style: context.textTheme.bodySmall?.copyWith(
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Text('${value.data?.firstNameChineseOrVietnamese ?? '--'} ${value.data?.middleNameChineseOrVietnamese ?? '--'} ${value.data?.familyNameChineseOrVietnamese ?? '--'}'),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Text('${value.data?.firstNameJapaneseForChinese ?? '--'} ${value.data?.middleNameJapaneseForChinese ?? '--'} ${value.data?.familyNameJapaneseForChinese ?? '--'}'),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Text('${value.data?.firstNameJapaneseForNonChinese ?? '--'} ${value.data?.middleNameJapaneseForNonChinese ?? '--'} ${value.data?.familyNameJapaneseForNonChinese ?? '--'}'),

                        ],
                      ),
                    ],
                  ),
                );
              }),
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
                    child: const Text('治療'),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  const Text('ビザ'),
                  SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDBE238),
                    ),
                    onPressed: () {},
                    child: const Text('医療ビザ'),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  const Text('進捗'),
                  SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00C6C6),
                    ),
                    onPressed: () {},
                    child: const Text('受注'),
                  ),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    child: Text('GP',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.appTheme.primaryColor,
                        )),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  const Text('001-C-20'),
                  SizedBox(
                    width: context.appTheme.spacing.marginExtraLarge,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    child: Text('進捗',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.appTheme.primaryColor,
                        )),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  const Text('見積&病院提案'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
