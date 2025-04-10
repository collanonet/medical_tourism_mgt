import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../itinerary_model.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key, required this.currentForm, this.remove});

  final FormGroup currentForm;
  final Function? remove;

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: widget.currentForm,
      child: SizedBox(
        width: 250,
        child: ReactiveValueListenableBuilder<String>(
            formControlName: 'patientName',
            builder: (context, controller, child) {
              return Row(
                children: [
                  Expanded(
                    child: ReactiveTextField<String>(
                      formControlName: 'patientName',
                      decoration: InputDecoration(
                          label: Text(
                            '患者名',
                          ),
                          suffixIcon: isLoading
                              ? CircularProgressIndicator()
                              : IconButton(
                                  onPressed: () async {
                                    final name = controller.value;

                                    if (name != null || name!.isNotEmpty) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      final result = await context
                                          .read<ItineraryModel>()
                                          .searchPatient(name);

                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (result != null) {
                                        widget.currentForm
                                                .control('patientName')
                                                .value =
                                            "${result.firstNameRomanized} ${result.middleNameRomanized} ${result.familyNameRomanized}";
                                        widget.currentForm
                                            .control('patient')
                                            .value = result.id;
                                      }
                                    }
                                  },
                                  icon: Icon(Icons.search))),
                      onSubmitted: (value) async {
                        final name = value.value;

                        if (name != null || name!.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });

                          final result = await context
                              .read<ItineraryModel>()
                              .searchPatient(name);

                          setState(() {
                            isLoading = false;
                          });

                          if (result != null) {
                            widget.currentForm.control('patientName').value =
                                "${result.firstNameRomanized} ${result.middleNameRomanized} ${result.familyNameRomanized}";
                            widget.currentForm.control('patient').value =
                                result.id;
                          }
                        }
                      },
                    ),
                  ),
                  if (widget.remove != null)
                    IconButton(
                        onPressed: () {
                          widget.remove?.call();
                        },
                        icon: Icon(Icons.remove_circle, color: Colors.red)),
                ],
              );
            }),
      ),
    );
  }
}
