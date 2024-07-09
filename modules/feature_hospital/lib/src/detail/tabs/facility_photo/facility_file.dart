import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'facility_photo_model.dart';

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
              Flexible(
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            },
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
                children: [
                  Text(
                    'パンフレット名',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'NameOfHspital',
                      decoration: InputDecoration(
                        hintText: '病院名を入力',
                      ),
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
                children: [
                  Text(
                    '作成者',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'photograph',
                      decoration: InputDecoration(
                        hintText: '作成者',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '発行日',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveDatePicker<DateTime>(
                      formControlName: 'shooting_date',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'shooting_date',
                          valueAccessor: DateTimeValueAccessor(
                              //dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                          decoration: InputDecoration(
                            label: const Text(
                              "発行日",
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '共有',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'share',
                      decoration: InputDecoration(
                        hintText: '共有',
                      ),
                    ),
                  ),
                ],
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
              child: Text('キャンセル'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ValueListenableListener(
              valueListenable: context.read<FacilityModel>().submit,
              onListen: () {
                final value = context.read<FacilityModel>().submit.value;

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
                  valueListenable: context.read<FacilityModel>().submit,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: value.loading
                          ? null
                          : () {
                              context
                                  .read<FacilityModel>()
                                  .fetchFacility(formGroup);
                            },
                      child: WithLoadingButton(
                          isLoading: value.loading, child: Text('保存する')),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}
