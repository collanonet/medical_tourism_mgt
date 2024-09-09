// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_information_model.dart';

class AdditionalInformationSection extends StatefulWidget {
  const AdditionalInformationSection({super.key});

  @override
  State<AdditionalInformationSection> createState() =>
      _AdditionalInformationSectionState();
}

class _AdditionalInformationSectionState
    extends State<AdditionalInformationSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('additionalInformationSection') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().additionalInformationData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ReactiveForm(
              formGroup: formGroup,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.appTheme.spacing.formSpacing),
                children: [
                  Text(
                    'その他',
                    style: context.textTheme.bodyLarge,
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    separatorBuilder: (context, index) => SizedBox(
                      width: context.appTheme.spacing.formSpacing,
                    ),
                    children: [
                      ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                          children: [
                            Text(
                              '業務委託契約書',
                              style: context.textTheme.bodySmall,
                            ),
                            RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: (context, index) => SizedBox(
                                      width:
                                          context.appTheme.spacing.formSpacing,
                                    ),
                                children: [
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      formControlName: 'outsourcingContract',
                                      value: '締結済',
                                      onChanged: (value) {},
                                      title: Text(
                                        '締結済',
                                        style: context.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      formControlName: 'outsourcingContract',
                                      value: '未締結',
                                      onChanged: (value) {},
                                      title: Text(
                                        '未締結',
                                        style: context.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ])
                          ]),
                      ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 0,
                        ),
                        children: [
                          Text(
                            '契約書',
                            style: context.textTheme.bodySmall,
                          ),
                          ReactiveValueListenableBuilder<List<FileSelect>>(
                            formControlName: 'files',
                            builder: (context, control, _) {
                              return Wrap(
                                runSpacing:
                                    context.appTheme.spacing.marginMedium,
                                children: [
                                  ...control.value?.map((e) {
                                        return Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (e.url != null) {
                                                  openUrlInBrowser(
                                                      fileName: e.url!);
                                                }
                                              },
                                              child: Text(
                                                e.filename ??
                                                    'File Input .....',
                                                style:
                                                    context.textTheme.bodySmall,
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginExtraSmall,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // change file for this object in array
                                                filePicker().then((value) {
                                                  if (value != null) {
                                                    int? index = control.value
                                                        ?.indexWhere(
                                                            (element) =>
                                                                element
                                                                    .filename ==
                                                                e.filename);
                                                    logger.d('index: $index');
                                                    if (index != null) {
                                                      List<FileSelect> data =
                                                          control.value ?? [];
                                                      data[index] = value;
                                                      control.value = data;
                                                      setState(() {});
                                                      // formGroup.control('files').updateValue(data, updateParent: true, emitEvent: true);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Chip(
                                                label: const Text('変更する'),
                                                labelStyle: TextStyle(
                                                  color: context.appTheme
                                                      .secondaryBackgroundColor,
                                                ),
                                                backgroundColor: context
                                                    .appTheme.primaryColor,
                                              ),
                                            ),
                                          ],
                                        );
                                      }) ??
                                      [],
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            context.appTheme.primaryColor,
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        surfaceTintColor: Colors.transparent,
                                      ),
                                      onPressed: () {
                                        filePicker().then((value) {
                                          if (value != null) {
                                            control.value = [
                                              ...control.value ?? [],
                                              value
                                            ];
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.add_circle),
                                      label: Text('契約書を追加')),
                                ],
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.marginExtraSmall,
                          ),
                      children: [
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall),
                            children: [
                              Text(
                                'MS法人',
                                style: context.textTheme.bodyMedium,
                              ),
                              RowSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginExtraSmall,
                                      ),
                                  children: [
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName: 'msCorporation',
                                        value: 'あり',
                                        onChanged: (value) {},
                                        title: Text(
                                          'あり',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName: 'msCorporation',
                                        value: 'なし',
                                        onChanged: (value) {},
                                        title: Text(
                                          'なし',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ])
                            ]),
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Text(
                                '紹介手数料',
                                style: context.textTheme.bodyMedium,
                              ),
                              RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: (context, index) => SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                children: [
                                  IntrinsicWidth(
                                    stepWidth: 300,
                                    child: ReactiveTextField(
                                      formControlName: 'referralFee',
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        suffixText: '％',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Text(
                                '治療費の点数計算　１点あたり',
                                style: context.textTheme.bodyMedium,
                              ),
                              RowSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginExtraSmall,
                                      ),
                                  children: [
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName:
                                            'treatmentCostPointCalculationPerPoint',
                                        value: '10円',
                                        onChanged: (value) {},
                                        title: Text(
                                          '10円',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName:
                                            'treatmentCostPointCalculationPerPoint',
                                        value: '20円',
                                        onChanged: (value) {},
                                        title: Text(
                                          '20円',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName:
                                            'treatmentCostPointCalculationPerPoint',
                                        value: '30円',
                                        onChanged: (value) {},
                                        title: Text(
                                          '30円',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        formControlName:
                                            'treatmentCostPointCalculationPerPoint',
                                        value: 'その他',
                                        onChanged: (value) {},
                                        title: Text(
                                          'その他',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ])
                            ]),
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Text(
                                '備考',
                                style: context.textTheme.bodyMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'remark',
                                ),
                              ),
                            ])
                      ]),
                  RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          ),
                      children: [
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Text(
                                '支払いサイト',
                                style: context.textTheme.bodyMedium,
                              ),
                              RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: (context, index) => SizedBox(
                                  width: context.appTheme.spacing.formSpacing,
                                ),
                                children: [
                                  IntrinsicWidth(
                                    stepWidth: 300,
                                    child: ReactiveTextField(
                                      formControlName: 'paymentSiteTighten',
                                    ),
                                  ),
                                  Text(
                                    '締め',
                                    style: context.textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ]),
                        RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          ),
                          children: [
                            IntrinsicWidth(
                              stepWidth: 300,
                              child: ReactiveTextField(
                                formControlName: 'paymentSitePayment',
                              ),
                            ),
                            Text(
                              '支払い',
                              style: context.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ])
                ],
              ),
            ),
          );
        });
  }
}
