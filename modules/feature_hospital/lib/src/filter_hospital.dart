import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_hospital_form.dart';
import 'hospital_model.dart';

class HospitalFilter extends StatefulWidget {
  const HospitalFilter({super.key});

  @override
  State<HospitalFilter> createState() => _HospitalFilterState();
}

class _HospitalFilterState extends State<HospitalFilter> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HospitalModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterHospital(),
            builder: (context, formGroup, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '病院・クリニック検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('病院名'),
                              ReactiveTextField(
                                formControlName: 'hospitalName',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('種別'),
                              ValueListenableBuilder(
                                  valueListenable:
                                      context.read<HospitalModel>().typeData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'type',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.type,
                                                child: Text(
                                                  e.type,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('エリア'),
                              ValueListenableBuilder(
                                  valueListenable:
                                      context.read<HospitalModel>().areaData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'keyword',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.item,
                                                child: Text(
                                                  e.item,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Rあり'),
                              ValueListenableBuilder(
                                  valueListenable:
                                      context.read<HospitalModel>().withRData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'r_have',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.item,
                                                child: Text(
                                                  e.item,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '病院種別',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            formControlName: 'hospital_type1',
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            title: Text('大学病院'),
                          ),
                        ),
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            formControlName: 'hospital_type2',
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            title: Text('国公立病院'),
                          ),
                        ),
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            formControlName: 'hospital_type3',
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            title: Text('私立病院'),
                          ),
                        ),
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            formControlName: 'hospital_type4',
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            title: Text('クリニック'),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(onPressed: () {}, child: Text('検索')),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
