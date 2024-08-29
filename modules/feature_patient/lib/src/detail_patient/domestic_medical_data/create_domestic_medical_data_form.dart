// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup domesticMedicalDataForm(
    {required String medicalRecordId, required FileSelect file}) {
  return FormGroup({
    'medicalRecordId': FormControl<String>(value: medicalRecordId),
    'uploadFile': FormControl<FileSelect>(value: file),
    'nameOfMedicalInstitution': FormControl<String>(),
    'category': FormControl<String>(),
    'documentName': FormControl<String>(),
    'remark': FormControl<String>(),
    'dateOfIssue': FormControl<DateTime>(
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'sharedUrlIssue': FormControl<String>(),
    'disclosureToPatients': FormControl<String>(),
    'disclosureToOtherMedicalInstitutions': FormControl<String>(),
  });
}
