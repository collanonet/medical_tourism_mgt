import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'proposal_model.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('proposal') as FormArray;

    return ValueListenableBuilder(
        valueListenable: context.read<ProposalModel>().proposal,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('病院のご提案',
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ReactiveFormArray(
                            formArrayName: 'proposal',
                            builder: (context, formArray, child) {
                              final rows = formArray.controls
                                  .map((control) => control as FormGroup)
                                  .map(
                                    (currentForm) => ReactiveForm(
                                      formGroup: currentForm,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'hospitalName',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '病院名',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'postalCode',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '郵便番号',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: ReactiveTextField(
                                                        formControlName:
                                                            'address',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '所在地',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context
                                                            .appTheme
                                                            .spacing
                                                            .marginMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ReactiveTextField(
                                                        maxLines: 5,
                                                        minLines: 3,
                                                        formControlName:
                                                            'summary',
                                                        decoration:
                                                            const InputDecoration(
                                                          label: Text(
                                                            '概要',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (formArray.controls
                                                      .indexOf(currentForm) !=
                                                  0 ||
                                              currentForm.control('id').value !=
                                                  null) ...{
                                            IconButton(
                                              icon: const Icon(Icons.delete_forever,
                                                  color: Colors.red),
                                              onPressed: () =>
                                                  formArray.removeAt(
                                                formArray.controls
                                                    .indexOf(currentForm),
                                              ),
                                            ),
                                          }
                                        ],
                                      ),
                                    ),
                                  );

                              return ColumnSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                children: rows.toList(),
                              );
                            },
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          InkWell(
                            onTap: () => formArray.add(
                              FormGroup({
                                'id': FormControl<String?>(),
                                'hospitalName': FormControl<String>(
                                  validators: [Validators.required],
                                ),
                                'postalCode': FormControl<String>(),
                                'address': FormControl<String>(),
                                'summary': FormControl<String>(),
                                'medicalRecord': FormControl<String>(),
                              })
                                ..markAllAsTouched(),
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
                                  '病院を追加',
                                  style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      color: context.appTheme.primaryColor),
                                ) // TODO: l10n 対応 (病院を追加) (addHospital)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProposalModel>()
                          .createUpdateProposal(formArray);
                    },
                    child: const Text('保存'),
                  )
                ],
              ),
            ));
  }
}
