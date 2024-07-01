import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'hotel_registration_model.dart';

class HotelRegistrationScreen extends StatefulWidget {
  const HotelRegistrationScreen({super.key});

  @override
  State<HotelRegistrationScreen> createState() =>
      _HotelRegistrationScreenState();
}

class _HotelRegistrationScreenState extends State<HotelRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          context.watch<HotelRegistrationModel>().submitHotelRegisterData,
      builder: (context, value, child) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                        color: Colors.grey[200],
                      ),
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          );
                        },
                        children: [
                          Text(
                            'ホテル',
                            style: context.textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'Name_of_facility',
                                  decoration: InputDecoration(
                                    labelText: '施設名',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                flex: 2,
                                child: ReactiveTextField(
                                  formControlName: 'location',
                                  decoration: InputDecoration(
                                    labelText: '所在地',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'Person_in_charge_name',
                                  decoration: InputDecoration(
                                    labelText: '担当者名',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'telephone_number',
                                  decoration: InputDecoration(
                                    labelText: '電話番号',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: '1_night_price',
                                  decoration: InputDecoration(
                                    labelText: '1泊の料金',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'Accommodation_memo',
                                  decoration: InputDecoration(
                                    labelText: '宿泊メモ',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('外国語スタッフ'),
                                  RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: [
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'japanese',
                                          title: const Text('日本語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'chinese',
                                          title: const Text('中国語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'vietnamese',
                                          title: const Text('ベトナム語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'english',
                                          title: const Text('英語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'other',
                                          title: const Text('その他'),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              IntrinsicWidth(
                                stepWidth: 200,
                                child: ReactiveTextField(
                                  formControlName: 'Foreign_language_staff',
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('評価'),
                              SizedBox(
                                height: context.appTheme.spacing.marginSmall,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: context.appTheme.primaryColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context
                        .read<HotelRegistrationModel>()
                        .submitHotelRegisterData,
                    onListen: () {
                      final value = context
                          .read<HotelRegistrationModel>()
                          .submitHotelRegisterData
                          .value;
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
                        valueListenable: context
                            .watch<HotelRegistrationModel>()
                            .submitHotelRegisterData,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<HotelRegistrationModel>()
                                          .submitHotelRegister(form)
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
