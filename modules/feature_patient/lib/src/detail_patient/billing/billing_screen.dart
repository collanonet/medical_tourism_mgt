// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'billing_form.dart';
import 'billing_model.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final formatter = InputFormatter();
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => billingForm(),
        builder: (context, formGroup, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                            Expanded(
                              child: Text(
                                '預かり金（治療費）',
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            const Expanded(flex: 2, child: Text('日本円（税込）')),
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
                            Expanded(
                              child: Text(
                                '精算金（診療報酬明細書）',
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            const Expanded(flex: 2, child: Text('日本円（税込）')),
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
                            Expanded(
                              child: Text(
                                '残金',
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            const Expanded(flex: 2, child: Text('日本円（税込）')),
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
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
                                          lastDate: DateTime(2050),
                                          initialEntryMode: DatePickerEntryMode.inputOnly,
                                          builder: (BuildContext context,
                                              ReactiveDatePickerDelegate<
                                                      dynamic>
                                                  picker,
                                              Widget? child) {
                                            return ReactiveTextField<DateTime>(
                                              formControlName:
                                                  'occurrence_date',
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
                                              decoration: InputDecoration(
                                                label: const Text('発生日'),
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
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ReactiveTextField(
                                          formControlName: 'hospitalName',
                                          decoration: const InputDecoration(
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
                                          formControlName: 'treatment_details',
                                          decoration: const InputDecoration(
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
                                          decoration: const InputDecoration(
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
                                          decoration: const InputDecoration(
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
                                      fileUpload(context, currentForm, 'file'),
                                    ],
                                  ),
                                ),
                              )
                              .toList();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ColumnSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: rows.toList(),
                              ),
                              SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              InkWell(
                                onTap: () => formArray.add(
                                  FormGroup({
                                    'occurrence_date': FormControl<DateTime>(
                                      validators: [
                                        Validators.pattern(
                                          ValidatorRegExp.date,
                                        ),
                                      ],
                                    ),
                                    'hospitalName':
                                        FormControl<String>(value: ''),
                                    'treatment_details':
                                        FormControl<String>(value: ''),
                                    'amount': FormControl<String>(
                                      value: '',
                                    ),
                                    'remaining_amount': FormControl<String>(
                                      value: '',
                                      disabled: true,
                                    ),
                                    'file': FormControl<FileSelect>(),
                                  }),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: context.appTheme.primaryColor,
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginSmall,
                                    ),
                                    Text(
                                      '行を追加',
                                      style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                          color: context.appTheme.primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
                                decoration: const InputDecoration(
                                  label: Text(
                                    '備考',
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('上記内容を確定し、患者に承認依頼をする'),
                      ),
                      const Icon(Icons.arrow_drop_down, size: 50),
                      const Text('患者側で承認されました　2023/10/21 　18:23'),
                      const Icon(Icons.arrow_drop_down, size: 50),
                      const ElevatedButton(
                        onPressed: null,
                        child: Text('精算内容を確定する'),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context.read<BillingModel>().submit,
                    onListen: () {
                      final value = context.read<BillingModel>().submit.value;
                      if (value.hasData) {
                        logger.d('loading');
                        snackBarWidget(
                          message: '正常に保存されました',
                          prefixIcon: const Icon(Icons.check_circle,
                              color: Colors.white),
                        );
                      }

                      if (value.hasError) {
                        snackBarWidget(
                          message: '保存できませんでした。 もう一度試してください。',
                          backgroundColor: Colors.red,
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable: context.watch<BillingModel>().submit,
                        builder: (context, value, _) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: () {},
                                  child: WithLoadingButton(
                                    isLoading: value.loading,
                                    child: const Text('保存する'),
                                  ));
                            },
                          );
                        }),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget fileUpload(
      BuildContext context, FormGroup currentForm, String fileName) {
    return ColumnSeparated(
      mainAxisAlignment: MainAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
            width: context.appTheme.spacing.formSpacing,
          ),
          children: [
            RowSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              children: [
                ReactiveValueListenableBuilder<FileSelect>(
                  formControlName: fileName,
                  builder: (context, control, _) {
                    return InkWell(
                      onTap: () {
                        if (control.value?.url != null) {
                          openUrlInBrowser(fileName: control.value!.url!);
                        }
                      },
                      child: Text(
                        control.value?.filename ?? 'File Input .....',
                        style: context.textTheme.bodySmall,
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                filePicker().then((value) {
                  if (value != null) {
                    currentForm.control(fileName).value = value;
                  }
                });
              },
              child: Icon(
                Icons.file_present_rounded,
                color: context.appTheme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
