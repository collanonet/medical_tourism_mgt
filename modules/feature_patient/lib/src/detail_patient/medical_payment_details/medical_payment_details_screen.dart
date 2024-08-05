import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'medical_payment_details_file.dart';
import 'medical_payment_details_form.dart';
import 'medical_payment_details_model.dart';

class MedicalPaymentDetailScreen extends StatefulWidget {
  const MedicalPaymentDetailScreen({super.key,this.id});
  final String? id;

  @override
  State<MedicalPaymentDetailScreen> createState() =>
      _MedicalPaymentDetailScreenState();
}

class _MedicalPaymentDetailScreenState
    extends State<MedicalPaymentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
                onTap: () {
                  filePicker().then((value) {
                    if (value != null) {
                      showCreateWithFileDialog(context, value);
                    }
                  });
                },
                child: Container(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copy_all_rounded,
                        size: 50,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Column(
                        children: [
                          Text(
                            '診療データをここにドラッグ＆ドロップ',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              filePicker().then((value) {
                                if (value != null) {
                                  showCreateWithFileDialog(context, value);
                                }
                              });
                            },
                            child: const Text(
                              'またはファイルを選択する',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       padding: EdgeInsets.all(
        //         context.appTheme.spacing.marginExtraLarge,
        //       ),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(
        //           context.appTheme.spacing.borderRadiusMedium,
        //         )),
        //         border: Border.all(
        //           color: context.appTheme.primaryColor,
        //         ),
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.copy_all_rounded,
        //             size: 50,
        //             color: context.appTheme.primaryColor,
        //           ),
        //           SizedBox(
        //             width: context.appTheme.spacing.marginMedium,
        //           ),
        //           Column(
        //             children: [
        //               Text(
        //                 '診療データをここにドラッグ＆ドロップ',
        //                 style: context.textTheme.titleLarge?.copyWith(
        //                   color: context.appTheme.primaryColor,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: context.appTheme.spacing.marginMedium,
        //               ),
        //               ElevatedButton(
        //                 onPressed: () {},
        //                 child: const Text(
        //                   'またはファイルを選択する',
        //                   style: TextStyle(
        // fontFamily: 'NotoSansJP',
        // package: 'core_ui',
        //                     color: Colors.white,
        //                   ),
        //                 ),
        //               )
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '外部URLを追加',
                  style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: Colors.grey),
                ),
                checkColor: Colors.white,
                value: false,
                onChanged: (value) {},
              ),
              Expanded(
                  child: Text(
                '病院名',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '書類名',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '発行日',
                style: context.textTheme.bodySmall,
              )),
            ],
          ),
          Divider(),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              10,
              (index) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Colors.grey),
                        ),
                        checkColor: Colors.white,
                        value: false,
                        onChanged: (value) {},
                      ),
                      Expanded(child: Text('りんくうメディカルクリニック')),
                      Expanded(
                          child: Text(
                        '診療明細報酬書',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: context.appTheme.primaryColor),
                      )),
                      Expanded(child: Text('2023/06/30')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '削除する',
                  style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '印刷する',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'サマリー用に項目を出力',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<MedicalPaymentDetailModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  medicalPaymentForm(medicalRecordId: widget.id!, file: file)
                    ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
