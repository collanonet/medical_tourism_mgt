import 'package:reactive_forms/reactive_forms.dart';

FormGroup inerarySimpleVersionForm() {
  return FormGroup({
    'title': FormArray([
      FormGroup({
        'patienName': FormControl<String>(),
        'Name_of_medical_institution': FormControl<String>(),
        'dateAndTimeConsultaion': FormControl<DateTime>(),
        'startTime': FormControl<String>(),
        'endTime': FormControl<String>(),
        'Health_Check_Package': FormControl<String>(),
        'optionName': FormControl<String>(),
        'checkupDate': FormControl<bool>(),
        'date': FormControl<DateTime>(),
        'time': FormControl<String>(),
      })
    ]),
    'prior_explanation': FormGroup({
      'Explanation_of_various_tests': FormControl<String>(),
      'Meals_before_and_on_the_day_of_the_examination': FormControl<String>(),
      'about_taking_medicine': FormControl<String>(),
      'bring_on_the_day_of_your_health_check': FormControl<String>(),
      'other_considerations': FormControl<String>(),
    }),
    'Interpreter_or_guide': FormGroup({
      'interpreter_or_guide': FormControl<bool>(),
      'date': FormControl<DateTime>(),
      'time': FormControl<String>(),
      'meeting_point': FormControl<String>(),
    }),
    'pick_up_and_drop_off': FormGroup({
      'pick_up_and_drop_off_check': FormControl<bool>(),
      'Pick_up_date_and_time': FormControl<DateTime>(),
      'time': FormControl<String>(),
      'place': FormControl<String>(),
      'type': FormControl<bool>(),
      'arranger': FormControl<String>(),
      'carNumber': FormControl<String>(),
      'driverNameKanli': FormControl<String>(),
      'driverNameKana': FormControl<String>(),
      'phone': FormControl<String>(),
    }),
  });
}
