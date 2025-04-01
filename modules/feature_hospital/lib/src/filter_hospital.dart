// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
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
          validationMessages: validationMessages,
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
                                      formControlName: 'area',
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
                                      formControlName: 'rHave',
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
