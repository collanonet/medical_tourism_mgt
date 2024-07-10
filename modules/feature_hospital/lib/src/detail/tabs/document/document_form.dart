import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup documentForm({required String hospitalRecordId, required FileSelect file}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'uploadFile' : FormControl<FileSelect>(
      value: file,),
    'documentName' : FormControl<String>(),
    'updatedOn' : FormControl<DateTime>(),
    'translationLanguage' : FormControl<String>(),
    'translator' : FormControl<String>(),
  });
}