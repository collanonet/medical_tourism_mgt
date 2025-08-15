// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'proposal_estimate_model.dart';

class ProposalEstimateScreenForm extends StatelessWidget {
  const ProposalEstimateScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (context, form, _) {
      return ValueListenableBuilder(
          valueListenable: context.watch<ProposalEstimateModel>().editData,
          builder: (context, editData, _) {
            return Skeletonizer(
              enabled: editData.loading,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: context.appTheme.spacing.formSpacing);
                },
                children: [
                  Text('お見積りフォーム', style: context.textTheme.titleLarge),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: context.appTheme.spacing.formSpacing);
                    },
                    children: [
                      // logoFile
                      ReactiveValueListenableBuilder<FileSelect>(
                          formControlName: 'logoFile',
                          builder: (context, control, child) {
                            var logoFile = control.value;
                            return InkWell(
                              onTap: () {
                                filePicker().then((value) {
                                  form.control('logoFile').value = value;
                                });
                              },
                              child: Container(
                                width: 250,
                                height: 250,
                                padding: EdgeInsets.all(
                                  context.appTheme.spacing.marginExtraLarge,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(
                                    context.appTheme.spacing.borderRadiusMedium,
                                  )),
                                  border: Border.all(
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                                child: logoFile != null && logoFile.file != null
                                    ? Image.memory(
                                        logoFile.file!,
                                        fit: BoxFit.fill,
                                      )
                                    : logoFile != null && logoFile.url != null
                                        ? Avatar.network(
                                            logoFile.url,
                                            placeholder: const AssetImage(
                                              Images.logoMadical,
                                              package: 'core_ui',
                                            ),
                                            shape: BoxShape.rectangle,
                                            customSize: const Size(200, 380),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.copy_all_rounded,
                                                size: 50,
                                                color: context
                                                    .appTheme.primaryColor,
                                              ),
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                              Text(
                                                'ロゴをアップロードする',
                                                style: context
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  filePicker().then(
                                                    (value) {
                                                      form
                                                          .control('logoFile')
                                                          .value = value;
                                                    },
                                                  );
                                                },
                                                child: const Text(
                                                  '画像を選択',
                                                ),
                                              )
                                            ],
                                          ),
                              ),
                            );
                          }),
                      // stampFile
                      ReactiveValueListenableBuilder<FileSelect>(
                          formControlName: 'stampFile',
                          builder: (context, control, child) {
                            var stampFile = control.value;
                            return InkWell(
                              onTap: () {
                                filePicker().then((value) {
                                  form.control('stampFile').value = value;
                                });
                              },
                              child: Container(
                                width: 250,
                                height: 250,
                                padding: EdgeInsets.all(
                                  context.appTheme.spacing.marginExtraLarge,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(
                                    context.appTheme.spacing.borderRadiusMedium,
                                  )),
                                  border: Border.all(
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                                child: stampFile != null &&
                                        stampFile.file != null
                                    ? Image.memory(
                                        stampFile.file!,
                                        fit: BoxFit.fill,
                                      )
                                    : stampFile != null && stampFile.url != null
                                        ? Avatar.network(
                                            stampFile.url,
                                            placeholder: const AssetImage(
                                              Images.logoMadical,
                                              package: 'core_ui',
                                            ),
                                            shape: BoxShape.rectangle,
                                            customSize: const Size(200, 380),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.copy_all_rounded,
                                                size: 50,
                                                color: context
                                                    .appTheme.primaryColor,
                                              ),
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                              Text(
                                                'スタンプをアップロードする',
                                                style: context
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginMedium,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  filePicker().then(
                                                    (value) {
                                                      form
                                                          .control('stampFile')
                                                          .value = value;
                                                    },
                                                  );
                                                },
                                                child: const Text(
                                                  '画像を選択',
                                                ),
                                              )
                                            ],
                                          ),
                              ),
                            );
                          }),
                    ],
                  ),

                  Text('情報', style: context.textTheme.titleLarge),

                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: context.appTheme.spacing.formSpacing);
                    },
                    children: [
                      // invoiceNumber
                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'invoiceNumber',
                          decoration:
                              const InputDecoration(labelText: '見積書番号:'),
                        ),
                      ),
                      // invoiceDate
                      const Expanded(
                          child: ReactiveDatePickerField(
                        formControlName: 'invoiceDate',
                        label: '発行日',
                      )),

                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'companyName',
                          decoration: const InputDecoration(labelText: '会社名:'),
                        ),
                      ),
                    ],
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: context.appTheme.spacing.formSpacing);
                    },
                    children: [
                      // address
                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'address',
                          decoration: const InputDecoration(labelText: '住所:'),
                        ),
                      ),
                    ],
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: context.appTheme.spacing.formSpacing);
                    },
                    children: [
                      // telNumber
                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'telNumber',
                          decoration: const InputDecoration(labelText: 'Tel:'),
                        ),
                      ),

                      // fexNumber
                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'fexNumber',
                          decoration: const InputDecoration(labelText: 'Fax:'),
                        ),
                      ),

                      // inCharge
                      Expanded(
                        child: ReactiveTextField<String>(
                          formControlName: 'inCharge',
                          decoration: const InputDecoration(labelText: '担当:'),
                        ),
                      ),
                    ],
                  ),

                  Text('アイテム', style: context.textTheme.titleLarge),

                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: context.appTheme.spacing.formSpacing);
                    },
                    children: const [
                      Expanded(
                        child: Center(child: Text('項目')),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text('数'),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text('量'),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text('単価'),
                      ),
                    ],
                  ),
                  // item
                  ReactiveFormArray(
                    formArray: form.control('item') as FormArray,
                    builder: (context, formArray, child) {
                      List<Widget> item = formArray.controls
                          .map((control) => control as FormGroup)
                          .map((currentForm) => ReactiveForm(
                                formGroup: currentForm,
                                child: RowSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                        width: context
                                            .appTheme.spacing.formSpacing);
                                  },
                                  children: [
                                    Expanded(
                                      child: RowSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                              width: context.appTheme.spacing
                                                  .formSpacing);
                                        },
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: ReactiveTextField<String>(
                                              formControlName: 'itemCode',
                                              decoration: const InputDecoration(
                                                labelText: 'コード',
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField<String>(
                                              formControlName: 'details',
                                              minLines: 1,
                                              maxLines: 4,
                                              decoration: const InputDecoration(
                                                labelText: '内訳',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: ReactiveTextField<double>(
                                        formControlName: 'quantity',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                        decoration: const InputDecoration(
                                            labelText: '数'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: ReactiveDropdownField(
                                        formControlName: 'unit',
                                        items: const [
                                          DropdownMenuItem(
                                              value: '式', child: Text('式')),
                                          DropdownMenuItem(
                                              value: '回', child: Text('回')),
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: '量',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: ReactiveTextField<double>(
                                        formControlName: 'unitPrice',
                                        keyboardType: TextInputType.number,
                                        valueAccessor: CurrencyValueAccessor(),
                                        inputFormatters: [
                                          CustomCurrencyFormatter(),
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: '単価',
                                          suffixText: '円',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList();

                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              height: context.appTheme.spacing.formSpacing / 2);
                        },
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...item,
                          ElevatedButton(
                            onPressed: () {
                              formArray.add(FormGroup({
                                '_id': FormControl<String>(),
                                'itemCode': FormControl<String>(),
                                'details': FormControl<String>(),
                                'quantity': FormControl<double>(
                                  validators: [
                                    Validators.number,
                                  ],
                                ),
                                'unit': FormControl<String>(
                                  value: '式',
                                ),
                                'unitPrice': FormControl<double>(),
                              }));
                            },
                            child: const Text(
                              '行を追加',
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // taxRate
                  ReactiveValueListenableBuilder<bool>(
                      formControlName: 'taxRateOption',
                      builder: (context, control, child) {
                        return RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                width: context.appTheme.spacing.formSpacing);
                          },
                          children: [
                            IntrinsicWidth(
                              child: CheckboxListTile(
                                value: control.value == false,
                                title: const Text('内税'),
                                onChanged: (bool? value) {
                                  form.control('taxRateOption').value = false;
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            IntrinsicWidth(
                              child: CheckboxListTile(
                                value: control.value == true,
                                title: const Text('外税'),
                                onChanged: (bool? value) {
                                  form.control('taxRateOption').value = true;
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            if (control.value == true)
                              SizedBox(
                                width: 300,
                                child: ReactiveTextField<int>(
                                  formControlName: 'taxRate',
                                  decoration: const InputDecoration(
                                    labelText: '消費税',
                                    suffix: Text('%'),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),

                  Text('メモ項目', style: context.textTheme.titleLarge),
                  // notes
                  ReactiveFormArray(
                    formArray: form.control('notes') as FormArray,
                    builder: (context, formArray, child) {
                      List<Widget> note = formArray.controls
                          .map((control) => control as FormGroup)
                          .map((currentForm) => ReactiveForm(
                                formGroup: currentForm,
                                child: RowSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                        width: context
                                            .appTheme.spacing.formSpacing);
                                  },
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField<String>(
                                        formControlName: 'note',
                                        minLines: 1,
                                        maxLines: 4,
                                        decoration: const InputDecoration(
                                          labelText: '注記',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList();
                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              height: context.appTheme.spacing.formSpacing / 2);
                        },
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...note,
                          ElevatedButton(
                            onPressed: () {
                              formArray.add(FormGroup({
                                '_id': FormControl<String>(),
                                'note': FormControl<String>(),
                              }));
                            },
                            child: const Text(
                              '行を追加',
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // 新しい提案セクション
                  Text('ご提案', style: context.textTheme.titleLarge),
                  ReactiveFormArray(
                    formArray: form.control('proposals') as FormArray,
                    builder: (context, formArray, child) {
                      List<Widget> proposals = formArray.controls
                          .map((control) => control as FormGroup)
                          .map((currentForm) => ReactiveForm(
                                formGroup: currentForm,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                                    child: ColumnSeparated(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      separatorBuilder: (BuildContext context, int index) {
                                        return SizedBox(height: context.appTheme.spacing.formSpacing);
                                      },
                                      children: [
                                        RowSeparated(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          separatorBuilder: (BuildContext context, int index) {
                                            return SizedBox(width: context.appTheme.spacing.formSpacing);
                                          },
                                          children: [
                                            Expanded(
                                              child: ReactiveDropdownField<String>(
                                                formControlName: 'medicalInstitution',
                                                items: const [
                                                  DropdownMenuItem(value: '北京協和病院', child: Text('北京協和病院')),
                                                  DropdownMenuItem(value: '中国人民解放軍総病院', child: Text('中国人民解放軍総病院')),
                                                  DropdownMenuItem(value: '四川大学華西病院', child: Text('四川大学華西病院')),
                                                  DropdownMenuItem(value: '清華大学玉泉病院', child: Text('清華大学玉泉病院')),
                                                ],
                                                decoration: const InputDecoration(
                                                  labelText: '医療機関',
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ReactiveDropdownField<String>(
                                                formControlName: 'region',
                                                items: const [
                                                  DropdownMenuItem(value: '北京', child: Text('北京')),
                                                  DropdownMenuItem(value: '上海', child: Text('上海')),
                                                  DropdownMenuItem(value: '成都', child: Text('成都')),
                                                  DropdownMenuItem(value: '大連', child: Text('大連')),
                                                ],
                                                decoration: const InputDecoration(
                                                  labelText: '地域',
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ReactiveDropdownField<String>(
                                                formControlName: 'treatmentType',
                                                items: const [
                                                  DropdownMenuItem(value: 'がん治療', child: Text('がん治療')),
                                                  DropdownMenuItem(value: '心臓血管治療', child: Text('心臓血管治療')),
                                                  DropdownMenuItem(value: '整形外科', child: Text('整形外科')),
                                                  DropdownMenuItem(value: '脳神経外科', child: Text('脳神経外科')),
                                                  DropdownMenuItem(value: '消化器科', child: Text('消化器科')),
                                                ],
                                                decoration: const InputDecoration(
                                                  labelText: '治療種類',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        RowSeparated(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          separatorBuilder: (BuildContext context, int index) {
                                            return SizedBox(width: context.appTheme.spacing.formSpacing);
                                          },
                                          children: [
                                            Expanded(
                                              child: ReactiveTextField<String>(
                                                formControlName: 'recommendationReason',
                                                minLines: 3,
                                                maxLines: 5,
                                                decoration: const InputDecoration(
                                                  labelText: 'おすすめ理由',
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ReactiveTextField<String>(
                                                formControlName: 'expectedTreatmentMenu',
                                                minLines: 3,
                                                maxLines: 5,
                                                decoration: const InputDecoration(
                                                  labelText: '想定される治療メニュー',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ReactiveTextField<String>(
                                          formControlName: 'budget',
                                          decoration: const InputDecoration(
                                            labelText: '予算',
                                            suffixText: '円',
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            if (formArray.controls.length > 1)
                                              IconButton(
                                                icon: const Icon(Icons.delete, color: Colors.red),
                                                onPressed: () {
                                                  formArray.removeAt(
                                                    formArray.controls.indexOf(currentForm),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList();

                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: context.appTheme.spacing.formSpacing);
                        },
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...proposals,
                          InkWell(
                            onTap: () {
                              formArray.add(FormGroup({
                                '_id': FormControl<String>(),
                                'medicalInstitution': FormControl<String>(),
                                'region': FormControl<String>(),
                                'treatmentType': FormControl<String>(),
                                'recommendationReason': FormControl<String>(),
                                'expectedTreatmentMenu': FormControl<String>(),
                                'budget': FormControl<String>(),
                              }));
                            },
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
                                  '提案を追加',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansJP',
                                    package: 'core_ui',
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // remarks
                  ReactiveTextField<String>(
                    formControlName: 'remarks',
                    minLines: 3,
                    maxLines: 6,
                    decoration: const InputDecoration(labelText: '特記事項'),
                  ),
                ],
              ),
            );
          });
    });
  }
}
