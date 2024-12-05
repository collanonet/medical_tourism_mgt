// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_information_model.dart';

class PaymentOptionSection extends StatefulWidget {
  const PaymentOptionSection({super.key});

  @override
  State<PaymentOptionSection> createState() => _PaymentOptionSectionState();
}

class _PaymentOptionSectionState extends State<PaymentOptionSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('paymentOptionSection') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().paymentOptionData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ReactiveForm(
              formGroup: formGroup,
              child: ColumnSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.appTheme.spacing.formSpacing,
                      ),
                  children: [
                    Text(
                      '支払い方法',
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
                                '支払者',
                                style: context.textTheme.bodyMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveDropdownField(
                                    formControlName: 'payer',
                                    // Just add some items for the dropdown
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'patient',
                                        child: Text('患者'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'insurance',
                                        child: Text('保険'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'both',
                                        child: Text('患者と保険'),
                                      ),
                                    ]),
                              ),
                            ]),
                        ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                          children: [
                            Text(
                              '支払いタイミング',
                              style: context.textTheme.bodyMedium,
                            ),
                            RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: ((context, index) => SizedBox(
                                      width: context
                                          .appTheme.spacing.marginExtraSmall,
                                    )),
                                children: [
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'onTheDay',
                                      formControlName: 'paymentTiming',
                                      title: const Text('当日'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'advance',
                                      formControlName: 'paymentTiming',
                                      title: const Text('事前'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'whichever',
                                      formControlName: 'paymentTiming',
                                      title: const Text('どちらでもいい'),
                                    ),
                                  )
                                ])
                          ],
                        ),
                        ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                          children: [
                            Text(
                              '手数料バック',
                              style: context.textTheme.bodyMedium,
                            ),
                            RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: ((context, index) => SizedBox(
                                      width: context
                                          .appTheme.spacing.marginExtraSmall,
                                    )),
                                children: [
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'none',
                                      formControlName: 'feeBack',
                                      title: const Text('あり'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'onTheDay',
                                      formControlName: 'feeBack',
                                      title: const Text('なし'),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                        ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                          children: [
                            Text(
                              '病院へ直接の支払い',
                              style: context.textTheme.bodyMedium,
                            ),
                            RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder: ((context, index) => SizedBox(
                                      width: context
                                          .appTheme.spacing.marginExtraSmall,
                                    )),
                                children: [
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'can',
                                      formControlName:
                                          'paymentDirectlyToTheHospital',
                                      title: const Text('可'),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveRadioListTile(
                                      value: 'no',
                                      formControlName:
                                          'paymentDirectlyToTheHospital',
                                      title: const Text('不可'),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '支払い方法',
                      style: context.textTheme.bodyMedium,
                    ),
                    ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.marginExtraSmall,
                            ),
                        children: [
                          IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                            checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            formControlName: 'transfer',
                            onChanged: (value) {
                              debugPrint('transfer: ${value.value}');
                            },
                            title: const Text('振込'),
                          )),
                          RowSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 3 *
                                        context
                                            .appTheme.spacing.margin2ExtraLarge,
                                  ),
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'electronicPayment',
                                  onChanged: (value) {},
                                  title: const Text('電子決済'),
                                )),
                                RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: context.appTheme.spacing
                                              .marginExtraSmall,
                                        ),
                                    children: [
                                      const Text('('),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'unionPayPay',
                                        onChanged: (value) {},
                                        title: const Text('銀聯pay'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'weChatPay',
                                        onChanged: (value) {},
                                        title: const Text('WeChatpay'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'alipay',
                                        onChanged: (value) {},
                                        title: const Text('Alipay'),
                                      )),
                                      const Text(')'),
                                    ]),
                              ]),
                          RowSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 3 *
                                        context
                                            .appTheme.spacing.margin2ExtraLarge,
                                  ),
                              children: [
                                IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'creditCard',
                                  onChanged: (value) {},
                                  title: const Text('クレジットカード'),
                                )),
                                RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: context.appTheme.spacing
                                              .marginExtraSmall,
                                        ),
                                    children: [
                                      const Text('('),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'unionPay',
                                        onChanged: (value) {},
                                        title: const Text('銀聯'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'visa',
                                        onChanged: (value) {},
                                        title: const Text('Visa'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'masterCard',
                                        onChanged: (value) {},
                                        title: const Text('MasterCard'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'americanExpress',
                                        onChanged: (value) {},
                                        title: const Text('American Express'),
                                      )),
                                      IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        contentPadding: EdgeInsets.zero,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        formControlName: 'jcb',
                                        onChanged: (value) {},
                                        title: const Text('JCB'),
                                      )),
                                      const Text(')'),
                                    ]),
                              ]),
                          IntrinsicWidth(
                              child: ReactiveCheckboxListTile(
                            checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            formControlName: 'cash',
                            onChanged: (value) {
                              debugPrint('transfer: ${value.value}');
                            },
                            title: const Text('現金'),
                          )),
                        ]),
                    Text('備考', style: context.textTheme.bodyMedium),
                    SizedBox(
                      width: 300,
                      child: ReactiveTextField(
                        formControlName: 'remark',
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
