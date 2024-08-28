// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../g_and_a_model.dart';

class QAndANewRegistrationSection extends StatefulWidget {
  const QAndANewRegistrationSection({super.key});

  @override
  State<QAndANewRegistrationSection> createState() =>
      _QAndANewRegistrationSectionState();
}

class _QAndANewRegistrationSectionState
    extends State<QAndANewRegistrationSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('newRegistrationSection') as FormGroup;
    return ReactiveForm(
      formGroup: formGroup,
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        separatorBuilder: (context, index) => SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        children: [
          Text(
            'Q＆A新規登録',
            style: context.textTheme.bodyLarge,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xffF8F8D9),
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            child: ColumnSeparated(
                separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                children: [
                  RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          ),
                      children: [
                        Expanded(
                          flex: 2,
                          child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                Text(
                                  '更新日',
                                  style: context.textTheme.bodyMedium,
                                ),
                                ReactiveDatePicker(
                                  formControlName: 'updatedDate',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextField(
                                      formControlName: 'updatedDate',
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                        icon: const Icon(Icons.calendar_today),
                                        onPressed: () => picker.showPicker(),
                                      )),
                                    );
                                  },
                                )
                              ]),
                        ),
                        Expanded(
                          flex: 2,
                          child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                Text(
                                  '更新者',
                                  style: context.textTheme.bodyMedium,
                                ),
                                ReactiveTextField(
                                  formControlName: 'updatedBy',
                                )
                              ]),
                        ),
                        Expanded(
                          flex: 2,
                          child: ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                Text(
                                  '分類',
                                  style: context.textTheme.bodyMedium,
                                ),
                                ReactiveDropdownField(
                                  formControlName: 'classification',
                                  items: const [
                                    DropdownMenuItem(
                                      value: '予約方法について',
                                      child: Text('予約方法について'),
                                    )
                                  ],
                                )
                              ]),
                        ),
                        ColumnSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginExtraSmall,
                                ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  '病院とこのQAデータを共有',
                                  style: context.textTheme.bodyMedium,
                                ),
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
                                        value: true,
                                        formControlName:
                                            'shareThisQADataWithHospitals',
                                        title: const Text('する'),
                                      ),
                                    ),
                                    IntrinsicWidth(
                                      child: ReactiveRadioListTile(
                                        value: false,
                                        formControlName:
                                            'shareThisQADataWithHospitals',
                                        title: const Text('しない'),
                                      ),
                                    )
                                  ])
                            ])
                      ]),
                  ColumnSeparated(
                    separatorBuilder: ((context, index) => SizedBox(
                          height: context.appTheme.spacing.marginExtraSmall,
                        )),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '質問',
                      ),
                      ReactiveTextField(
                        formControlName: 'question',
                        maxLines: 2,
                      )
                    ],
                  ),
                  ColumnSeparated(
                    separatorBuilder: ((context, index) => SizedBox(
                          height: context.appTheme.spacing.marginExtraSmall,
                        )),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '回答',
                      ),
                      ReactiveTextField(
                        formControlName: 'answer',
                        maxLines: 4,
                      )
                    ],
                  ),
                  ValueListenableListener(
                    valueListenable: context.read<QAndAModel>().submit,
                    onListen: () {
                      final value = context.read<QAndAModel>().submit.value;

                      if (value.hasError) {
                        snackBarWidget(
                          message: '保存できませんでした。 もう一度試してください。',
                          backgroundColor: Colors.red,
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }

                      if (value.hasData) {
                        // reset form only when success
                        formGroup.reset();
                        snackBarWidget(
                          message: '正常に保存されました',
                          prefixIcon: const Icon(Icons.check_circle,
                              color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                      valueListenable: context.read<QAndAModel>().submit,
                      builder: (context, value, _) {
                        return ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            return RowSeparated(
                              mainAxisAlignment: MainAxisAlignment.end,
                              separatorBuilder: (context, index) => SizedBox(
                                width: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: context
                                              .appTheme.spacing.marginSmall,
                                          vertical: context
                                              .appTheme.spacing.buttonVertical,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {},
                                    child: Text(
                                      'キャンセル',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              color: context
                                                  .appTheme.primaryColor),
                                    )),
                                ElevatedButton(
                                  onPressed: value.loading
                                      ? null
                                      : () {
                                          context
                                              .read<QAndAModel>()
                                              .submitNewRegistrationHospital(
                                                  formGroup);
                                        },
                                  child: WithLoadingButton(
                                    isLoading: value.loading,
                                    child: const Text(
                                      '保存する',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
