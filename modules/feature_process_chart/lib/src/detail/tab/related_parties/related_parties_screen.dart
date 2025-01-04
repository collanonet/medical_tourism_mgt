import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
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
          enabled: value.loading,
          child: SingleChildScrollView(
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                );
              },
              children: [
                const Text('ガイドまたは通訳者'),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable:
                      context.watch<RelatedPartiesModel>().partiesData,
                  builder: (context, value, _) {
                    return Skeletonizer(
                      enabled: value.loading,
                      child: ReactiveFormArray(
                        formArrayName: 'guideInterpreter',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: ColumnSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Row(
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（自）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                    formControlName: 'dateFrom',
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Text('〜'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（至）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                    formControlName: 'dateTo',
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'guideNamaKanji',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                'ガイド名（漢字）',
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'guideNameKana',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                'ガイド名（カナ）',
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'phoneNumber',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '電話番号',
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('資格'),
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
                                                          'itinerary_management',
                                                      title: const Text('旅程管理'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'guide_interpreter',
                                                      title:
                                                          const Text('通訳案内士'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveCheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'medical_interpreter',
                                                      title:
                                                          const Text('医療通訳者'),
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
                                            decoration: const InputDecoration(
                                              label: Text('報告書'),
                                            ),
                                          )),
                                        ],
                                      ),
                                      const Text('同宿可否'),
                                      Row(
                                        children: [
                                          IntrinsicWidth(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName:
                                                  'accommodationAvailability',
                                              value: '同宿OK',
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
                                                  'accommodationAvailability',
                                              value: '同宿NG',
                                              title: const Text('同宿NG'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName:
                                                'accommodationName',
                                            decoration: const InputDecoration(
                                              label: Text('施設名'),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'address',
                                            decoration: const InputDecoration(
                                              label: Text('所在地'),
                                            ),
                                          )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'phoneNumber2',
                                            decoration: const InputDecoration(
                                              label: Text('電話番号'),
                                            ),
                                          )),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Divider(),
                                      )
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
                                onTap: () => formArray.add(FormGroup(
                                  {
                                    'id': FormControl<String>(),
                                    // ID
                                    'arrangePerson':
                                        FormControl<String>(value: ''),
                                    // 手配担当
                                    'dateFrom': FormControl<DateTime>(),
                                    // 年月日（自）
                                    'dateTo': FormControl<DateTime>(),
                                    // 年月日（至）
                                    'guideNamaKanji':
                                        FormControl<String>(value: ''),
                                    // ガイド名（漢字）
                                    'guideNameKana':
                                        FormControl<String>(value: ''),
                                    // ガイド名（カナ）
                                    'phoneNumber':
                                        FormControl<String>(value: ''),
                                    // 電話番号
                                    'qualification':
                                        FormControl<List<String>>(value: []),
                                    // 資格
                                    'report': FormControl<String>(value: ''),
                                    // 報告書
                                    'accommodationAvailability':
                                        FormControl<String>(value: ''),
                                    // 同宿可否
                                    'accommodationName':
                                        FormControl<String>(value: ''),
                                    // 施設名
                                    'address': FormControl<String>(value: ''),
                                    // 所在地
                                    'phoneNumber2':
                                        FormControl<String>(value: ''),
                                    //qualification
                                    'itinerary_management':
                                        FormControl<bool>(value: false),
                                    'guide_interpreter':
                                        FormControl<bool>(value: false),
                                    'medical_interpreter':
                                        FormControl<bool>(value: false),
                                    'tour': FormControl<String>(),
                                  },
                                )),
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
                    );
                  },
                ),
                const Divider(),
                Text(
                  'バス会社',
                  style: context.textTheme.titleMedium,
                ),
                ValueListenableBuilder(
                  valueListenable:
                      context.watch<RelatedPartiesModel>().busCompanyData,
                  builder: (context, value, _) {
                    return Skeletonizer(
                      enabled: value.loading,
                      child: ReactiveForm(
                        formGroup: formGroup.control('busCompany') as FormGroup,
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
                                    formControlName: 'arrangePerson',
                                    decoration: const InputDecoration(
                                      label: Text(
                                        '手配担当',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                const Expanded(child: SizedBox()),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'busCompanyName',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'contactPerson',
                                    decoration: const InputDecoration(
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
                    );
                  },
                ),
                Text(
                  'ドライバー',
                  style: context.textTheme.titleMedium,
                ),
                ValueListenableBuilder(
                  valueListenable:
                      context.watch<RelatedPartiesModel>().partiesDriverData,
                  builder: (context, value, _) {
                    return Skeletonizer(
                      enabled: value.loading,
                      child: ReactiveFormArray(
                        formArrayName: 'driver',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: ColumnSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（至）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                    formControlName:
                                                        'dateYearFrom',
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Text('〜'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（至）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                    formControlName:
                                                        'dateYearTo',
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 30),
                                                ReactiveTextField(
                                                  formControlName: 'carNumber',
                                                  decoration:
                                                      const InputDecoration(
                                                    label: Text(
                                                      '車番',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('車種'),
                                              Row(
                                                children: [
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'vehicleType',
                                                      value: 'アルファード',
                                                      title:
                                                          const Text('アルファード'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'vehicleType',
                                                      value: 'ハイエース',
                                                      title:
                                                          const Text('ハイエース'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'vehicleType',
                                                      value: 'その他',
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
                                            formControlName: 'driverNamaKanji',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                'ドライバー名（漢字）',
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'driverNameKana',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                'ドライバー名（カナ）',
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'phoneNumber',
                                            decoration: const InputDecoration(
                                              label: Text(
                                                '電話番号',
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('対応言語'),
                                          RowSeparated(
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginMedium,
                                              );
                                            },
                                            children: [
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'japanese',
                                                  title: const Text('日本語'),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'chinese',
                                                  title: const Text('中国語'),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'vietnamese',
                                                  title: const Text('ベトナム語'),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'english',
                                                  title: const Text('英語'),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'korean',
                                                  title: const Text('韓国語'),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'thai',
                                                  title: const Text('タイ語'),
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
                                              const Text('同宿可否'),
                                              Row(
                                                children: [
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'accommodationAvailability',
                                                      value: '同宿OK',
                                                      title: const Text('同宿OK'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'accommodationAvailability',
                                                      value: '同宿NG',
                                                      title: const Text('同宿NG'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 18),
                                            child: Text('('),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('ホテル手配'),
                                              Row(
                                                children: [
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'hotelArrangement',
                                                      value: '仲介会社',
                                                      title: const Text('仲介会社'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      formControlName:
                                                          'hotelArrangement',
                                                      value: 'バス会社',
                                                      title: const Text('バス会社'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 18),
                                            child: Text(')'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName:
                                                'accommodationName',
                                            decoration: const InputDecoration(
                                              label: Text('施設名'),
                                            ),
                                          )),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'address',
                                            decoration: const InputDecoration(
                                              label: Text('所在地'),
                                            ),
                                          )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ReactiveTextField(
                                            formControlName: 'phoneNumber2',
                                            decoration: const InputDecoration(
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
                                onTap: () => formArray.add(FormGroup(
                                  {
                                    'id': FormControl<String>(),
                                    // ID
                                    'dateYearFrom': FormControl<DateTime>(),
                                    // 年月日（自）
                                    'dateYearTo': FormControl<DateTime>(),
                                    // 年月日（至）
                                    'carNumber': FormControl<int>(),
                                    // 車番
                                    'vehicleType':
                                        FormControl<String>(value: ''),
                                    // 車種
                                    'driverNamaKanji':
                                        FormControl<String>(value: ''),
                                    // ドライバー名（漢字）
                                    'driverNameKana':
                                        FormControl<String>(value: ''),
                                    // ドライバー名（カナ）
                                    'phoneNumber':
                                        FormControl<String>(value: ''),
                                    // 電話番号
                                    'language':
                                        FormControl<List<String>>(value: []),
                                    // 対応言語
                                    'accommodationAvailability':
                                        FormControl<String>(value: ''),
                                    // 同宿可否
                                    'hotelArrangement':
                                        FormControl<String>(value: ''),
                                    // ホテル手配
                                    'accommodationName':
                                        FormControl<String>(value: ''),
                                    // 施設名
                                    'address': FormControl<String>(value: ''),
                                    // 所在地
                                    'phoneNumber2':
                                        FormControl<String>(value: ''),
                                    //language
                                    'japanese': FormControl<bool>(value: false),
                                    'chinese': FormControl<bool>(value: false),
                                    'vietnamese':
                                        FormControl<bool>(value: false),
                                    'english': FormControl<bool>(value: false),
                                    'korean': FormControl<bool>(value: false),
                                    'thai': FormControl<bool>(value: false),
                                    'tour': FormControl<String>(),
                                  },
                                )),
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
                    );
                  },
                ),
                const Divider(),
                Text(
                  '緊急連絡先',
                  style: context.textTheme.titleMedium,
                ),
                ValueListenableBuilder(
                  valueListenable:
                      context.watch<RelatedPartiesModel>().emergencyContactData,
                  builder: (context, value, _) {
                    return Skeletonizer(
                      enabled: value.loading,
                      child: ReactiveFormArray(
                        formArrayName: 'emergencyContact',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: ColumnSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（至）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                    formControlName:
                                                        'dateYearFrom',
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Text('〜'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ColumnSeparated(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    height: 8);
                                              },
                                              children: [
                                                Text(
                                                  '年月日（至）',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                                const ReactiveDatePickerField(
                                                  formControlName: 'dateYearTo',
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 30),
                                                ReactiveTextField(
                                                  formControlName:
                                                      'contactPersonNamaKanji',
                                                  decoration:
                                                      const InputDecoration(
                                                    label: Text(
                                                      '担当者名（漢字）',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 30),
                                                ReactiveTextField(
                                                  formControlName:
                                                      'contactPersonNameKana',
                                                  decoration:
                                                      const InputDecoration(
                                                    label: Text(
                                                      '担当者名（カナ）',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 30),
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
                                              ],
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
                                onTap: () => formArray.add(FormGroup(
                                  {
                                    'id': FormControl<String>(),
                                    // ID
                                    'dateYearFrom': FormControl<DateTime>(),
                                    // 年月日（自）
                                    'dateYearTo': FormControl<DateTime>(),
                                    // 年月日（至）
                                    'contactPersonNamaKanji':
                                        FormControl<String>(value: ''),
                                    // 担当者名（漢字）
                                    'contactPersonNameKana':
                                        FormControl<String>(value: ''),
                                    // 担当者名（カナ）
                                    'phoneNumber':
                                        FormControl<String>(value: ''),
                                    // 電話番号
                                    'tour': FormControl<String>(),
                                  },
                                )),
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
                          builder: (context, value, _) {
                            return ReactiveFormConsumer(
                              builder: (context, form, _) {
                                return ElevatedButton(
                                    onPressed: !value.loading && form.valid
                                        ? () => context
                                            .read<RelatedPartiesModel>()
                                            .submitData(formGroup)
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
          ),
        );
      },
    );
  }
}
