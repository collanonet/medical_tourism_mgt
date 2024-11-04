// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'body/sale_expenses.dart';
import 'body/sale_service_free.dart';
import 'body/sale_total.dart';
import 'sale_model.dart';

class SaleManagementScreen extends StatefulWidget {
  const SaleManagementScreen({super.key});

  @override
  State<SaleManagementScreen> createState() => _SaleManagementScreenState();
}

class _SaleManagementScreenState extends State<SaleManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<SaleModel>().submit,
      builder: (context, value, child) {
        return Skeletonizer(
          enabled: value.loading,
          child: ColumnSeparated(
            separatorBuilder: (context, index) {
              return SizedBox(height: context.appTheme.spacing.marginMedium);
            },
            children: [
              Container(
                padding: EdgeInsets.all(
                  context.appTheme.spacing.marginMedium,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                    color: Colors.white),
                child: RowSeparated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            context.appTheme.spacing.borderRadiusMedium,
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Icon(
                        Icons.calculate_outlined,
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LIU　WEIQIANG/母子健康視察ツアー  ',
                          style: context.textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        const Text('刘 伟强  劉 偉強  リュウ イーチャン')
                      ],
                    ),
                    const Spacer(),
                    const Text('種別'),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {},
                      child: const Text('治療'),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    const Text('ビザ'),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 206, 195, 95)),
                      ),
                      onPressed: () {},
                      child: const Text('医療ビザ'),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    const Text('進捗'),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 32, 171, 225)),
                      ),
                      onPressed: () {},
                      child: const Text('受注'),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(
                          context.appTheme.spacing.marginMedium,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            context.appTheme.spacing.borderRadiusMedium,
                          ),
                          color: Colors.white,
                        ),
                        child: ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            ReactiveForm(
                              formGroup: form.control('head_info') as FormGroup,
                              child: ColumnSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                separatorBuilder: (context, index) => SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          boxStyle(
                                              '医療費預り金',
                                              '日本円（税込）',
                                              '123456',
                                              const Color.fromARGB(
                                                  255, 249, 242, 174)),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('入金日'),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ReactiveDatePicker<DateTime>(
                                              formControlName: 'paymentDay',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                              builder: (BuildContext context,
                                                  ReactiveDatePickerDelegate<
                                                          dynamic>
                                                      picker,
                                                  Widget? child) {
                                                return Stack(
                                                  children: [
                                                    ReactiveTextField<DateTime>(
                                                      formControlName:
                                                          'paymentDay',
                                                      readOnly: true,
                                                      onTap: (value) =>
                                                          picker.showPicker(),
                                                      valueAccessor:
                                                          DateTimeValueAccessor(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: IconButton(
                                                          onPressed: () =>
                                                              picker
                                                                  .showPicker(),
                                                          icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: context
                                                                .appTheme
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          boxStyle(
                                              '実費',
                                              '日本円（税込）',
                                              '1,500,000円',
                                              const Color.fromARGB(
                                                  255, 244, 237, 178)),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('精算日'),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ReactiveDatePicker<DateTime>(
                                              formControlName: 'settlement_day',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                              builder: (BuildContext context,
                                                  ReactiveDatePickerDelegate<
                                                          dynamic>
                                                      picker,
                                                  Widget? child) {
                                                return Stack(
                                                  children: [
                                                    ReactiveTextField<DateTime>(
                                                      formControlName:
                                                          'settlement_day',
                                                      readOnly: true,
                                                      onTap: (value) =>
                                                          picker.showPicker(),
                                                      valueAccessor:
                                                          DateTimeValueAccessor(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: IconButton(
                                                          onPressed: () =>
                                                              picker
                                                                  .showPicker(),
                                                          icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: context
                                                                .appTheme
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 700,
                                    child: ReactiveTextField(
                                      maxLines: 3,
                                      formControlName: 'actual_cost',
                                      decoration: const InputDecoration(
                                        labelText: '実費内訳',
                                        fillColor: Color(0x00f8f8d9),
                                      ),
                                      valueAccessor: IntValueAccessor(),
                                      readOnly: true,
                                    ),
                                  ),
                                  boxStyle('返金額', '日本円（税込）', '320,000円',
                                      const Color.fromARGB(255, 120, 161, 194)),
                                ],
                              ),
                            ),

                            const Text('サービス費'),

                            //class
                            const SaleServiceFree(),
                            const SizedBox(height: 20),

                            const Text('経費'),
                            //class
                            const SaleExpenses(),
                            const SizedBox(height: 20),

                            const Text('合計'),
                            const SaleTotal(),
                          ],
                        ),
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
                    valueListenable: context.read<SaleModel>().submit,
                    onListen: () {
                      final value = context.read<SaleModel>().submit.value;
                      if (value.hasData) {
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
                        valueListenable: context.watch<SaleModel>().submit,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<SaleModel>()
                                          .submitDataInfo(form)
                                      : null,
                                  child: WithLoadingButton(
                                    isLoading: value.loading,
                                    child: const Text('保存する'),
                                  ));
                            },
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget boxStyle(
      String labelText, String title, String travelling, Color color) {
    return Container(
      width: 700,
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
          color: color,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(labelText, style: context.textTheme.titleMedium),
          const SizedBox(width: 30),
          Text(title),
          const SizedBox(width: 30),
          const Text('|'),
          const SizedBox(width: 30),
          Text(travelling, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget boxStyleDis(String title, String travelling) {
    return Container(
      width: 330,
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Text(title, style: context.textTheme.titleMedium),
          const SizedBox(width: 30),
          const Text('|'),
          const SizedBox(width: 30),
          Text(travelling, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
