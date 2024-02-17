import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  bool _check = false;
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
                          child: ReactiveTextField(
                            formControlName: 'hospitalName',
                            decoration: InputDecoration(
                              label: Text(
                                '病院名',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'type',
                            decoration: InputDecoration(
                              label: Text(
                                '種別',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'keyword',
                            decoration: InputDecoration(
                              label: Text(
                                'エリア',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'r_have',
                            decoration: InputDecoration(
                              label: Text(
                                'Rあり',
                              ),
                            ),
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
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('大学病院'),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('国公立病院'),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('私立病院'),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('クリニック'),
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
