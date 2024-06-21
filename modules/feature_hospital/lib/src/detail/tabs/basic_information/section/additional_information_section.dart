import 'dart:html';

import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_information_model.dart';

class AdditionalInformationSection extends StatefulWidget {
  const AdditionalInformationSection({super.key});

  @override
  State<AdditionalInformationSection> createState() =>
      _AdditionalInformationSectionState();
}

class _AdditionalInformationSectionState
    extends State<AdditionalInformationSection> {
  FileSelect? fileSelect;
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.formSpacing,
                                      ),
                                  children: [
                                    IntrinsicWidth(
                                      stepWidth: 2,
                                      child: ReactiveRadioListTile(
                                        formControlName: 'outsourcingContract',
                                        value: '締結済',
                                        onChanged: (value) {},
                                        title: Text(
                                          "締結済",
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 2,
                                      child: ReactiveRadioListTile(
                                        formControlName: 'outsourcingContract',
                                        value: '未締結',
                                        onChanged: (value) {},
                                        title: Text(
                                          "未締結",
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ])
                            ]),
                        ColumnSeparated(
                            mainAxisAlignment: MainAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height: context.appTheme.spacing.formSpacing,
                                ),
                            children: [
                              Text(
                                '契約書',
                                style: context.textTheme.bodySmall,
                              ),
                              RowSeparated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.formSpacing,
                                      ),
                                  children: [
                                    RowSeparated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginExtraSmall,
                                            ),
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                filePicker().then((value) =>
                                                    setState(() =>
                                                        fileSelect = value));
                                              },
                                              icon: Icon(
                                                CupertinoIcons.paperclip,
                                                color: context
                                                    .appTheme.primaryColor,
                                              )),
                                          fileSelect != null
                                              ? Text(fileSelect!.filename)
                                              : Text(
                                                  'File Input .....',
                                                  style: context
                                                      .textTheme.bodySmall,
                                                ),
                                        ]),
                                    Chip(
                                      label: const Text('変更する'),
                                      labelStyle: TextStyle(
                                        color: context
                                            .appTheme.secondaryBackgroundColor,
                                      ),
                                      backgroundColor:
                                          context.appTheme.primaryColor,
                                    ),
                                  ])
                            ])
                      ]),
                  RowSeparated(
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginExtraSmall,
                                      ),
                                  children: [
                                    IntrinsicWidth(
                                      stepWidth: 2,
                                      child: ReactiveRadioListTile(
                                        formControlName: 'msCorporation',
                                        value: 'あり',
                                        onChanged: (value) {},
                                        title: Text(
                                          "あり",
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 2,
                                      child: ReactiveRadioListTile(
                                        formControlName: 'msCorporation',
                                        value: 'なし',
                                        onChanged: (value) {},
                                        title: Text(
                                          "なし",
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
                                separatorBuilder: (context, index) => SizedBox(
                                  width:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                                children: [
                                  IntrinsicWidth(
                                    stepWidth: 200,
                                    child: ReactiveTextField(
                                      formControlName: 'referralFee',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Text('％', style: context.textTheme.bodySmall),
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
                                          "10円",
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
                                          "20円",
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
                                          "30円",
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
                                          "その他",
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
                                stepWidth: 200,
                                child: ReactiveTextField(
                                  formControlName: 'remark',
                                ),
                              ),
                            ])
                      ]),
                  RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                              IntrinsicWidth(
                                stepWidth: 100,
                                child: ReactiveTextField(
                                  formControlName: 'paymentSiteTighten',
                                ),
                              ),
                            ]),
                        RowSeparated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          ),
                          children: [
                            IntrinsicWidth(
                              stepWidth: 100,
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
