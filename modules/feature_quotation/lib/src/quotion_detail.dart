import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

class QuotionDetail extends StatefulWidget {
  const QuotionDetail({super.key});

  @override
  State<QuotionDetail> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuotionDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: ColumnSeparated(
        separatorBuilder: (context, index) => SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        children: [
          const Row(
            children: [
              Expanded(child: Text('書類番号')),
              Expanded(child: Text('宛先')),
              Expanded(flex: 2, child: Text('タイトル')),
              Expanded(child: Text('発行日')),
              Expanded(child: Text('見込み')),
              Expanded(child: Text('売上管理')),
            ],
          ),
          ColumnSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            children: List.generate(
              10,
              (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? context.appTheme.primaryColor.withOpacity(0.1)
                        : Colors.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: RowSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 16);
                    },
                    children: [
                      Expanded(
                        child: Text(
                          '19Y−0630−1',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '大瀚人力资源集团',
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '劉 偉強 様　呼吸器疾患の受診（京大病院）',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2023/07/05 14:30',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'A',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'o',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
