// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'medical_payment_details_model.dart';

class Popup extends StatelessWidget {
  const Popup({
    super.key,
    this.title,
    this.isUrl = false,
  });

  final String? title;
  final bool isUrl;

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
        if (isUrl) ...{
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '外部URL',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: 300,
                      child: ReactiveTextField<String>(
                        formControlName: 'url',
                        decoration: const InputDecoration(
                          hintText: '外部URL',
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
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
        },
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '書類名',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    width: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'theNameOfTheHospital',
                      decoration: const InputDecoration(
                        hintText: '書類名',
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
                    '発行元',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    width: 300,
                    child: ReactiveTextField<String>(
                      formControlName: 'documentName',
                      decoration: const InputDecoration(
                        hintText: '発行元',
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
                  const SizedBox(
                    width: 300,
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
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),

          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
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
              valueListenable: context.read<MedicalPaymentDetailModel>().submit,
              onListen: () {
                final valueData =
                    context.read<MedicalPaymentDetailModel>().submit.value;

                if (valueData.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }

                if (valueData.hasData) {
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
                      context.read<MedicalPaymentDetailModel>().submit,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: value.loading
                          ? null
                          : () {
                              context
                                  .read<MedicalPaymentDetailModel>()
                                  .submitMedicalPayment(formGroup);
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
