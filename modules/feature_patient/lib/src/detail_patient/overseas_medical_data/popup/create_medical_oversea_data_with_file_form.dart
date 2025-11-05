// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithFileForm(
  List<DicomDetailResponse>? dicomFiles,
  FileSelect? documentFile,
  List<String> existingHospitals,
) {
  return FormGroup({
    'file': FormControl<List<DicomDetailResponse>>(value: dicomFiles),
    'documentFile': FormControl<FileSelect>(value: documentFile),
    'hospitalName': FormControl<String>(validators: [Validators.required]),
    'existingHospitals': FormControl<List<String>>(value: existingHospitals),
    'isNewHospital': FormControl<bool>(value: true),
    'selectedHospital': FormControl<String>(),
    'category': FormControl<String>(value: '画像データ（DICOM）'),
    'documentName': FormControl<String>(validators: [Validators.required]),
    'shootingDate': FormControl<DateTime>(
      validators: [
        Validators.required,
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'acquisitionDate': FormControl<DateTime>(
      value: DateTime.now(),
      validators: [
        Validators.required,
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'commentHospital1': FormControl<String>(),
    'commentOurCompany': FormControl<String>(),
    'commentHospital2': FormControl<String>(),
    'sharedUrl': FormControl<String>(),
    'password': FormControl<String>(),
    'expirationDate': FormControl<DateTime>(
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'qrCode': FormControl<FileSelect>(),
  });
}
