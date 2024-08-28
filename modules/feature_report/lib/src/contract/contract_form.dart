// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm(){
  return FormGroup({
    'agreementName' : FormControl<String>(),
    'contractA' : FormControl<String>(),
    'contractB' : FormControl<String>(),
    'fastening_method' : FormControl<String>()
  });
}

///contractA
///contractB
///Document name
///Updated on
///Contract with hospital
///Fastening Method
