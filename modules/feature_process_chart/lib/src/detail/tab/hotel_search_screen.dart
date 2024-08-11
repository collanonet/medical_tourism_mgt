import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'hotel_registration_model.dart';

class HotelSearchScreen extends StatefulWidget {
  const HotelSearchScreen({super.key});

  @override
  State<HotelSearchScreen> createState() => _HotelSearchScreenState();
}

class _HotelSearchScreenState extends State<HotelSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup);

    return ValueListenableBuilder(
      valueListenable: context.read<HotelRegistrationModel>().hotelregisterData,
      builder: (context, value, child) {
        return Skeletonizer(
          enabled: value.loading,
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.appTheme.spacing.marginMedium,
              );
            },
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                            context.appTheme.spacing.marginMedium),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                            context.appTheme.spacing.borderRadiusMedium,
                          ),
                        ),
                        child: ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginSmall,
                            );
                          },
                          children: [
                            Text(
                              'ホテル検索',
                              style: context.textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'accommodationName',
                                    decoration: const InputDecoration(
                                      label: Text('施設名'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('タイプ'),
                                    Row(
                                      children: [
                                        IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            formControlName: 'hotel',
                                            title: const Text('ホテル'),
                                          ),
                                        ),
                                        IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            formControlName: 'apartment_hotel',
                                            title: const Text('民泊/アパートメントホテル'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('利用実績'),
                                    Row(
                                      children: [
                                        IntrinsicWidth(
                                          stepWidth: 30,
                                          child: ReactiveRadioListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            value: true,
                                            formControlName: 'usageRecord',
                                            title: const Text('あり'),
                                          ),
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 30,
                                          child: ReactiveRadioListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            value: false,
                                            formControlName: 'usageRecord',
                                            title: const Text('なし'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ReactiveTextField(
                                  formControlName: 'area',
                                  decoration: InputDecoration(
                                    label: Text('エリア'),
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('対応言語'),
                                    Row(
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
                                            formControlName: 'isKorean',
                                            title: const Text('韓国語'),
                                          ),
                                        ),
                                        IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            formControlName: 'isThai',
                                            title: const Text('タイ語'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                ReactiveFormConsumer(
                                  builder: (context, form, _) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HotelRegistrationModel>()
                                            .fetchHotelregister(
                                              accommodationName: formGroup
                                                  .control('accommodationName')
                                                  .value,
                                              usageRecord: formGroup
                                                  .control('usageRecord')
                                                  .value,
                                              area: formGroup
                                                  .control('area')
                                                  .value,
                                              isJapanese: formGroup
                                                  .control('isJapanese')
                                                  .value,
                                              isChinese: formGroup
                                                  .control('isChinese')
                                                  .value,
                                              isVietnamese: formGroup
                                                  .control('isVietnamese')
                                                  .value,
                                              isEnglish: formGroup
                                                  .control('isEnglish')
                                                  .value,
                                              isKorean: formGroup
                                                  .control('isKorean')
                                                  .value,
                                              isThai: formGroup
                                                  .control('isThai')
                                                  .value,
                                            );
                                      },
                                      child: Text('検索する'),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '検索結果',
                            style: context.textTheme.titleMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('新規登録する')),
                        ],
                      ),
                      ListView.separated(
                        itemCount: value.data!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            decoration: index % 2 != 0
                                ? null
                                : BoxDecoration(
                                    color: context.appTheme.primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                      context
                                          .appTheme.spacing.borderRadiusMedium,
                                    ),
                                  ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColumnSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height:
                                          context.appTheme.spacing.marginSmall,
                                    );
                                  },
                                  children: [
                                    Row(
                                      children: [
                                        Text(value.data?[index]
                                                .accommodationName ??
                                            ''),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
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
                                        Icon(
                                          Icons.star,
                                          color: context.appTheme.primaryColor,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            '住所：${value.data?[index].address}'),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Text(
                                            'TEL：${value.data?[index].phoneNumber}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('対応言語：'),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Icon(Icons.check,
                                            color: Colors.green),
                                        Text(value.data?[index].isJapanese ==
                                                true
                                            ? '日本語'
                                            : ''),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        const Icon(Icons.check,
                                            color: Colors.green),
                                        Text(
                                            value.data?[index].isChinese == true
                                                ? '中国語'
                                                : ''),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Icon(Icons.check, color: Colors.green),
                                        Text('タイ語')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'メモ：${value.data?[index].accommodationMemo}'),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text('このホテルを工程表へ追加')),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
