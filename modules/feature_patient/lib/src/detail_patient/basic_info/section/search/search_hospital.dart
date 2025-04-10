import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../basic_info_model.dart';

class SearchHospital extends StatefulWidget {
  const SearchHospital(
      {super.key,
      required this.formArray,
      required this.currentForm,
      required this.formGroup});

  final FormGroup currentForm;
  final FormGroup formGroup;
  final FormArray formArray;

  @override
  State<SearchHospital> createState() => _SearchHospitalState();
}

class _SearchHospitalState extends State<SearchHospital> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: widget.currentForm,
      child: Row(
        children: [
          Expanded(
            child: ReactiveValueListenableBuilder<String>(
                formControlName: 'hospitalName',
                builder: (context, control, _) {
                  return ReactiveTextField<String>(
                    formControlName: 'hospitalName',
                    decoration: InputDecoration(
                      label: Text(
                        '病院名', //   TODO: l10n 対応 (病院名) (hospitalName)
                      ),
                      suffixIcon: isLoading
                          ? CircularProgressIndicator()
                          : IconButton(
                              onPressed: () async {
                                final value = control;
                                logger.d(value.value);
                                if (value.value != null &&
                                    value.value!.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final result = await context
                                      .read<BasicInformationModel>()
                                      .searchHospital(value.value!);

                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (result != null) {
                                    logger.d('start insert');
                                    widget.currentForm
                                        .control('hospitalName')
                                        .value = result.hospitalNameChinese;
                                    widget.currentForm
                                        .control('medicalCardNumber')
                                        .value = result.hospitalID;
                                    widget.currentForm
                                        .control('hospitalData')
                                        .value = result;
                                    widget.currentForm
                                        .control('hospitalId')
                                        .value = result.id;
                                  }
                                }
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              )),
                    ),
                    onSubmitted: (value) async {
                      logger.d(value.value);
                      if (value.value != null && value.value!.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        final result = await context
                            .read<BasicInformationModel>()
                            .searchHospital(value.value!);

                        setState(() {
                          isLoading = false;
                        });
                        if (result != null) {
                          logger.d('start insert');
                          widget.currentForm.control('hospitalName').value =
                              result.hospitalNameChinese;
                          widget.currentForm
                              .control('medicalCardNumber')
                              .value = result.hospitalID;
                          widget.currentForm.control('hospitalData').value =
                              result;
                          widget.currentForm.control('hospitalId').value =
                              result.id;
                        }
                      }
                    },
                  );
                }),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          Expanded(
            child: ReactiveTextField(
              formControlName: 'medicalCardNumber',
              decoration: const InputDecoration(
                label: Text(
                  '診察券番号', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                ),
              ),
            ),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          Expanded(
              child: Row(
            children: [
              if (widget.formArray.controls.indexOf(widget.currentForm) != 0)
                IconButton(
                  onPressed: () {
                    if (widget.currentForm.control('_id').value != null) {
                      // deletedMedicalRecordHospitals
                      widget.formGroup
                          .control('deletedMedicalRecordHospitals')
                          .value
                          .add(widget.currentForm.control('_id').value);
                    }
                    widget.formArray.removeAt(
                        widget.formArray.controls.indexOf(widget.currentForm));
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
            ],
          ))
        ],
      ),
    );
  }
}
