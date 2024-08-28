// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'contrant_model.dart';

class Popup extends StatelessWidget {
  const Popup({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    final formatter = InputFormatter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null) ...{
              Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            },
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicWidth(
              stepWidth: 300,
              child: Column(
                children: [
                  Text(
                    '更新日',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveDatePicker<DateTime>(
                      formControlName: 'updatedOn',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'updatedOn',
                          valueAccessor: DateTimeValueAccessor(
                            dateTimeFormat: DateFormat('yyyy/MM/dd'),
                          ),
                          decoration: InputDecoration(
                            label: const Text(
                              '更新日',
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
                ],
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            IntrinsicWidth(
              stepWidth: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ファイル名',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'DocumentName',
                      decoration: const InputDecoration(
                        hintText: 'ファイル名',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ValueListenableListener(
              valueListenable: context.read<ContrantModel>().submitData,
              onListen: () {
                final value = context.read<ContrantModel>().submitData.value;

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }

                if (value.hasData) {
                  Navigator.pop(context);
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                  valueListenable: context.read<ContrantModel>().submitData,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: value.loading
                          ? null
                          : () {
                              context.read<ContrantModel>().submit(formGroup);
                            },
                      child: WithLoadingButton(
                          isLoading: value.loading, child: const Text('保存する')),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}
