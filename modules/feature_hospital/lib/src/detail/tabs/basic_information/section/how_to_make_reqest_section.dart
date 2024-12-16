// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_information_model.dart';

class HowtoMakeReqestSection extends StatefulWidget {
  const HowtoMakeReqestSection({super.key});

  @override
  State<HowtoMakeReqestSection> createState() => _HowtoMakeReqestSectionState();
}

class _HowtoMakeReqestSectionState extends State<HowtoMakeReqestSection> {
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('howToMakeRequest') as FormGroup;
    final formatter = InputFormatter();
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().howToMakeRequestHospitalData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ReactiveForm(
                formGroup: formGroup,
                child: ColumnSeparated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: context.appTheme.spacing.formSpacing,
                        ),
                    children: [
                      ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                                height: context.appTheme.spacing.marginSmall),
                        children: [
                          const Text(
                            '依頼の仕方',
                          ),
                          ReactiveTextField(
                            formControlName: 'memo',
                            maxLines: 3,
                          ),
                        ],
                      ),
                      RowSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: context.appTheme.spacing.formSpacing,
                          );
                        },
                        children: [
                          const IntrinsicWidth(
                            stepWidth: 300,
                            child: ReactiveDropdownFormField(
                              formControlName: 'updater',
                              decoration: InputDecoration(
                                label: Text(
                                  '更新者',
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: '谷川真理子',
                                  child: Text('谷川真理子'),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicWidth(
                            stepWidth: 300,
                            child: ReactiveDatePickerField(
                              formControlName: 'dateOfUpdate',
                              label: '更新日',
                            ),
                          ),
                        ],
                      ),
                      ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                                height: context.appTheme.spacing.marginSmall),
                        children: [
                          const Text(
                            '更新内容',
                          ),
                          ReactiveTextField(
                            formControlName: 'updates',
                          ),
                        ],
                      ),
                    ])),
          );
        });
  }
}
