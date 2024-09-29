// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formInvoice(){
  return FormGroup({
    'nameOfHospital' : FormControl<String>(),
    'agentName' : FormControl<String>(),
    'patientName' : FormControl<String>(),
    'issue_date_from' : FormControl<DateTime>(),
    'issue_date_to' : FormControl<DateTime>(),
    'invoice' : FormControl<String>(),
    'prospects' : FormControl<String>(),
  });
}
