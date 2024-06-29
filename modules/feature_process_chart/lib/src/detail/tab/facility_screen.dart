import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'facility_model.dart';

class FacilityScreen extends StatefulWidget {
  const FacilityScreen({super.key});

  @override
  State<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<FacilityModel>().submitData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ホテル',
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ReactiveFormArray(
                        formArrayName: 'Hotel',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: ColumnSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'Person_in_charge_of_arrangements',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '手配担当',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(child: SizedBox()),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(child: SizedBox()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'Name_of_facility',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '施設名',
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
                                              formControlName: 'location',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '所在地',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'Person_in_charge_name',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '担当者名',
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
                                              formControlName:
                                                  'telephone_number',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '電話番号',
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
                                            child: SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'remarks',
                                              decoration: InputDecoration(
                                                label: Text(
                                                  '備考',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('外国語スタッフ'),
                                              Row(
                                                children: [
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'japanese',
                                                      title: const Text('日本語'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'chinese',
                                                      title: const Text('中国語'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'vietnamese',
                                                      title:
                                                          const Text('ベトナム語'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'english',
                                                      title: const Text('英語'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName: 'others',
                                                      title: const Text('その他'),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250,
                                                    child: ReactiveTextField(
                                                      formControlName:
                                                          'Foreign_language_staff',
                                                      decoration:
                                                          InputDecoration(
                                                        label: Text(
                                                          '備考',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );

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
                                    'Person_in_charge_of_arrangements':
                                        FormControl<String>(value: ''), // 手配担当
                                    'Name_of_facility':
                                        FormControl<String>(value: ''), // 施設名
                                    'location':
                                        FormControl<String>(value: ''), // 所在地
                                    'Person_in_charge_name':
                                        FormControl<String>(value: ''), // 担当者名
                                    'telephone_number':
                                        FormControl<String>(value: ''), // 電話番号
                                    'remarks':
                                        FormControl<String>(value: ''), // 備考
                                    'Foreign_language_staff':
                                        FormControl<String>(
                                            value: ''), // 外国語スタッフ
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
                                      '患者を追加',
                                      style: TextStyle(
                                          color: context.appTheme.primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Divider(),
                      Text(
                        '立ち寄り施設',
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ReactiveForm(
                        formGroup:
                            formGroup.control('drop_in_facility') as FormGroup,
                        child: ColumnSeparated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName:
                                        'Person_in_charge_of_arrangements',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '手配担当',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(child: SizedBox()),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            ReactiveFormArray(
                              formArrayName: 'facility',
                              builder: (context, formArray, child) {
                                final rows = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                      (currentForm) => ReactiveForm(
                                        formGroup: currentForm,
                                        child: ColumnSeparated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: context.appTheme.spacing
                                                  .marginMedium,
                                            );
                                          },
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ReactiveTextField(
                                                    formControlName:
                                                        'Name_of_facility',
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        '施設名',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: ReactiveTextField(
                                                    formControlName: 'location',
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        '所在地',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ReactiveTextField(
                                                    formControlName:
                                                        'Person_in_charge_name',
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        '担当者名',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Expanded(
                                                  child: ReactiveTextField(
                                                    formControlName:
                                                        'telephone_number',
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        '電話番号',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ColumnSeparated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: rows.toList(),
                                    ),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    InkWell(
                                      onTap: () => formArray.add(FormGroup({
                                        'Name_of_facility': FormControl<String>(
                                            value: ''), // 施設名
                                        'location': FormControl<String>(
                                            value: ''), // 所在地
                                        'Person_in_charge_name':
                                            FormControl<String>(
                                                value: ''), // 担当者名
                                        'telephone_number': FormControl<String>(
                                            value: ''), // 電話番号
                                      })),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginSmall,
                                          ),
                                          Text(
                                            '施設を追加',
                                            style: TextStyle(
                                                color: context
                                                    .appTheme.primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context.read<FacilityModel>().submitData,
                    onListen: () {
                      final value =
                          context.read<FacilityModel>().submitData.value;
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
                        valueListenable:
                            context.watch<FacilityModel>().submitData,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<FacilityModel>()
                                          .submit(formGroup)
                                      : null,
                                  child: WithLoadingButton(
                                    isLoading: value.loading,
                                    child: Text('保存する'),
                                  ));
                            },
                          );
                        }),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
