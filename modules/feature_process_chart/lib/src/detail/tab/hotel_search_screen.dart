import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'hotel_search_model.dart';

class HotelSearchScreen extends StatefulWidget {
  const HotelSearchScreen({super.key});

  @override
  State<HotelSearchScreen> createState() => _HotelSearchScreenState();
}

class _HotelSearchScreenState extends State<HotelSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.watch<HotelSearchModel>().submitHotelSearchData,
      builder: (context, value, child) {
        return ColumnSeparated(
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
                      padding:
                          EdgeInsets.all(context.appTheme.spacing.marginMedium),
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
                              Expanded(
                                  child: ReactiveTextField(
                                formControlName: 'Name_of_facility',
                                decoration: InputDecoration(
                                  label: Text('施設名'),
                                ),
                              )),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('タイプ'),
                                  Row(
                                    children: [
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('ホテル'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('民泊/アパートメントホテル'),
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
                                      RadioMenuButton(
                                        value: 'あり',
                                        groupValue: 'あり',
                                        onChanged: (value) {},
                                        child: Text('あり'),
                                      ),
                                      RadioMenuButton(
                                        value: 'あり',
                                        groupValue: 'あり',
                                        onChanged: (value) {},
                                        child: Text('なし'),
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
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('日本語'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('中国語'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('ベトナム語'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('英語'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('韓国語'),
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        checkColor: Colors.white,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Text('タイ語'),
                                    ],
                                  )
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('検索する')),
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
                        ElevatedButton(onPressed: () {}, child: Text('新規登録する')),
                      ],
                    ),
                    ListView.separated(
                      itemCount: 10,
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
                                    context.appTheme.spacing.borderRadiusMedium,
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
                                      Text('Aranvert Hotel Kyoto'),
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
                                      Text('住所：京都府京都市下京区東錺屋町179'),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Text('TEL：075-365-5111')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('対応言語：'),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                      Text('日本語'),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                      Text('中国語'),
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
                                          '住所：メモ：2020年9月は、スタンダードルーム１泊20,000円で宿泊できました。'),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableListener(
                  valueListenable:
                      context.read<HotelSearchModel>().submitHotelSearchData,
                  onListen: () {
                    final value = context
                        .read<HotelSearchModel>()
                        .submitHotelSearchData
                        .value;
                    if (value.hasData) {
                      logger.d('loading');
                      snackBarWidget(
                        message: '正常に保存されました',
                        prefixIcon:
                            const Icon(Icons.check_circle, color: Colors.white),
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
                          .watch<HotelSearchModel>()
                          .submitHotelSearchData,
                      builder: (context, value, child) {
                        return ReactiveFormConsumer(
                          builder: (context, form, _) {
                            return ElevatedButton(
                                onPressed: !value.loading && form.valid
                                    ? () => context
                                        .read<HotelSearchModel>()
                                        .submitHotelSearch(form)
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
        );
      },
    );
  }
}
