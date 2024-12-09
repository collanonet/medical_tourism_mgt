// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm(){
  return FormGroup({
    'documentName' : FormControl<String>(),
    'first' : FormControl<String>(),
    'second' : FormControl<String>(),
    'methodOfConclusion' : FormControl<String>()
  });
}

///contractA
///contractB
///Document name
///Updated on
///Contract with hospital
///Fastening Method
