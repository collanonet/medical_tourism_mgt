// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'material_model.dart';

class Popup extends StatelessWidget {
  const Popup({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
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
                      formControlName: 'brochureName',
                      decoration: const InputDecoration(
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
                      formControlName: 'author',
                      decoration: const InputDecoration(
                        hintText: '作成者',
                      ),
                    ),
                  ),
                ],
              ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '発行日',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveDatePickerField(
                      formControlName: 'dateOfIssue',
                      label: '発行日',
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
                      decoration: const InputDecoration(
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
              valueListenable:
                  context.read<MaterialsModel>().submitMaterialHospital,
              onListen: () {
                final value =
                    context.read<MaterialsModel>().submitMaterialHospital.value;

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
                  valueListenable:
                      context.read<MaterialsModel>().submitMaterialHospital,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: value.loading
                          ? null
                          : () {
                              context
                                  .read<MaterialsModel>()
                                  .postFile(formGroup);
                            },
                      child: WithLoadingButton(
                        isLoading: value.loading,
                        child: const Text('保存する'),
                      ),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}
