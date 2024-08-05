import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup webReservationForm() {
  return FormGroup({
    'patientSection': FormGroup({
      'name': FormControl<String>(),
      'firstHope': FormControl<DateTime>(),
      'secondHope': FormControl<DateTime>(),
      'thirdHope': FormControl<DateTime>(),
      'noDesiredDate': FormControl<bool>(value: false),
      'remarks': FormControl<String>(),
    }),
    'medicalInstitutionSection': FormGroup({
      'doctorName': FormControl<String>(),
      'moon': FormControl<bool>(value: false),
      'fire': FormControl<bool>(value: false),
      'water': FormControl<bool>(value: false),
      'wood': FormControl<bool>(value: false),
      'money': FormControl<bool>(value: false),
      'soil': FormControl<bool>(value: false),
      'day': FormControl<bool>(value: false),
    }),
    'reservationDateSection': FormGroup({
      'candidateDate': FormArray([
        FormGroup({
          'firstHope': FormControl<DateTime>(),
          'morning': FormControl<bool>(value: false),
          'fromTime': FormControl<TimeOfDay>(),
          'endTime': FormControl<TimeOfDay>(),
        }),
      ]),
      'message': FormControl<String>(),
    }),
    'testCallDateSection': FormGroup({
      'yearMonthDay': FormControl<DateTime>(),
      'time': FormControl<TimeOfDay>(),
    }),
  });
}
