import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_medical_visa_form.dart';
import 'medical_visa_model.dart';

class MedicalVisaFilter extends StatefulWidget {
  const MedicalVisaFilter({super.key});

  @override
  State<MedicalVisaFilter> createState() => _MedicalVisaFilterState();
}

class _MedicalVisaFilterState extends State<MedicalVisaFilter> {
  final formatter = InputFormatter();
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalVisaModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessages,
          child: ReactiveFormBuilder(
            form: () => formFilterMedicalVisa(),
            builder: (context, formGroup, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '医療ビザ管理検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelPatientName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'patientName',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '査証',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'visa',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '報告書',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'report',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            formControlName: 'subjects_withdrawal',
                            title: const Text('取下対象者'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '日付絞込み',
                            ),
                            RowSeparated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium);
                              },
                              children: [
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'refinement_date',
                                    value: '来日日',
                                    title: const Text('来日日'),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'refinement_date',
                                    value: '帰国日',
                                    title: const Text('帰国日'),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'refinement_date',
                                    value: '身元保証書発行日',
                                    title: const Text('身元保証書発行日'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                        InkWell(
                          onTap: () {
                            final periodFrom = formGroup.control('period_from');
                            final periodTo = formGroup.control('period_to');
                            final valueDate =
                                periodFrom.value ?? DateTime.now();
                            periodFrom.value = DateTime(
                                valueDate.year, valueDate.month - 1, 1);
                            periodTo.value =
                                DateTime(valueDate.year, valueDate.month, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: context.appTheme.primaryColor,
                                ),
                                Text(
                                  '前月',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: context.appTheme.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '期間（自）',
                                      style: context.textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      height: context
                                          .appTheme.spacing.marginExtraSmall,
                                    ),
                                    ReactiveDatePicker<DateTime>(
                                      formControlName: 'period_from',
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'period_from',
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          decoration: InputDecoration(
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
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Text('〜'),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '期間（至）',
                                      style: context.textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      height: context
                                          .appTheme.spacing.marginExtraSmall,
                                    ),
                                    ReactiveDatePicker<DateTime>(
                                      formControlName: 'period_to',
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'period_to',
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          decoration: InputDecoration(
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        InkWell(
                          onTap: () {
                            final periodFrom = formGroup.control('period_from');
                            final periodTo = formGroup.control('period_to');
                            final valueDate = periodTo.value ?? DateTime.now();
                            periodFrom.value = DateTime(
                                valueDate.year, valueDate.month + 1, 1);
                            periodTo.value = DateTime(
                                valueDate.year, valueDate.month + 2, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: [
                                Text(
                                  '次月',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: context.appTheme.primaryColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: context.appTheme.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('検索'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
