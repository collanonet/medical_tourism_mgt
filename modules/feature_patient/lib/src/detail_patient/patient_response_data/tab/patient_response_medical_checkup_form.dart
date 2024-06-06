import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalCheckupForm() {
  return FormGroup({
    'id': FormControl<String>(),
    'date1': FormControl<DateTime>(),
    'date2': FormControl<DateTime>(),
    'date3': FormControl<DateTime>(),
    'desiredDate': FormControl<bool>(),
    'remarks': FormControl<String>(),
    'numberOfPeopleRequestingMedicalCheckup': FormControl<int>(
      value: 0,
    ),
    'age': FormControl<int>(),
    'sex': FormControl<bool>(
      value: true,
    ),
    'relationshipBetweenPerson': FormControl<String>(),
    'isThereMedicalInstitutionToAttend': FormControl<bool>(),
    'desiredAreaOrMedicalInstitutionName': FormControl<String>(),
    'reason': FormControl<String>(),
    'petCT': FormControl<bool>(
      value: true,
    ),
    'mri': FormControl<bool>(
      value: true,
    ),
    'gastroscope': FormControl<bool>(
      value: true,
    ),
    'freeInput': FormControl<String>(),
    'currentConcerns': FormControl<String>(),
    'brokerageCompanyOrIntroducer': FormControl<String>(),
    'historyOfCancer': FormControl<bool>(
      value: true,
    ),
    'cancerSite': FormControl<String>(),
    'currentlyDiabetes': FormControl<bool>(
      value: true,
    ),
    'diabetesMedication': FormControl<bool>(
      value: true,
    ),
    'fastingBloodSugarMgPerDl': FormControl<int>(
      value: 0,
    ),
    'fastingBloodSugarMmolPerL': FormControl<int>(
      value: 0,
    ),
    'implant': FormControl<bool>(
      value: true,
    ),
    'implantYear': FormControl<int>(validators: [
      Validators.min(4),
      Validators.max(4),
    ]),
    'implantMonth': FormControl<int>(validators: [
      Validators.min(2),
      Validators.max(2),
    ]),
    'bodyMetalOrTattoo': FormControl<bool>(
      value: true,
    ),
    'hadMriAfterMetalOrTattoo': FormControl<bool>(
      value: true,
    ),
    'partAndItsMaterial': FormControl<String>(),
    'claustrophobia': FormControl<bool>(
      value: true,
    ),
    'medicalRecord': FormControl<String>(),
  });
}
