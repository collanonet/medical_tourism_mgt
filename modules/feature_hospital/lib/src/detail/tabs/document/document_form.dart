import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup documentForm(){
  return FormGroup({
    'uploadFile' : FormControl<FileSelect>(),
    'document_name' : FormControl<String>(),
    'updatedOn' : FormControl<DateTime>(),
    'translationLanguage' : FormControl<String>(),
    'translator' : FormControl<String>(),
  });
}