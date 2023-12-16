import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: context.appTheme.primaryColor.withOpacity(0.1),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Text(
                  '預かり金（治療費）',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '6,000,000円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: context.appTheme.primaryColor.withOpacity(0.1),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Text(
                  '精算金（診療報酬明細書）',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '4,590,000円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: Colors.yellow.withOpacity(0.1),
              border: Border.all(
                color: Colors.yellow,
              ),
            ),
            child: Row(
              children: [
                Text(
                  '残金',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '1,410,000円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
