import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup basicInfoForm({
  String? patientId,
  MedicalRecord? medicalRecord,
}) =>
    FormGroup(
      {
        'id': FormControl<String?>(value: medicalRecord?.id),
        'dateOfBirth': FormControl<DateTime>(value: medicalRecord?.dateOfBirth),
        'age': FormControl<int?>(value: medicalRecord?.age),
        'gender': FormControl<String>(value: medicalRecord?.gender ?? 'male'),
        'arrivalDate': FormControl<DateTime>(value: medicalRecord?.arrivalDate),
        'examinationDate':
            FormControl<DateTime>(value: medicalRecord?.examinationDate),
        'departureDate':
            FormControl<DateTime>(value: medicalRecord?.departureDate),
        'caseNumber': FormControl<String>(value: medicalRecord?.caseNumber),
        'receptionDate':
            FormControl<DateTime>(value: medicalRecord?.receptionDate),
        'type': FormControl<String>(value: medicalRecord?.type),
        'progress': FormControl<String>(value: medicalRecord?.progress),
        'advancePaymentDate':
            FormControl<DateTime>(value: medicalRecord?.advancePaymentDate),
        'paymentMethod':
            FormControl<String>(value: medicalRecord?.paymentMethod),
        'memo': FormControl<String>(value: medicalRecord?.memo),
        'patient':
            FormControl<String>(value: patientId ?? medicalRecord?.patient),
        'MEDICAL_RECORD_HOSPITALS': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'hospitalName': FormControl<String?>(),
            'medicalCardNumber': FormControl<String?>(),
          }),
        ]),
        'PATIENT_NAMES': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'familyName': FormControl<String?>(),
            'middleName': FormControl<String?>(),
            'firstName': FormControl<String?>(),
            'nameType': FormControl<String>(value: NameType.romanized.value),
          }),
          FormGroup({
            'id': FormControl<String?>(),
            'familyName': FormControl<String?>(),
            'middleName': FormControl<String?>(),
            'firstName': FormControl<String?>(),
            'nameType':
                FormControl<String>(value: NameType.chineseOrVietnamese.value),
          }),
          FormGroup({
            'id': FormControl<String?>(),
            'familyName': FormControl<String?>(),
            'middleName': FormControl<String?>(),
            'firstName': FormControl<String?>(),
            'nameType':
                FormControl<String>(value: NameType.japaneseForChinese.value),
          }),
          FormGroup({
            'id': FormControl<String?>(),
            'familyName': FormControl<String?>(),
            'middleName': FormControl<String?>(),
            'firstName': FormControl<String?>(),
            'nameType': FormControl<String>(
                value: NameType.japaneseForNonChinese.value),
          }),
        ]),
        'PATIENT_NATIONALITIES': FormGroup({
          'id': FormControl<String?>(),
          'nationality': FormControl<String?>(),
          'nativeLanguage': FormControl<String?>(),
          'residentialArea': FormControl<String?>(),
          'currentAddress': FormControl<String?>(),
          'mobileNumber': FormControl<String?>(),
          'patient': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_BUDGETS': FormGroup({
          'id': FormControl<String?>(),
          'budget': FormControl<String?>(),
          'remarks': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_AGENTS': FormGroup({
          'id': FormControl<String?>(),
          'company': FormControl<String?>(),
          'nameInKanji': FormControl<String?>(),
          'nameInKana': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_Referrers': FormGroup({
          'id': FormControl<String?>(),
          'company': FormControl<String?>(),
          'nameInKanji': FormControl<String?>(),
          'nameInKana': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_Interpreter': FormGroup({
          'id': FormControl<String?>(),
          'requiredOrUnnnecessary': FormControl<String>(),
          'interpreter': FormControl<String>(),
        }),
      },
    );
