import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProspectivePankScreen extends StatefulWidget {
  const ProspectivePankScreen({super.key});

  @override
  State<ProspectivePankScreen> createState() => _ProspectivePankScreenState();
}

class _ProspectivePankScreenState extends State<ProspectivePankScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '見込みランク',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: ColumnSeparated(
            separatorBuilder: (context, index) =>
                SizedBox(height: context.appTheme.spacing.marginMedium),
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '見込みランク',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Text('見込みランク'),
                  SizedBox(width: 250),
                  Text('売上管理の見込に含めるか'),
                ],
              ),
              ReactiveFormArray(
                formArrayName: 'data',
                builder: (context, formArray, child) {
                  var rows = formArray.controls
                      .map((controll) => controll as FormGroup)
                      .map((currenForm) {
                    return ReactiveForm(
                      formGroup: currenForm,
                      child: Row(
                        children: [
                          IntrinsicWidth(
                            stepWidth: 300,
                            child: ReactiveTextField(
                              formControlName: 'prospective_rank',
                            ),
                          ),
                          const SizedBox(width: 20),
                          ReactiveValueListenableBuilder(
                              formControlName: 'filterText',
                              builder: (context, controller, _) {
                                return SegmentedButton<String>(
                                  showSelectedIcon: false,
                                  style: ButtonStyle(
                                    enableFeedback: true,
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                              color: context
                                                  .appTheme.primaryColor)),
                                    ),
                                    foregroundColor: MaterialStatePropertyAll(
                                        context.appTheme.primaryColor),
                                    side: MaterialStatePropertyAll(
                                      BorderSide(
                                          color: context.appTheme.primaryColor),
                                    ),
                                  ),
                                  segments: <ButtonSegment<String>>[
                                    ButtonSegment<String>(
                                      value: '受注のみ',
                                      label: Text(
                                        '受注のみ',
                                        style: TextStyle(
                                          color: controller.value == '受注のみ'
                                              ? Colors.white
                                              : context.appTheme.primaryColor,
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                        ),
                                      ),
                                      tooltip: context.l10n.labelOrdersOnly,
                                    ),
                                    ButtonSegment<String>(
                                      value: 'all',
                                      label: Text(
                                        context.l10n.labelAll,
                                        style: TextStyle(
                                          color: controller.value == 'all'
                                              ? Colors.white
                                              : context.appTheme.primaryColor,
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                        ),
                                      ),
                                      tooltip: context.l10n.labelAll,
                                    ),
                                  ],
                                  selected: <String>{
                                    controller.value.toString()
                                  },
                                  onSelectionChanged:
                                      (Set<String> newSelection) {
                                    // in case we have listener on field controller
                                    controller.value = newSelection.first;

                                    // in case we don't have listerner on field controller
                                    // and we can listener from formGroup that register

                                    // formGroup.control('filterText').value =
                                    //     newSelection.first;
                                  },
                                );
                              }),
                        ],
                      ),
                    );
                  }).toList();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginMedium),
                        children: rows.toList(),
                      ),
                      InkWell(
                        onTap: () {
                          formArray.add(
                            FormGroup({
                              'prospective_rank': FormControl<String>(),
                              'filterText': FormControl<String>(),
                            }),
                          );
                        },
                        child: IntrinsicWidth(
                          child: Row(
                            children: [
                              Icon(Icons.add_outlined,
                                  color: context.appTheme.primaryColor),
                              Text(
                                '行を追加',
                                style: TextStyle(
                                    color: context.appTheme.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
