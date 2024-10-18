import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AfterGettingVisa extends StatelessWidget {
  const AfterGettingVisa({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ビザ取得後に必要なもの',
          style: context.textTheme.titleMedium,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('afterGettingVisa') as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveFormArray(
                formArrayName: 'vasaInfo',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(child: Text('ビザのページ')),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'visaPage',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName: 'visaPage',
                                            valueAccessor:
                                                DateTimeValueAccessor(
                                              dateTimeFormat:
                                                  DateFormat('yyyy/MM/dd'),
                                            ),
                                            onChanged: (value) {
                                              logger.d(value);
                                            },
                                            onSubmitted: (value) {
                                              logger.d(value);
                                            },
                                            decoration: InputDecoration(
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
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('ファイル選択'))
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    const Expanded(child: Text('上陸許可証')),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'landingPermit',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName: 'landingPermit',
                                            valueAccessor:
                                                DateTimeValueAccessor(
                                              dateTimeFormat:
                                                  DateFormat('yyyy/MM/dd'),
                                            ),
                                            onChanged: (value) {
                                              logger.d(value);
                                            },
                                            onSubmitted: (value) {
                                              logger.d(value);
                                            },
                                            decoration: InputDecoration(
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
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('ファイル選択'))
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
                        onTap: () {
                          formArray.add(FormGroup(
                            {
                              'visaPage': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'landingPermit': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                            },
                          ));
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
                              '追加',
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
                formArrayName: 'ticket',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              children: [
                                const Expanded(child: Text('来日時の飛行機チケット')),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName:
                                        'plane_ticket_for_your_visit_to_japan',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'plane_ticket_for_your_visit_to_japan',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
                                        ),
                                        onChanged: (value) {
                                          logger.d(value);
                                        },
                                        onSubmitted: (value) {
                                          logger.d(value);
                                        },
                                        decoration: InputDecoration(
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
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('ファイル選択'))
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
                        onTap: () {
                          formArray.add(FormGroup(
                            {
                              'plane_ticket_for_your_visit_to_japan':
                                  FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                            },
                          ));
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
                              '追加',
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
                formArrayName: 'ticketBack',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              children: [
                                const Expanded(child: Text('帰国時の飛行機チケット')),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'return_flight_ticket',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'return_flight_ticket',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
                                        ),
                                        onChanged: (value) {
                                          logger.d(value);
                                        },
                                        onSubmitted: (value) {
                                          logger.d(value);
                                        },
                                        decoration: InputDecoration(
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
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('ファイル選択'))
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
                        onTap: () {
                          formArray.add(FormGroup(
                            {
                              'return_flight_ticket': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                            },
                          ));
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
                              '追加',
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
                formArrayName: 'boardingPass',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              children: [
                                const Expanded(child: Text('帰国時のボーディングパス')),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName:
                                        'boarding_pass_for_return_flight',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'boarding_pass_for_return_flight',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
                                        ),
                                        onChanged: (value) {
                                          logger.d(value);
                                        },
                                        onSubmitted: (value) {
                                          logger.d(value);
                                        },
                                        decoration: InputDecoration(
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
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('ファイル選択'))
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
                        onTap: () {
                          formArray.add(FormGroup(
                            {
                              'boarding_pass_for_return_flight':
                                  FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                            },
                          ));
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
                              '追加',
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
              Row(
                children: [
                  const Expanded(child: Text('在留資格認定証明書')),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                    child: ReactiveDatePicker<DateTime>(
                      formControlName: 'certificate_of_eligibility',
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'certificate_of_eligibility',
                          valueAccessor: DateTimeValueAccessor(
                            dateTimeFormat: DateFormat('yyyy/MM/dd'),
                          ),
                          onChanged: (value) {
                            logger.d(value);
                          },
                          onSubmitted: (value) {
                            logger.d(value);
                          },
                          decoration: InputDecoration(
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
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
