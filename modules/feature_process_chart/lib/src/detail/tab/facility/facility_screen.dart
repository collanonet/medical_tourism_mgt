import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
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
                      ValueListenableBuilder(
                          valueListenable: context
                              .watch<FacilityModel>()
                              .detailFacilityHotelData,
                          builder: (context, value, _) {
                            return Skeletonizer(
                              enabled: value.loading,
                              child: ReactiveFormArray(
                                formArrayName: 'Hotel',
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
                                                          'arrangePerson',
                                                      decoration:
                                                          const InputDecoration(
                                                        label: Text(
                                                          '手配担当',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium,
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium,
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ReactiveTextField(
                                                      formControlName:
                                                          'accommodationName',
                                                      decoration:
                                                          const InputDecoration(
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
                                                      formControlName:
                                                          'address',
                                                      decoration:
                                                          const InputDecoration(
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
                                                          'contactPersonName',
                                                      decoration:
                                                          const InputDecoration(
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
                                                          'phoneNumber',
                                                      decoration:
                                                          const InputDecoration(
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
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ReactiveTextField(
                                                      formControlName:
                                                          'remarks',
                                                      decoration:
                                                          const InputDecoration(
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text('外国語スタッフ'),
                                                      RowSeparated(
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return SizedBox(
                                                            width: context
                                                                .appTheme
                                                                .spacing
                                                                .marginMedium,
                                                          );
                                                        },
                                                        children: [
                                                          IntrinsicWidth(
                                                            child:
                                                                ReactiveCheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              formControlName:
                                                                  'japanese',
                                                              title: const Text(
                                                                  '日本語'),
                                                            ),
                                                          ),
                                                          IntrinsicWidth(
                                                            child:
                                                                ReactiveCheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              formControlName:
                                                                  'chinese',
                                                              title: const Text(
                                                                  '中国語'),
                                                            ),
                                                          ),
                                                          IntrinsicWidth(
                                                            child:
                                                                ReactiveCheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              formControlName:
                                                                  'vietnamese',
                                                              title: const Text(
                                                                  'ベトナム語'),
                                                            ),
                                                          ),
                                                          IntrinsicWidth(
                                                            child:
                                                                ReactiveCheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              formControlName:
                                                                  'english',
                                                              title: const Text(
                                                                  '英語'),
                                                            ),
                                                          ),
                                                          IntrinsicWidth(
                                                            child:
                                                                ReactiveCheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              formControlName:
                                                                  'others',
                                                              title: const Text(
                                                                  'その他'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 250,
                                                            child:
                                                                ReactiveTextField(
                                                              formControlName:
                                                                  'other',
                                                              decoration:
                                                                  const InputDecoration(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        height: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      InkWell(
                                        onTap: () => formArray.add(
                                          FormGroup(
                                            {
                                              '_id': FormControl<String>(),
                                              // ID
                                              'arrangePerson':
                                                  FormControl<String>(
                                                      value: ''),
                                              // 手配担当
                                              'accommodationName':
                                                  FormControl<String>(
                                                      value: ''),
                                              // 施設名
                                              'address': FormControl<String>(
                                                  value: ''),
                                              // 所在地
                                              'contactPersonName':
                                                  FormControl<String>(
                                                      value: ''),
                                              // 担当者名
                                              'phoneNumber':
                                                  FormControl<String>(
                                                      value: ''),
                                              // 電話番号
                                              'remarks': FormControl<String>(
                                                  value: ''),
                                              // 備考
                                              'foreignLanguageStaff':
                                                  FormControl<List<String>>(
                                                      value: []),
                                              // 外国語スタッフ
                                              'japanese': FormControl<bool>(
                                                  value: false),
                                              //
                                              'chinese': FormControl<bool>(
                                                  value: false),
                                              //
                                              'vietnamese': FormControl<bool>(
                                                  value: false),
                                              //
                                              'english': FormControl<bool>(
                                                  value: false),
                                              //
                                              'others': FormControl<bool>(
                                                  value: false),
                                              'other': FormControl<String>(
                                                  value: ''),
                                              //
                                              'tour': FormControl<String>(
                                                  value: ''),
                                              // ツアー
                                            },
                                          ),
                                        ),
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
                                              'ホテルを追加',
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
                            );
                          }),
                      const Divider(),
                      Text(
                        '立ち寄り施設',
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      ValueListenableBuilder(
                          valueListenable:
                              context.watch<FacilityModel>().dropInFacilityData,
                          builder: (context, value, _) {
                            return Skeletonizer(
                              enabled: value.loading,
                              child: ReactiveForm(
                                formGroup: formGroup.control('drop_in_facility')
                                    as FormGroup,
                                child: ColumnSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    );
                                  },
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'arrangePerson',
                                            decoration: const InputDecoration(
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
                                        const Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Expanded(child: SizedBox()),
                                      ],
                                    ),
                                    ReactiveFormArray(
                                      formArrayName: 'places',
                                      builder: (context, formArray, child) {
                                        final rows = formArray.controls
                                            .map((control) =>
                                                control as FormGroup)
                                            .map(
                                              (currentForm) => ReactiveForm(
                                                formGroup: currentForm,
                                                child: ColumnSeparated(
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return SizedBox(
                                                      height: context.appTheme
                                                          .spacing.marginMedium,
                                                    );
                                                  },
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              ReactiveTextField(
                                                            formControlName:
                                                                'accommodationName',
                                                            decoration:
                                                                const InputDecoration(
                                                              label: Text(
                                                                '施設名',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginMedium,
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child:
                                                              ReactiveTextField(
                                                            formControlName:
                                                                'address',
                                                            decoration:
                                                                const InputDecoration(
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
                                                          child:
                                                              ReactiveTextField(
                                                            formControlName:
                                                                'contactPersonName',
                                                            decoration:
                                                                const InputDecoration(
                                                              label: Text(
                                                                '担当者名',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginMedium,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              ReactiveTextField(
                                                            formControlName:
                                                                'phoneNumber',
                                                            decoration:
                                                                const InputDecoration(
                                                              label: Text(
                                                                '電話番号',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginMedium,
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: SizedBox(
                                                            width: context
                                                                .appTheme
                                                                .spacing
                                                                .marginMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ColumnSeparated(
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                );
                                              },
                                              children: rows.toList(),
                                            ),
                                            SizedBox(
                                              height: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  formArray.add(FormGroup({
                                                '_id':
                                                    FormControl<String>(), // ID
                                                'accommodationName':
                                                    FormControl<String>(
                                                        value: ''), // 施設名
                                                'address': FormControl<String>(
                                                    value: ''), // 所在地
                                                'contactPersonName':
                                                    FormControl<String>(
                                                        value: ''), // 担当者名
                                                'phoneNumber':
                                                    FormControl<String>(
                                                        value: ''), // 電話番号
                                                'tour': FormControl<
                                                    String>(), // ツアー
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
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginSmall,
                                                  ),
                                                  Text(
                                                    '施設を追加',
                                                    style: TextStyle(
                                                        color: context.appTheme
                                                            .primaryColor),
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
                              ),
                            );
                          })
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
                        builder: (context, value, _) {
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
                                    child: const Text('保存する'),
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
