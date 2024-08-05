import 'package:core_ui/core_ui.dart';
import 'progress_list_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProgressRecordWidget extends StatelessWidget {
  const ProgressRecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<String?>(
        formControlName: 'key',
        builder: (context, key, child) {
          return ValueListenableBuilder(
            valueListenable: context.read<ProgressListModel>().submitMedicalRecordsProgress,
            builder: (context, value, child) => Skeletonizer(
              enabled: value.loading && key.value == value.data,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: 'completed',
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      checkColor: Colors.white,
                    ),
                    ReactiveValueListenableBuilder<String?>(
                        formControlName: 'tag',
                        builder: (context, control, child) {
                          return control.value == null
                              ? const SizedBox.shrink()
                              : Container(
                                  width: context
                                          .appTheme.spacing.marginExtraLarge *
                                      2,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.appTheme.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      control.value ?? '',
                                      style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                          color: context.appTheme.primaryColor),
                                    ),
                                  ),
                                );
                        }),
                    SizedBox(
                      width: context.appTheme.spacing.marginExtraLarge,
                    ),
                    Expanded(
                        flex: 4,
                        child: ReactiveValueListenableBuilder<String?>(
                            formControlName: 'task',
                            builder: (context, control, child) {
                              return Text(control.value ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge);
                            })),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                        flex: 1,
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'completionDate',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                                formControlName: 'completionDate',
                                onTap: (value) => picker.showPicker(),
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff98A6B5),
                                  ),
                                ));
                          },
                        )),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                        flex: 3,
                        child: ReactiveTextField(
                          formControlName: 'remarks',
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
