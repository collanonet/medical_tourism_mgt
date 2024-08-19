import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateDomesticMedicalDataScreen extends StatelessWidget {
  const CreateDomesticMedicalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '先ほど保存したURLの詳細を入力してください。',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '病院',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'キーワードを入力',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'カテゴリ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text('画像データ（DICOM）'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Checkbox(value: true, onChanged: (value) {}),
                      Text('病状資料'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '書類名',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'PET-CT',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          '発行日',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ReactiveDatePicker<DateTime>(
                formControlName: 'entry_date_from',
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (BuildContext context,
                    ReactiveDatePickerDelegate<dynamic> picker, Widget? child) {
                  return ReactiveTextField<DateTime>(
                    formControlName: 'entry_date_from',
                    valueAccessor: DateTimeValueAccessor(
                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        context.l10n.labelEntryDateFrom,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          CupertinoIcons.calendar,
                          color: Colors.grey,
                        ),
                        onPressed: picker.showPicker,
                      ),
                    ),
                    inputFormatters: [
                      formatter.dateFormatter,
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox.shrink(),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox.shrink(),
            )
          ],
        )
      ],
    );
  }
}
