import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateMedicalOverseaDataWithUrlScreen extends StatelessWidget {
  const CreateMedicalOverseaDataWithUrlScreen({super.key});

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
                '外部URLをペーストしてください。',
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
        Text(
          '共有用URL',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            hintText:
                'https://www.tencentcloud.com/jp?utm_medium=SEM_search&utm_source=google&utm_campaign',
          ),
        ),
        Text(
          'パスワード',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Dshnkyhk',
          ),
        ),
        Text(
          '閲覧有効期限',
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
              child: Container(
                padding: EdgeInsets.all(
                  context.appTheme.spacing.marginExtraLarge,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                    context.appTheme.spacing.borderRadiusMedium,
                  )),
                  border: Border.all(
                    color: context.appTheme.primaryColor,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'QRコード画像を\nドラッグ&ドロップ',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.copy_all_rounded,
                      size: 50,
                      color: context.appTheme.primaryColor,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'ファイルを選択',
                        style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
