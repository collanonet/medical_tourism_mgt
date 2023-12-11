import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressListTable extends StatefulWidget {
  const ProgressListTable({super.key, required this.title});

  final String title;

  @override
  State<ProgressListTable> createState() => _ProgressListTableState();
}

class _ProgressListTableState extends State<ProgressListTable> {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          children: [
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Text('済/未', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              width: context.appTheme.spacing.marginExtraLarge * 2,
            ),
            SizedBox(
              width: context.appTheme.spacing.marginExtraLarge,
            ),
            Expanded(
                flex: 4,
                child:
                    Text('タスク', style: Theme.of(context).textTheme.bodySmall)),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
                flex: 1,
                child:
                    Text('完了日', style: Theme.of(context).textTheme.bodySmall)),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
                flex: 3,
                child:
                    Text('備考', style: Theme.of(context).textTheme.bodySmall)),
          ],
        ),
        const Divider(),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(10, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: index == _selectedIndex.value
                    ? Color(0xffF8F8D9)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  index == _selectedIndex.value
                      ? SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                          child: Icon(
                            Icons.forward,
                            color: Colors.green,
                          ),
                        )
                      : SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: Colors.grey),
                    ),
                    checkColor: Colors.white,
                    value: index == _selectedIndex.value,
                    onChanged: (value) {
                      _selectedIndex.value = index;
                      setState(() {});
                    },
                  ),
                  Container(
                    width: context.appTheme.spacing.marginExtraLarge * 2,
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '当社',
                        style: TextStyle(color: context.appTheme.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginExtraLarge,
                  ),
                  Expanded(
                      flex: 4,
                      child: Text('訪日治療適応判断（オンライン・書面）',
                          style: Theme.of(context).textTheme.bodyLarge)),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: '2021/01/01',
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            enabled: false,
                            isDense: true,
                            suffixIcon: const Icon(
                              CupertinoIcons.calendar,
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '9月21日にWeb検診予約をしています',
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          enabled: false,
                          isDense: true,
                        ),
                      )),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginExtraLarge,
        ),
      ],
    );
  }
}
