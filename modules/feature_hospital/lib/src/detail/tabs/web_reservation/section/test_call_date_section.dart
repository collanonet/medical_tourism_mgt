import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TestCallDateSection extends StatefulWidget {
  const TestCallDateSection({super.key});

  @override
  State<TestCallDateSection> createState() => _TestCallDateSectionState();
}

class _TestCallDateSectionState extends State<TestCallDateSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('testCallDateSection') as FormGroup;
    return ReactiveForm(
      formGroup: formGroup,
      child: ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
                height: context.appTheme.spacing.formSpacing,
              ),
          children: [
            Text(
              'テストコール日',
              style: context.textTheme.bodyLarge,
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.appTheme.primaryBackgroundColor),
                child: RowSeparated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: context.appTheme.spacing.formSpacing,
                  ),
                  children: [
                    IntrinsicWidth(
                      stepWidth: MediaQuery.of(context).size.width * 0.2,
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'yearMonthDay',
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'yearMonthDay',
                            decoration: InputDecoration(
                              labelText: '年月日',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                                onPressed: picker.showPicker,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IntrinsicWidth(
                      stepWidth: MediaQuery.of(context).size.width * 0.1,
                      child: ReactiveTimePicker(
                        formControlName: 'time',
                        builder: (BuildContext context,
                            ReactiveTimePickerDelegate picker, Widget? child) {
                          return ReactiveTextField<TimeOfDay>(
                            formControlName: 'time',
                            decoration: InputDecoration(
                              labelText: '年月日',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.calendar,
                                  color: Colors.grey,
                                ),
                                onPressed: picker.showPicker,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
          ]),
    );
  }
}
