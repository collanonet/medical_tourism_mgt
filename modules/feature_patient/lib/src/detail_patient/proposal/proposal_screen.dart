import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('病院のご提案', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveTextField(
                formControlName: 'hospital_name',
                decoration: InputDecoration(
                  label: Text(
                    '病院名',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveTextField(
                formControlName: 'postal_code',
                decoration: InputDecoration(
                  label: Text(
                    '郵便番号',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              flex: 3,
              child: ReactiveTextField(
                formControlName: 'address',
                decoration: InputDecoration(
                  label: Text(
                    '所在地',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveTextField(
                maxLines: 20,
                minLines: 1,
                formControlName: 'summary',
                decoration: InputDecoration(
                  label: Text(
                    '概要',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: context.appTheme.primaryColor,
            ),
            SizedBox(
              width: context.appTheme.spacing.marginSmall,
            ),
            Text(
              '病院を追加',
              style: TextStyle(color: context.appTheme.primaryColor),
            )
          ],
        )
      ],
    );
  }
}
