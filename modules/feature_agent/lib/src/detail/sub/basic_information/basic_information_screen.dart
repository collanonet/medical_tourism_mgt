import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

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
    return SingleChildScrollView(
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
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
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              children: [
                Text(
                  '基本情報',
                  style: context.textTheme.titleMedium,
                ),
                RowSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '担当者名',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveTextField(
                            formControlName: 'companyName',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '氏名（カナ）',
                            style: context.textTheme.bodyMedium,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    IntrinsicWidth(
                      stepWidth: 250,
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '郵便番号',
                            style: context.textTheme.bodyMedium,
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '所在地',
                            style: context.textTheme.bodyMedium,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '地域',
                            style: context.textTheme.bodyMedium,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '電話番号',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveTextField(
                            formControlName: 'phoneNumber',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '取引開始日',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveDatePicker<DateTime>(
                              formControlName: 'transactionStartDate',
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              builder: (context, picker, child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'transactionStartDate',
                                  valueAccessor: DateTimeValueAccessor(
                                    dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        CupertinoIcons.calendar,
                                        color: Colors.grey,
                                      ),
                                      onPressed: picker.showPicker,
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
                        .map((control) => control as FormGroup)
                        .map((currentForm) {
                      return ReactiveForm(
                        formGroup: currentForm,
                        child: RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 16);
                          },
                          children: [
                            Expanded(
                              child: ColumnSeparated(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 8);
                                },
                                children: [
                                  Text(
                                    '紹介手数料名',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  ReactiveTextField(
                                    formControlName: 'referralCommissionName',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ColumnSeparated(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 8);
                                },
                                children: [
                                  Text(
                                    '紹介手数料',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  ReactiveTextField(
                                    formControlName: 'referralCommission',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      formArray.removeAt(formArray.controls
                                          .indexOf(currentForm));
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 8);
                      },
                      children: [
                        ...rows,
                        InkWell(
                          onTap: () {
                            formArray.add(
                              FormGroup({
                                'id': FormControl<String>(),
                                'referralCommissionName': FormControl<String>(),
                                'referralCommission': FormControl<String>(),
                              }),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: context.appTheme.primaryColor,
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                '同行者を追加',
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
                RowSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  children: [
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            'メインの支払い方法',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveTextField(
                            formControlName: 'howToMainPayment',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        children: [
                          Text(
                            '過去実績案件数',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveTextField(
                            formControlName: 'pastCasesNumber',
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
      ),
    );
  }
}
