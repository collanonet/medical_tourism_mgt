
import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalPaymentForm({required String medicalRecordId,required FileSelect file}){
  return FormGroup({
    'medicalRecordId' : FormControl<String>(value: medicalRecordId),
    'uploadFile' : FormControl<FileSelect>(value: file),
    'name_of_hospital' : FormControl<String>(),
    'documentName' :FormControl<String>(),
    'data_of_issue' : FormControl<DateTime>(),

  });
}