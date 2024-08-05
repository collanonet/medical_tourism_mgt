import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_information_model.dart';

class SupportLanguageSection extends StatefulWidget {
  const SupportLanguageSection({super.key});

  @override
  State<SupportLanguageSection> createState() => _SupportLanguageSectionState();
}

class _SupportLanguageSectionState extends State<SupportLanguageSection> {
  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('supportLanguageSection') as FormArray;
    final form = (ReactiveForm.of(context) as FormGroup);
    return ValueListenableBuilder(
      valueListenable:
          context.watch<BasicInformationModel>().supportLangaugeData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => SizedBox(
              height: context.appTheme.spacing.formSpacing,
            ),
            children: [
              Text(
                '対応言語',
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
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                      children: ['', '外国人スタッフ', '医療通訳対応']
                          .map((text) => IntrinsicWidth(
                                stepWidth: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    text,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ),
                              ))
                          .toList()),
                  IntrinsicWidth(
                    child: ReactiveFormArray(
                      formArrayName: 'supportLanguageSection',
                      builder: (context, formArray, child) {
                        return RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          ),
                          children: formArray.controls.map((fg) {
                            return Expanded(
                              child: ColumnSeparated(
                                separatorBuilder: ((context, index) => SizedBox(
                                      height: context
                                          .appTheme.spacing.marginExtraSmall,
                                    )),
                                children: <Widget>[
                                  IntrinsicWidth(
                                    stepWidth: 150,
                                    child: ReactiveTextField<String>(
                                      formControl: (fg as FormGroup)
                                              .control('supportLanguage')
                                          as FormControl<String>,
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 150,
                                    child: ReactiveDropdownField(
                                      formControl: (fg).control('foreignStaff')
                                          as FormControl<bool>,
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
                                    stepWidth: 150,
                                    child: ReactiveDropdownField(
                                      formControl: (fg).control(
                                              'medicalInterpretationSupport')
                                          as FormControl<bool>,
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
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () => formArray.add(FormGroup({
                      '_id': FormControl<String?>(),
                      'hospital': FormControl<String?>(),
                      'supportLanguage': FormControl<String>(),
                      'foreignStaff': FormControl<bool>(value: false),
                      'medicalInterpretationSupport':
                          FormControl<bool>(value: false),
                    })),
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
                          '言語を追加',
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ReactiveForm(
                formGroup: form.control('basicInformation') as FormGroup,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 160),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('備考'),
                      ReactiveTextField(
                        formControlName: 'supportLanguageRemark',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
