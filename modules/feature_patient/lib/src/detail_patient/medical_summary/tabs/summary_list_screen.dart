import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SummaryListScreen extends StatelessWidget {
  const SummaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                side: BorderSide(color: Colors.grey),
              ),
              checkColor: Colors.white,
              value: false,
              onChanged: (value) {},
            ),
            Expanded(
                child: Text(
              '文書名',
              style: context.textTheme.bodySmall,
            )),
            Expanded(
                child: Text(
              '発行日',
              style: context.textTheme.bodySmall,
            )),
            Expanded(
                child: Text(
              '共有',
              style: context.textTheme.bodySmall,
            )),
            Expanded(
                child: Text(
              'エージェントへ開示',
              style: context.textTheme.bodySmall,
            )),
          ],
        ),
        Divider(),
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
                        side: BorderSide(color: Colors.grey),
                      ),
                      checkColor: Colors.white,
                      value: false,
                      onChanged: (value) {},
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Flexible(child: Text('診療データサマリー')),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: context.appTheme.primaryColor),
                          ),
                          child: Text(
                            '通常版',
                            style: context.textTheme.bodySmall?.copyWith(
                                color: context.appTheme.primaryColor),
                          ),
                        )
                      ],
                    )),
                    Expanded(child: Text('2023/06/30')),
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: context.appTheme.primaryColor,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: context.appTheme.primaryColor,
                        ),
                      ],
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
  }
}
