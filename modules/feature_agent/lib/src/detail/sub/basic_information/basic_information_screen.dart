import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'basic_information_model.dart';

class AgentBasicInformationScreen extends StatefulWidget {
  const AgentBasicInformationScreen({super.key});

  @override
  State<AgentBasicInformationScreen> createState() =>
      _AgentBasicInformationScreenState();
}

class _AgentBasicInformationScreenState
    extends State<AgentBasicInformationScreen> {
  final formatter = InputFormatter();
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
        valueListenable: context.read<AgentBasicInformationModel>().agent,
        builder: (context, value, child) {
          return Skeletonizer(
            enabled: value.loading,
            child: SingleChildScrollView(
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
                children: [
                  ReactiveFormBuilder(
                      form: () => formGroup.control('basicInformationAgent')
                          as FormGroup,
                      builder: (context, form, _) {
                        return Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'メモ',
                                  style: context.textTheme.bodySmall,
                                ),
                                SizedBox(height: 8),
                                ReactiveTextField(
                                  formControlName: 'memo',
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xffF8F8D9),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ColumnSeparated(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 16);
                                },
                                children: [
                                  Text(
                                    '基本情報',
                                    style: context.textTheme.titleMedium,
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '担当者名',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'companyName',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '氏名（カナ）',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'nameKana',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      IntrinsicWidth(
                                        stepWidth: 250,
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '郵便番号',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'postalCode',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '所在地',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'address',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '地域',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'area',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '電話番号',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName: 'phoneNumber',
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '取引開始日',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveDatePicker<DateTime>(
                                                formControlName:
                                                    'transactionStartDate',
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder:
                                                    (context, picker, child) {
                                                  return ReactiveTextField<
                                                      DateTime>(
                                                    formControlName:
                                                        'transactionStartDate',
                                                    valueAccessor:
                                                        DateTimeValueAccessor(
                                                      dateTimeFormat:
                                                          DateFormat(
                                                              'yyyy/MM/dd'),
                                                    ),
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .calendar,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed:
                                                            picker.showPicker,
                                                      ),
                                                    ),
                                                    inputFormatters: [
                                                      formatter.dateFormatter,
                                                    ],
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  ReactiveFormArray(
                                    formArrayName: 'referralCommissions',
                                    builder: (context, formArray, child) {
                                      var rows = formArray.controls
                                          .map(
                                              (control) => control as FormGroup)
                                          .map((currentForm) {
                                        return ReactiveForm(
                                          formGroup: currentForm,
                                          child: RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(width: 16);
                                            },
                                            children: [
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '紹介手数料名',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'referralCommissionName',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '紹介手数料',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'referralCommission',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly,
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    if (formArray.controls
                                                            .indexOf(
                                                                currentForm) !=
                                                        0)
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        ),
                                                        onPressed: () {
                                                          formArray.removeAt(
                                                              formArray.controls
                                                                  .indexOf(
                                                                      currentForm));
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList();

                                      return ColumnSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 8);
                                        },
                                        children: [
                                          ...rows,
                                          InkWell(
                                            onTap: () {
                                              formArray.add(
                                                FormGroup({
                                                  'id': FormControl<String>(),
                                                  'referralCommissionName':
                                                      FormControl<String>(),
                                                  'referralCommission':
                                                      FormControl<String>(),
                                                }),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.add_circle,
                                                  color: context
                                                      .appTheme.primaryColor,
                                                ),
                                                SizedBox(
                                                  width: context.appTheme
                                                      .spacing.marginSmall,
                                                ),
                                                Text(
                                                  '同行者を追加',
                                                  style: TextStyle(
                                                      color: context.appTheme
                                                          .primaryColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              'メインの支払い方法',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName:
                                                  'howToMainPayment',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                          children: [
                                            Text(
                                              '過去実績案件数',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                            ReactiveTextField(
                                              formControlName:
                                                  'pastCasesNumber',
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                  if (value.hasData)
                    ValueListenableBuilder(
                        valueListenable: context
                            .read<AgentBasicInformationModel>()
                            .agentManager,
                        builder: (context, value, child) {
                          return Skeletonizer(
                            enabled: value.loading,
                            child: ReactiveFormArray(
                              formArrayName: 'manager',
                              builder: (context, formArray, child) {
                                var rows = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map((currentForm) {
                                  return Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF0F3F5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ReactiveForm(
                                      formGroup: currentForm,
                                      child: ColumnSeparated(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 16);
                                        },
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '担当者',
                                                style: context
                                                    .textTheme.titleMedium,
                                              ),
                                              if (formArray.controls
                                                      .indexOf(currentForm) !=
                                                  0)
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    formArray.removeAt(formArray
                                                        .controls
                                                        .indexOf(currentForm));
                                                  },
                                                ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 400,
                                                padding: EdgeInsets.all(
                                                  context.appTheme.spacing
                                                      .marginExtraLarge,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                    context.appTheme.spacing
                                                        .borderRadiusMedium,
                                                  )),
                                                  border: Border.all(
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.copy_all_rounded,
                                                      size: 50,
                                                      color: context.appTheme
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(
                                                      height: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Text(
                                                      '名刺データをここにドラッグ＆ドロップ',
                                                      style: context
                                                          .textTheme.bodySmall
                                                          ?.copyWith(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'またはファイルを選択する',
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(width: 16);
                                            },
                                            children: [
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '部署名',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'departmentName',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                            ],
                                          ),
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(width: 16);
                                            },
                                            children: [
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '氏名（ローマ字）',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'fullNameRomanji',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '氏名（中国語漢字/ベトナム語表記）',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'fullNameChineseKanjiVietnameseNotation',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '氏名（日本語漢字）※中国人のみ',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'fullNameJapaneseKanjiChineseOnly',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(width: 16);
                                            },
                                            children: [
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '氏名（カナ）',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'fullNameKana',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                            ],
                                          ),
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(width: 16);
                                            },
                                            children: [
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      '電話番号',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName:
                                                          'phoneNumber',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ColumnSeparated(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const SizedBox(
                                                        height: 8);
                                                  },
                                                  children: [
                                                    Text(
                                                      'メール', // Email
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    ReactiveTextField(
                                                      formControlName: 'email',
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .singleLineFormatter,
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                            ],
                                          ),
                                          ReactiveFormArray(
                                            formArrayName: 'contactMethods',
                                            builder:
                                                (context, formArray, child) {
                                              var rows = formArray.controls
                                                  .map((control) =>
                                                      control as FormGroup)
                                                  .map((currentForm) {
                                                return ReactiveForm(
                                                  formGroup: currentForm,
                                                  child: RowSeparated(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return const SizedBox(
                                                          width: 16);
                                                    },
                                                    children: [
                                                      Expanded(
                                                        child: ColumnSeparated(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return const SizedBox(
                                                                height: 8);
                                                          },
                                                          children: [
                                                            Text(
                                                              '連絡方法',
                                                              style: context
                                                                  .textTheme
                                                                  .bodyMedium,
                                                            ),
                                                            ReactiveTextField(
                                                              formControlName:
                                                                  'howToContact',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ColumnSeparated(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return const SizedBox(
                                                                height: 8);
                                                          },
                                                          children: [
                                                            Text(
                                                              '連絡方法QRコード',
                                                              style: context
                                                                  .textTheme
                                                                  .bodyMedium,
                                                            ),
                                                            ReactiveTextField(
                                                              formControlName:
                                                                  'howToContactQrCode',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            if (formArray
                                                                    .controls
                                                                    .indexOf(
                                                                        currentForm) !=
                                                                0)
                                                              IconButton(
                                                                icon:
                                                                    const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                onPressed: () {
                                                                  formArray.removeAt(formArray
                                                                      .controls
                                                                      .indexOf(
                                                                          currentForm));
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList();

                                              return ColumnSeparated(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                      height: 8);
                                                },
                                                children: [
                                                  ...rows,
                                                  InkWell(
                                                    onTap: () {
                                                      formArray.add(
                                                        FormGroup({
                                                          'id': FormControl<
                                                              String>(),
                                                          'howToContact':
                                                              FormControl<
                                                                  String>(),
                                                          'howToContactQrCode':
                                                              FormControl<
                                                                  String>(),
                                                        }),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons.add_circle,
                                                          color: context
                                                              .appTheme
                                                              .primaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginSmall,
                                                        ),
                                                        Text(
                                                          '同行者を追加',
                                                          style: TextStyle(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList();

                                return ColumnSeparated(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(height: 16);
                                  },
                                  children: [
                                    ...rows,
                                    InkWell(
                                      onTap: () {
                                        formArray.add(
                                          FormGroup({
                                            'id': FormControl<String>(),
                                            'nameCardDragDrop':
                                                FormControl<String>(),
                                            'departmentName':
                                                FormControl<String>(),
                                            'fullNameRomanji':
                                                FormControl<String>(
                                              validators: [Validators.required],
                                            ),
                                            'fullNameChineseKanjiVietnameseNotation':
                                                FormControl<String>(),
                                            'fullNameJapaneseKanjiChineseOnly':
                                                FormControl<String>(),
                                            'fullNameKana':
                                                FormControl<String>(),
                                            'phoneNumber': FormControl<String>(
                                              validators: [Validators.required],
                                            ),
                                            'email': FormControl<String>(
                                              validators: [Validators.required],
                                            ),
                                            'contactMethods': FormArray([
                                              FormGroup({
                                                'id': FormControl<String>(),
                                                'howToContact':
                                                    FormControl<String>(),
                                                'howToContactQrCode':
                                                    FormControl<String>(),
                                              }),
                                            ]),
                                          })
                                            ..markAllAsTouched(),
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginSmall,
                                          ),
                                          Text(
                                            '担当者を追加',
                                            style: TextStyle(
                                                color: context
                                                    .appTheme.primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                ],
              ),
            ),
          );
        });
  }
}
