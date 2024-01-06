import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HotelRegistrationScreen extends StatefulWidget {
  const HotelRegistrationScreen({super.key});

  @override
  State<HotelRegistrationScreen> createState() =>
      _HotelRegistrationScreenState();
}

class _HotelRegistrationScreenState extends State<HotelRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        SizedBox(
                          height: context.appTheme.spacing.marginSmall,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey),
                              ),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text('日本語'),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey),
                              ),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text('中国語'),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey),
                              ),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text('ベトナム語'),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey),
                              ),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text('英語'),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.grey),
                              ),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text('韓国語'),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
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
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
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
          )
        ],
      ),
    );
  }
}
