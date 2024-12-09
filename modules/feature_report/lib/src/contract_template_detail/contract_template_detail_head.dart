import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

class ContractHead extends StatelessWidget {
  const ContractHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        context.appTheme.spacing.marginMedium,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.appTheme.spacing.borderRadiusMedium,
          ),
          color: Colors.white),
      child: RowSeparated(
        separatorBuilder: (context, index) => SizedBox(
          width: context.appTheme.spacing.marginSmall,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey.withOpacity(0.1)),
            child: Icon(
              Icons.edit_document,
              color: context.appTheme.primaryColor,
            ),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '【患者直接の契約書】医療ツーリズムコーディネート契約書・約款',
                style: context.textTheme.titleLarge,
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              boxRequired(enabled: true, label: '電子契約'),
            ],
          ),
          const Spacer(),
          const Text('甲'),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
            onPressed: () {},
            child: const Text('自社'),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          const Text('乙'),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 206, 195, 95)),
            ),
            onPressed: () {},
            child: const Text('患者'),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
        ],
      ),
    );
  }
}
