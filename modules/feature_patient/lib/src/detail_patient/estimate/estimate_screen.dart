import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EstimateScreen extends StatefulWidget {
  const EstimateScreen({super.key});

  @override
  State<EstimateScreen> createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                '書類番号',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '種別',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '宛先',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '発行日',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  flex: 2,
                  child: Text(
                    '件名',
                    style: context.textTheme.bodySmall,
                  )),
              Expanded(
                  child: Text(
                'エージェントへ開示',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '患者へ開示',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '見込み',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              )),
            ],
          ),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => InkWell(
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
                        child: Text(
                      '19Y−0630−1',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '見積書',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '大瀚人力资源集团',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '2023/07/18',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '劉 偉強 様　呼吸器疾患の受診（京大病院）',
                          style: context.textTheme.bodySmall,
                        )),
                    Expanded(
                        child: Text(
                      '○',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '×',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      'A',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('請求書を発行する'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 0.5,
              );
            },
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
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'CSV出力',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'コピーして新規作成',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '新規作成',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
