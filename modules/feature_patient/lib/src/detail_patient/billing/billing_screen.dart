import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'billing_form.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ReactiveFormConfig(
        validationMessages: <String, ValidationMessageFunction>{
          ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
        },
        child: ReactiveFormBuilder(
            form: () => billingForm(),
            builder: (context, formGroup, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginSmall,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      )),
                      color: context.appTheme.primaryColor.withOpacity(0.1),
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '預かり金（治療費）',
                          style: context.textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(child: Text('日本円（税込）')),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '6,000,000円',
                                  style: context.textTheme.titleLarge,
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginSmall,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      )),
                      color: context.appTheme.primaryColor.withOpacity(0.1),
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '精算金（診療報酬明細書）',
                          style: context.textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(child: Text('日本円（税込）')),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '4,590,000円',
                                  style: context.textTheme.titleLarge,
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginSmall,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      )),
                      color: Colors.yellow.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.yellow,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '残金',
                          style: context.textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(child: Text('日本円（税込）')),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '1,410,000円',
                                  style: context.textTheme.titleLarge,
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Text(
                    '治療費',
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ReactiveTextField(
                            formControlName: 'remarks',
                            decoration: InputDecoration(
                              label: Text(
                                '備考',
                              ),
                            ),
                          )),
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
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginMedium,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.appTheme.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      )),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReactiveFormArray(
                          formArrayName: 'treatment_cost',
                          builder: (context, formArray, child) {
                            final rows = formArray.controls
                                .map((control) => control as FormGroup)
                                .map(
                                  (currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveDatePicker<DateTime>(
                                            formControlName: 'occurrence_date',
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                            builder: (BuildContext context,
                                                ReactiveDatePickerDelegate<
                                                        dynamic>
                                                    picker,
                                                Widget? child) {
                                              return ReactiveTextField<
                                                  DateTime>(
                                                formControlName:
                                                    'occurrence_date',
                                                readOnly: true,
                                                onTap: (value) =>
                                                    picker.showPicker(),
                                                valueAccessor:
                                                    DateTimeValueAccessor(
                                                  dateTimeFormat:
                                                      DateFormat('yyyy/MM/dd'),
                                                ),
                                                onChanged: (value) {
                                                  logger.d(value);
                                                },
                                                onSubmitted: (value) {
                                                  logger.d(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text('発生日'),
                                                  suffixIcon: Icon(
                                                    CupertinoIcons.calendar,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          flex: 2,
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
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ReactiveTextField(
                                            formControlName:
                                                'treatment_details',
                                            decoration: InputDecoration(
                                              label: Text(
                                                '治療内容',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'amount',
                                            decoration: InputDecoration(
                                              label: Text(
                                                '金額',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'remaining_amount',
                                            decoration: InputDecoration(
                                              label: Text(
                                                '残金',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Icon(
                                          Icons.file_present_rounded,
                                          color: context.appTheme.primaryColor,
                                        ),
                                        Text('請求書.pdf'),
                                      ],
                                    ),
                                  ),
                                );

                            return ColumnSeparated(
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              children: rows.toList(),
                            );
                          },
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
                              '本人のビザを追加',
                              style: TextStyle(
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('上記内容を確定し、患者に承認依頼をする'),
                  ),
                  Icon(Icons.arrow_drop_down, size: 50),
                  Text('患者側で承認されました　2023/10/21 　18:23'),
                  Icon(Icons.arrow_drop_down, size: 50),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('精算内容を確定する'),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
