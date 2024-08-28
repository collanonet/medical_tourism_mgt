import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup normalSummaryForm() {
  return FormGroup({
    'id': FormControl<String>(),
    'entryDate': FormControl<DateTime>(
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'namePassport': FormControl<String>(
      disabled: true,
    ),
    'dateOfBirth': FormControl<DateTime>(
      disabled: true,
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'age': FormControl<int>(
      disabled: true,
    ),
    'gender': FormControl<bool>(
      disabled: true,
    ),
    'nameChineseKanjiVietnamese': FormControl<String>(
      disabled: true,
    ),
    'nameKana': FormControl<String>(
      disabled: true,
    ),
    'currentAddress': FormControl<String>(),
    'mobileNumberPatient': FormControl<String>(
      disabled: true,
    ),
    'mobileNumberDomestic': FormControl<String>(),
    'diseaseName': FormControl<String>(),
    'tissueType': FormControl<String>(),
    'diseaseNotices': FormControl<bool>(),
    'diagnosticMedicalInstitutionName': FormControl<String>(),
    'pastIllnessFamilyHistory': FormControl<String>(),
    'referralMedicalInstitutionEtc': FormControl<String>(),
    'diseaseCourseSndTestResultsEtc': FormControl<String>(),
    'symptoms': FormControl<String>(),
    'notices': FormControl<bool>(),
    'metastasis': FormControl<bool>(),
    'radiationTreatmentOrNot': FormControl<bool>(),
    'presenceOfAnticancerDrugTreatment': FormControl<bool>(),
    'biopsy': FormControl<bool>(),
    'patientsWishes': FormControl<String>(),
    'agentName': FormControl<String>(
      disabled: true,
    ),
    'personInChargeName': FormControl<String>(),
    'mobileNumber': FormControl<String>(),
    'patientsAddressStay': FormControl<String>(),
    'emergencyContact': FormControl<String>(),
    'remarks': FormControl<String>(),
    'attachDocuments': FormArray([
      FormGroup({
        'attachDocumentsName': FormControl<String>(),
      })
    ]),
    'medicalRecord': FormControl<String>(),
  });
}
