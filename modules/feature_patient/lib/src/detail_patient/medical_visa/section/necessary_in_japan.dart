// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NecessaryInJapan extends StatelessWidget {
  const NecessaryInJapan({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '日本で必要',
          style: context.textTheme.titleMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('necessaryInJapan') as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveFormArray(
                formArrayName: 'visaInfo',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('パスポート'),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePickerField(
                                            formControlName: 'passportDate',
                                          ),
                                        ),
                                      ],
                                    ),
                                    fileUpload(context, currentForm,
                                        'passportFileSelect'),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    const Expanded(child: Text('身元保証書')),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    const IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName:
                                            'letterOfGuaranteeDate',
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    SizedBox(
                                      width: 600,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'true',
                                              formControlName: 'sendBy',
                                              title: const Text('原本送付'),
                                            ),
                                          ),
                                          const Text('（'),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byEMS',
                                              title: const Text('EMS'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byFedex',
                                              title: const Text('Fedex'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byOthers',
                                              title: const Text('その他'),
                                            ),
                                          ),
                                          const Text('）'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'false',
                                              formControlName: 'sendBy',
                                              title: const Text('PDF送付'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: ColumnSeparated(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: context
                                                  .appTheme.spacing.formSpacing,
                                            ),
                                            children: [
                                              SizedBox(
                                                width: 75,
                                                child: RowSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    width: context
                                                        .appTheme
                                                        .spacing
                                                        .marginExtraSmall,
                                                  ),
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          ReactiveValueListenableBuilder<
                                                              FileSelect>(
                                                        formControlName:
                                                            'letterOfGuaranteeFileSelect',
                                                        builder: (context,
                                                            control, _) {
                                                          return InkWell(
                                                            onTap: () {
                                                              if (control.value
                                                                          ?.url !=
                                                                      null ||
                                                                  control.value
                                                                          ?.filename !=
                                                                      null) {
                                                                openUrlInBrowser(
                                                                    fileName: control
                                                                            .value
                                                                            ?.url ??
                                                                        control
                                                                            .value!
                                                                            .filename!);
                                                              }
                                                            },
                                                            child: Text(
                                                              control.value
                                                                      ?.url ??
                                                                  control.value
                                                                      ?.filename ??
                                                                  'File Name',
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  filePicker().then((value) {
                                                    if (value != null) {
                                                      currentForm
                                                          .control(
                                                              'letterOfGuaranteeFileSelect')
                                                          .value = value;
                                                      logger
                                                          .d('Value Not Null');
                                                    }
                                                  });
                                                },
                                                child: Chip(
                                                  label: const Text('ファイル選択'),
                                                  labelStyle: TextStyle(
                                                    color: context.appTheme
                                                        .secondaryBackgroundColor,
                                                  ),
                                                  backgroundColor: context
                                                      .appTheme.primaryColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // fileUpload(context, currentForm,
                                    //     'letterOfGuaranteeFileSelect'),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList();
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
                        onTap: () => formArray.add(
                          FormGroup(
                            {
                              'passportDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'passportFileSelect': FormControl<FileSelect>(),
                              'letterOfGuaranteeDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'letterOfGuaranteeFileSelect':
                                  FormControl<FileSelect>(),
                              'sendBy': FormControl<String>(value: ''),
                              'byEMS': FormControl<bool>(value: false),
                              'byFedex': FormControl<bool>(value: false),
                              'byOthers': FormControl<bool>(value: false),
                            },
                          ),
                        ),
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
                              '身元保証書を追加',
                              style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ReactiveFormArray(
                formArrayName: 'otherApplicationDocuments',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text('その他申請書類'),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName: 'date',
                                      ),
                                    ),
                                  ],
                                ),
                                fileUpload(context, currentForm, 'fileSelect'),
                              ],
                            ),
                          ))
                      .toList();
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
                        onTap: () => formArray.add(
                          FormGroup(
                            {
                              'date': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'fileSelect': FormControl<FileSelect>(),
                            },
                          ),
                        ),
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
                              'その他申請書類を追加',
                              style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  package: 'core_ui',
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget fileUpload(
      BuildContext context, FormGroup currentForm, String fileName) {
    return ColumnSeparated(
      mainAxisAlignment: MainAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
            width: context.appTheme.spacing.formSpacing,
          ),
          children: [
            RowSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              children: [
                ReactiveValueListenableBuilder<FileSelect>(
                  formControlName: fileName,
                  builder: (context, control, _) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: PreviewFile(fileSelect: control.value!),
                          ),
                        );
                      },
                      child: Text(
                        control.value?.url ??
                            control.value?.filename ??
                            'File Name',
                        style: context.textTheme.bodySmall,
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                filePicker().then((value) {
                  if (value != null) {
                    currentForm.control(fileName).value = value;
                  }
                });
              },
              child: Chip(
                label: const Text('ファイル選択'),
                labelStyle: TextStyle(
                  color: context.appTheme.secondaryBackgroundColor,
                ),
                backgroundColor: context.appTheme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
