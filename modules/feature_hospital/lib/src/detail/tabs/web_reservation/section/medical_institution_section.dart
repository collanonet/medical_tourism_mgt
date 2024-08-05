import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalInstitutionSection extends StatefulWidget {
  const MedicalInstitutionSection({super.key});

  @override
  State<MedicalInstitutionSection> createState() =>
      _MedicalInstitutionSectionState();
}

class _MedicalInstitutionSectionState extends State<MedicalInstitutionSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('medicalInstitutionSection') as FormGroup;
    return ReactiveForm(
        formGroup: formGroup,
        child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.formSpacing,
                ),
            children: [
              Text(
                '医療機関',
                style: context.textTheme.bodyLarge,
              ),
              ColumnSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.appTheme.spacing.marginExtraSmall,
                      ),
                  children: [
                    Text(
                      '医師名',
                      style: context.textTheme.bodyMedium,
                    ),
                    IntrinsicWidth(
                      stepWidth: MediaQuery.of(context).size.width * 0.2,
                      child: const ReactiveDropdownFormField(
                        formControlName: 'doctorName',
                        decoration: InputDecoration(
                          label: Text(
                            '医師名', //
                          ),
                        ),
                        items: [],
                      ),
                    ),
                  ]),
              ColumnSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.appTheme.spacing.marginExtraSmall,
                      ),
                  children: [
                    Text('診療時間', style: context.textTheme.bodyMedium),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: context.appTheme.primaryBackgroundColor,
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 38, horizontal: 30),
                      child: RowSeparated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: context.appTheme.spacing.formSpacing,
                              ),
                          children: [
                            ColumnSeparated(
                                separatorBuilder: (context, index) => SizedBox(
                                      height:
                                          context.appTheme.spacing.formSpacing,
                                    ),
                                children: ['', '10時〜12時', '13時〜16時']
                                    .map((e) => Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: e == ''
                                                  ? context.appTheme
                                                      .primaryBackgroundColor
                                                  : context.appTheme
                                                      .secondaryBackgroundColor),
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 8, 8), // 16, 8, 16, 8
                                          child: Text(e,
                                              style:
                                                  context.textTheme.bodyMedium),
                                        ))
                                    .toList()),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('月',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'moon',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'moon',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('火',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'fire',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'fire',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('水',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'water',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'water',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('木',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'wood',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'wood',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('金',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'money',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'money',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('土',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'soil',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'soil',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginMedium),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appTheme.primaryColor),
                                    child: Text('日',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: context.appTheme
                                                    .secondaryBackgroundColor))),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'day',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: ReactiveDropdownField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    formControlName: 'day',
                                    items: const <DropdownMenuItem<bool>>[
                                      DropdownMenuItem<bool>(
                                        value: true,
                                        child: Text('○'),
                                      ),
                                      DropdownMenuItem<bool>(
                                        value: false,
                                        child: Text('✖︎'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )
                  ]),
            ]));
  }
}
