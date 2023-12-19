import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_web_appointment_form.dart';
import 'web_appointment_model.dart';

class WebAppointmentFilter extends StatefulWidget {
  const WebAppointmentFilter({super.key});

  @override
  State<WebAppointmentFilter> createState() => _WebAppointmentFilterState();
}

class _WebAppointmentFilterState extends State<WebAppointmentFilter> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WebAppointmentModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterWebAppointment(),
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
                      '病院・クリニック　Web診療予約履歴　検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'hospital_name',
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
                            formControlName: 'doctor_name',
                            decoration: InputDecoration(
                              label: Text(
                                '医師名',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'reservation_date_from',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'reservation_date_from',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '予約日（自）',
                                  ),
                                  suffixIcon: const Icon(
                                    CupertinoIcons.calendar,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'reservation_date_to',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'reservation_date_to',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '予約日（至）',
                                  ),
                                  suffixIcon: const Icon(
                                    CupertinoIcons.calendar,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '予約状態',
                            ),
                            Row(
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
                                    value: true,
                                    onChanged: (value) {}),
                                Text('問合せ中'),
                                Checkbox(
                                    activeColor: Theme.of(context).primaryColor,
                                    checkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (value) {}),
                                Text('予約確定'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('検索'),
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
