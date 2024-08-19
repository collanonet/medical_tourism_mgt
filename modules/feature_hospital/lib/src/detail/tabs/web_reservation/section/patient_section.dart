import 'dart:js';

import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientSection extends StatefulWidget {
  const PatientSection({super.key});

  @override
  State<PatientSection> createState() => _PatientSectionState();
}

class _PatientSectionState extends State<PatientSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('patientSection') as FormGroup;
    return ReactiveForm(
        formGroup: formGroup,
        child: ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
            height: context.appTheme.spacing.formSpacing,
          ),
          children: [
            Text(
              '患者',
              style: context.textTheme.bodyLarge,
            ),
            IntrinsicWidth(
              stepWidth: MediaQuery.of(context).size.width * 0.2,
              child: ReactiveTextField(
                formControlName: 'name',
                decoration: const InputDecoration(
                  labelText: '名前',
                ),
              ),
            ),
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
                              height: context.appTheme.spacing.marginExtraSmall,
                            ),
                        children: [
                          Text(
                            '第１希望',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveDatePicker<DateTime>(
                            formControlName: 'firstHope',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'firstHope',
                                decoration: InputDecoration(
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
                        ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.marginExtraSmall,
                            ),
                        children: [
                          Text(
                            '第２希望',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveDatePicker<DateTime>(
                            formControlName: 'secondHope',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'secondHope',
                                decoration: InputDecoration(
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
                        ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.marginExtraSmall,
                            ),
                        children: [
                          Text(
                            '第３希望',
                            style: context.textTheme.bodyMedium,
                          ),
                          ReactiveDatePicker<DateTime>(
                            formControlName: 'thirdHope',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'thirdHope',
                                decoration: InputDecoration(
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
                        ]),
                  )
                ]),
            IntrinsicWidth(
                child: ReactiveCheckboxListTile(
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              formControlName: 'noDesiredDate',
              onChanged: (value) {
                debugPrint('transfer: ${value.value}');
              },
              title: const Text('希望日なし'),
            )),
            ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.marginExtraSmall,
                    ),
                children: [
                  Text(
                    '備考',
                    style: context.textTheme.bodyMedium,
                  ),
                  IntrinsicWidth(
                    stepWidth: MediaQuery.of(context).size.width * 0.2,
                    child: ReactiveTextField(
                      maxLines: 15,
                      minLines: 1,
                      formControlName: 'remarks',
                      decoration: const InputDecoration(
                          hintText:
                              '例）2024/03/05〜2024/03/10まで治療期間に合わせて滞在可能。 3/13までには必ず帰国したいです。'),
                    ),
                  ),
                ])
          ],
        ));
  }
}
