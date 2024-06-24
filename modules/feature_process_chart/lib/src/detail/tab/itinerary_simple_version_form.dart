
import 'package:reactive_forms/reactive_forms.dart';

FormGroup ineraryForm(){
 return FormGroup({
    'title' : FormArray([
      FormGroup({
        'patienName' : FormControl<String>(),
        'Name_of_medical_institution' : FormControl<String>(),
        'dateAndTimeConsultaion' : FormControl<DateTime>(),
        'startTime' : FormControl<String>(),
        'endTime' : FormControl<String>(),
        'Health_Check_Package' : FormControl<String>(),
        'optionName' : FormControl<String>(),
        'checkupDate' : FormControl<bool>(),
        'date': FormControl<DateTime>(),
        'time' : FormControl<String>(),
      })
    ]),
    'Explanation_of_various_tests' : FormControl<String>(),
    'Meals_before_and_on_the_day_of_the_examination'  : FormControl<String>(),
    'Interpreter_or_guide' : FormControl<bool>(),
    'date' : FormControl<DateTime>(),
    'time' : FormControl<String>(),
    'place' : FormControl<String>(),
    'CarNumber' : FormControl<String>(),
    'driverNameKanli' : FormControl<String>(),
    'driverNameKana' : FormControl<String>(),
    'phone' : FormControl<String>(),


  });
}