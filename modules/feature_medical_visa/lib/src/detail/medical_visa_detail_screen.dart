import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'medical_visa_detail_model.dart';

class MedicalVisaDetailScreen extends StatefulWidget {
  const MedicalVisaDetailScreen({super.key});

  @override
  State<MedicalVisaDetailScreen> createState() =>
      _MedicalVisaDetailScreenState();
}

class _MedicalVisaDetailScreenState extends State<MedicalVisaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '医療ビザ管理',
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Consumer<MedicalVisaDetailModel>(
                builder: (context, model, _) {
                  return Column(
                    children: [
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            checkColor: Colors.white,
                            value: false,
                            onChanged: (value) {},
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '書類名',
                                style: context.textTheme.bodySmall,
                              )),
                          Expanded(
                              child: Text(
                            '発行日',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '人数',
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '共有',
                            style: context.textTheme.bodySmall,
                          )),
                        ],
                      ),
                      const Divider(),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          10,
                          (index) => InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(color: Colors.grey),
                                    ),
                                    checkColor: Colors.white,
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        '医療滞在訪日者出国報告書　2023年7月',
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                                color: context
                                                    .appTheme.primaryColor),
                                      )),
                                  const Expanded(child: Text('2023/06/30')),
                                  const Expanded(
                                      child: Text(
                                    '2',
                                  )),
                                  Expanded(
                                      child: Icon(
                                    Icons.person,
                                    color: context.appTheme.primaryColor,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              '削除する',
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '共有する',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '閲覧する',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '印刷する',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
