import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StatementScreenForm extends StatelessWidget {
  const StatementScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.appTheme.spacing.formSpacing);
      },
      children: [
        Text('請求書フォーム', style: context.textTheme.titleLarge),
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
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
                        borderRadius: BorderRadius.all(Radius.circular(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.copy_all_rounded,
                                      size: 50,
                                      color: context.appTheme.primaryColor,
                                    ),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text(
                                      'ロゴをアップロードする',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        filePicker().then(
                                          (value) {
                                            form.control('logoFile').value =
                                                value;
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
                        borderRadius: BorderRadius.all(Radius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        )),
                        border: Border.all(
                          color: context.appTheme.primaryColor,
                        ),
                      ),
                      child: stampFile != null && stampFile.file != null
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.copy_all_rounded,
                                      size: 50,
                                      color: context.appTheme.primaryColor,
                                    ),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Text(
                                      'スタンプをアップロードする',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        filePicker().then(
                                          (value) {
                                            form.control('stampFile').value =
                                                value;
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
        // totalAmount
        // RowSeparated(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   separatorBuilder: (BuildContext context, int index) {
        //     return SizedBox(width: context.appTheme.spacing.formSpacing);
        //   },
        //   children: [
        //     // totalAmount
        //     Expanded(
        //       child: ReactiveTextField<double>(
        //         formControlName: 'totalAmount',
        //         keyboardType: TextInputType.number,
        //         valueAccessor: DoubleValueAccessor(),
        //         inputFormatters: [
        //           CustomCurrencyFormatter(),
        //         ],
        //         decoration: InputDecoration(
        //           labelText: '請求書金額',
        //           suffixText: '円',
        //         ),
        //       ),
        //     ),
        //     // invoiceDate
        //     Expanded(
        //       child: Container(),
        //     ),
        //     // companyName
        //     Expanded(
        //       child: Container(),
        //     ),
        //   ],
        // ),

        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            // invoiceNumber
            Expanded(
              child: ReactiveTextField<String>(
                formControlName: 'invoiceNumber',
                decoration: const InputDecoration(labelText: '請求書番号 :'),
              ),
            ),
            // invoiceDate
            const Expanded(
                          child: ReactiveDatePickerField(
                        formControlName: 'invoiceDate',
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
            return SizedBox(width: context.appTheme.spacing.formSpacing);
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
            return SizedBox(width: context.appTheme.spacing.formSpacing);
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
            return SizedBox(width: context.appTheme.spacing.formSpacing);
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
          formArrayName: 'item',
          builder: (context, formArray, child) {
            return ColumnSeparated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                    height: context.appTheme.spacing.formSpacing / 2);
              },
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
                            },
                            children: [
                              Expanded(
                                child: RowSeparated(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                        width: context
                                            .appTheme.spacing.formSpacing);
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
                                  decoration: const InputDecoration(labelText: '数'),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: ReactiveDropdownField(
                                  formControlName: 'unit',
                                  items: const [
                                    DropdownMenuItem(
                                        value: '式',
                                        child: Text('式')),
                                    DropdownMenuItem(
                                        value: '回',
                                        child: Text('回')),
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
                        )),
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
                  return SizedBox(width: context.appTheme.spacing.formSpacing);
                },
                children: [
                  IntrinsicWidth(
                    child: CheckboxListTile(
                      value: control.value == false,
                      title: const Text('内税'),
                      onChanged: (bool? value) {
                        form.control('taxRateOption').value = false;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  IntrinsicWidth(
                    child: CheckboxListTile(
                      value: control.value == true,
                      title: const Text('外税'),
                      onChanged: (bool? value) {
                        form.control('taxRateOption').value = true;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
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
          formArrayName: 'notes',
          builder: (context, formArray, child) {
            return ColumnSeparated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                    height: context.appTheme.spacing.formSpacing / 2);
              },
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
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
                        )),
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

        // remarks
        ReactiveTextField<String>(
          formControlName: 'remarks',
          minLines: 3,
          maxLines: 6,
          decoration: const InputDecoration(labelText: '特記事項'),
        ),
      ],
    );
  }
}
