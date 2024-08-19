
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../overseas_medical_data_model.dart';

class CreateMedicalOverseaDataWithFileScreen extends StatelessWidget {
  const CreateMedicalOverseaDataWithFileScreen({super.key, this.title});

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
                icon: const Icon(Icons.close)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  ReactiveTextField<String>(
                    formControlName: 'hospitalName',
                    decoration: const InputDecoration(
                      hintText: '病院名を入力',
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicWidth(
                        child: ReactiveRadioListTile(
                          formControlName: 'category',
                          title: const Text('画像データ（DICOM）'),
                          value: '画像データ（DICOM）',
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      IntrinsicWidth(
                        child: ReactiveRadioListTile(
                          formControlName: 'category',
                          title: const Text('病状資料'),
                          value: '病状資料',
                        ),
                      ),
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
                  const ReactiveDropdownFormField(
                    formControlName: 'documentName',
                    items: [
                      DropdownMenuItem(
                        value: 'PET-CT',
                        child: Text('PET-CT'),
                      ),
                      DropdownMenuItem(
                        value: 'MRI',
                        child: Text('MRI'),
                      ),
                      DropdownMenuItem(
                        value: '入退院記録',
                        child: Text('入退院記録'),
                      ),
                      DropdownMenuItem(
                        value: '検査結果',
                        child: Text('検査結果'),
                      ),
                      DropdownMenuItem(
                        value: '手術記録',
                        child: Text('手術記録'),
                      ),
                    ],
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
                formControlName: 'issueDate',
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (BuildContext context,
                    ReactiveDatePickerDelegate<dynamic> picker, Widget? child) {
                  return ReactiveTextField<DateTime>(
                    formControlName: 'issueDate',
                    valueAccessor: DateTimeValueAccessor(
                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                    ),
                    decoration: InputDecoration(
                      label: const Text(
                        '発行日',
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
            const Expanded(
              child: SizedBox.shrink(),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            const Expanded(
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
              child: const Text('キャンセル'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ValueListenableListener(
              valueListenable: context
                  .read<OverseasMedicalDataModel>()
                  .createMedicalOverseaData,
              onListen: () {
                final value = context
                    .read<OverseasMedicalDataModel>()
                    .createMedicalOverseaData
                    .value;

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
                  valueListenable: context
                      .read<OverseasMedicalDataModel>()
                      .createMedicalOverseaData,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: value.loading
                          ? null
                          : () {
                              context
                                  .read<OverseasMedicalDataModel>()
                                  .postMedicalRecordsOverseasData(formGroup);
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
