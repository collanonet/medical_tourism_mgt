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

import 'related_parties_model.dart';

class RelatedPartiesScreen extends StatefulWidget {
  const RelatedPartiesScreen({super.key});

  @override
  State<RelatedPartiesScreen> createState() => _RelatedPartiesScreenState();
}

class _RelatedPartiesScreenState extends State<RelatedPartiesScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return ValueListenableBuilder(
      valueListenable: context.watch<RelatedPartiesModel>().submit,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: false,
          child: SingleChildScrollView(
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                );
              },
              children: [
                Text('ガイドまたは通訳者'),
                const SizedBox(
                  height: 20,
                ),
                ReactiveFormArray(
                  formArrayName: 'guide_or_interpreter',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(child: SizedBox()),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(child: SizedBox()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Date_from',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '年月日（自）',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text('〜'),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Date_to',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '年月日（至）',
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Guide_name_Kanji',
                                      decoration: InputDecoration(
                                        label: Text(
                                          'ガイド名（漢字）',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Guide_name_kana',
                                      decoration: InputDecoration(
                                        label: Text(
                                          'ガイド名（カナ）',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'telephone_number_1',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '電話番号',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('資格'),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'itinerary_management',
                                                title: const Text('旅程管理'),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'guide_interpreter',
                                                title: const Text('通訳案内士'),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            IntrinsicWidth(
                                              child: ReactiveCheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'medical_interpreter',
                                                title: const Text('医療通訳者'),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'report',
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        label: Text('報告書'),
                                      ),
                                    )),
                                  ],
                                ),
                                Text('同宿可否'),
                                Row(
                                  children: [
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                        formControlName:
                                            'Possibility_of_staying_together',
                                        value: true,
                                        title: const Text('同宿OK'),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                        formControlName:
                                            'Possibility_of_staying_together',
                                        value: false,
                                        title: const Text('同宿NG'),
                                      ),
                                    ),
                                  ],
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
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'location',
                                      decoration: InputDecoration(
                                        label: Text('所在地'),
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'telephone_number_2',
                                      decoration: InputDecoration(
                                        label: Text('電話番号'),
                                      ),
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColumnSeparated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: rows.toList(),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        InkWell(
                          onTap: () => formArray.add(FormGroup({
                            'Person_in_charge_of_arrangements':
                                FormControl<String>(value: ''), // 手配担当
                            'Date_from':
                                FormControl<String>(value: ''), // 年月日（自）
                            'Date_to': FormControl<String>(value: ''), // 年月日（至）
                            'Guide_name_Kanji':
                                FormControl<String>(value: ''), // ガイド名（漢字）
                            'Guide_name_kana':
                                FormControl<String>(value: ''), // ガイド名（カナ）
                            'telephone_number_1':
                                FormControl<String>(value: ''), // 電話番号
                            'qualification':
                                FormControl<String>(value: ''), // 資格
                            'report': FormControl<String>(value: ''), // 報告書
                            'Accommodation_possible':
                                FormControl<String>(value: ''), // 同宿可否
                            'Name_of_facility':
                                FormControl<String>(value: ''), // 施設名
                            'location': FormControl<String>(value: ''), // 所在地
                            'telephone_number_2':
                                FormControl<String>(value: ''), // 電話番号
                          })),
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
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                'ガイドを追加',
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
                  'バス会社',
                  style: context.textTheme.titleMedium,
                ),
                ReactiveForm(
                  formGroup: formGroup.control('bus_company') as FormGroup,
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
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'Bus_company_name',
                              decoration: InputDecoration(
                                label: Text(
                                  'バス会社名',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'manager',
                              decoration: InputDecoration(
                                label: Text(
                                  '担当者',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  'ドライバー',
                  style: context.textTheme.titleMedium,
                ),
                ReactiveFormArray(
                  formArrayName: 'driver',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                );
                              },
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'Date_from',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '年月日（自）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text('〜'),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'Date_to',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '年月日（至）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'car_number',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '車番',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('車種'),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'car_model',
                                                value: 'Alphard',
                                                title: const Text('アルファード'),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'car_model',
                                                value: 'Hiace',
                                                title: const Text('ハイエース'),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName: 'car_model',
                                                value: 'others',
                                                title: const Text('その他'),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Driver_name_Kanji',
                                      decoration: InputDecoration(
                                        label: Text(
                                          'ドライバー名（漢字）',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'Driver_name_kana',
                                      decoration: InputDecoration(
                                        label: Text(
                                          'ドライバー名（カナ）',
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'telephone_number_1',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '電話番号',
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('対応言語'),
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
                                            formControlName: 'korean',
                                            title: const Text('韓国語'),
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
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('同宿可否'),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'Possibility_of_staying_together',
                                                value: true,
                                                title: const Text('同宿OK'),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'Possibility_of_staying_together',
                                                value: false,
                                                title: const Text('同宿NG'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text('('),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('ホテル手配'),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'hotel_arrangements',
                                                value: true,
                                                title: const Text('仲介会社'),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                formControlName:
                                                    'hotel_arrangements',
                                                value: false,
                                                title: const Text('バス会社'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(')'),
                                  ],
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
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'location',
                                      decoration: InputDecoration(
                                        label: Text('所在地'),
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ReactiveTextField(
                                      formControlName: 'telephone_number_2',
                                      decoration: InputDecoration(
                                        label: Text('電話番号'),
                                      ),
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColumnSeparated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: rows.toList(),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        InkWell(
                          onTap: () => formArray.add(FormGroup({
                            'Date_from':
                                FormControl<String>(value: ''), // 年月日（自）
                            'Date_to': FormControl<String>(value: ''), // 年月日（至）
                            'car_number': FormControl<String>(value: ''), // 車番
                            'Car_model': FormControl<String>(value: ''), // 車種
                            'Driver_name_Kanji':
                                FormControl<String>(value: ''), // ドライバー名（漢字）
                            'Driver_name_kana':
                                FormControl<String>(value: ''), // ドライバー名（カナ）
                            'telephone_number_1':
                                FormControl<String>(value: ''), // 電話番号
                            'supported_language':
                                FormControl<String>(value: ''), // 対応言語
                            'Accommodation_possible':
                                FormControl<String>(value: ''), // 同宿可否
                            'Hotel_arrangement':
                                FormControl<String>(value: ''), // ホテル手配
                            'Name_of_facility':
                                FormControl<String>(value: ''), // 施設名
                            'location': FormControl<String>(value: ''), // 所在地
                            'telephone_number_2':
                                FormControl<String>(value: ''), // 電話番号
                          })),
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
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                'ドライバーを追加',
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
                  '緊急連絡先',
                  style: context.textTheme.titleMedium,
                ),
                ReactiveFormArray(
                  formArrayName: 'emergency_contact',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                );
                              },
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'Date_from',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '年月日（自）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text('〜'),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'Date_to',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '年月日（至）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName:
                                            'Person_in_charge_Kanji',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '担当者名（漢字）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName:
                                            'Person_in_charge_kana',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '担当者名（カナ）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'telephone_number',
                                        decoration: InputDecoration(
                                          label: Text(
                                            '電話番号',
                                          ),
                                        ),
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
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: rows.toList(),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        InkWell(
                          onTap: () => formArray.add(FormGroup({
                            'Date_from':
                                FormControl<String>(value: ''), // 年月日（自）
                            'Date_to': FormControl<String>(value: ''), // 年月日（至）
                            'Person_in_charge_Kanji':
                                FormControl<String>(value: ''), // 担当者名（漢字）
                            'Person_in_charge_kana':
                                FormControl<String>(value: ''), // 担当者名（カナ）
                            'telephone_number':
                                FormControl<String>(value: ''), // 電話番号
                          })),
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
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                '緊急連絡先を追加',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableListener(
                      valueListenable:
                          context.read<RelatedPartiesModel>().submit,
                      onListen: () {
                        final value =
                            context.read<RelatedPartiesModel>().submit.value;
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
                              context.watch<RelatedPartiesModel>().submit,
                          builder: (context, value, child) {
                            return ReactiveFormConsumer(
                              builder: (context, form, _) {
                                return ElevatedButton(
                                    onPressed: !value.loading && form.valid
                                        ? () => context
                                            .read<RelatedPartiesModel>()
                                            .submitData(form)
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
          ),
        );
      },
    );
  }
}
