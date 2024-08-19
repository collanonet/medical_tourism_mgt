import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup);
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
                                  formControlName: 'accommodationName',
                                  decoration: const InputDecoration(
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
                                  formControlName: 'address',
                                  decoration: const InputDecoration(
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
                                  formControlName: 'contactPersonName',
                                  decoration: const InputDecoration(
                                    labelText: '担当者名',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'phoneNumber',
                                  decoration: const InputDecoration(
                                    labelText: '電話番号',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'ratePerNight',
                                  decoration: const InputDecoration(
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
                                  formControlName: 'accommodationMemo',
                                  decoration: const InputDecoration(
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
                                  const Text('外国語スタッフ'),
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
                                          formControlName: 'isJapanese',
                                          title: const Text('日本語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'isChinese',
                                          title: const Text('中国語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'isVietnamese',
                                          title: const Text('ベトナム語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'isEnglish',
                                          title: const Text('英語'),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'isOthers',
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
                                  formControlName: 'other',
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('評価'),
                              SizedBox(
                                height: context.appTheme.spacing.marginSmall,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: _rating,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    unratedColor: Colors.blue[100],
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.blue,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        _rating = rating;
                                        formGroup.control('evaluation').value = _rating;
                                      });
                                    },
                                    updateOnDrag: true,
                                  )
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
