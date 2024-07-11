import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup createDomesticMedicalDataForm() {
  return FormGroup({
    'entry_date_from': FormControl<DateTime>(validators: [Validators.required]),
    'hospitalName': FormControl<String>(validators: [Validators.required]),
    'hospitalAddress': FormControl<String>(validators: [Validators.required]),
    'hospitalPhone': FormControl<String>(validators: [Validators.required]),
    'hospitalFax': FormControl<String>(validators: [Validators.required]),
    'hospitalEmail': FormControl<String>(validators: [Validators.required]),
    'hospitalWebsite': FormControl<String>(validators: [Validators.required]),
  });
}

FormGroup domesticMedicalDataForm(
    {required String medicalRecordId, required FileSelect file}) {
  return FormGroup({
    'medicalRecordId': FormControl<String>(value: medicalRecordId),
    'uploadFile': FormControl<FileSelect>(value: file),
    'name_of_medical_institution': FormControl<String>(),
    'category': FormControl<String>(),
    'documentName': FormControl<String>(),
    'remark': FormControl<String>(),
    'date_of_issue': FormControl<DateTime>(),
    'shared_URL_issue': FormControl<String>(),
    'disclosure_to_patients': FormControl<String>(),
    'disclosure_to_other_medical_institutions': FormControl<String>(),
  });
}
