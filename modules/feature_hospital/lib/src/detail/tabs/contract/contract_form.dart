import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm(){
  return FormGroup({
    'uploadFile' : FormControl<FileSelect>(),
    'DocumentName' : FormControl<String>(),
    'updatedOn' : FormControl<DateTime>(),
  });
}