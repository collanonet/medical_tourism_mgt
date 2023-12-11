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
      // 身長 to en height
        'height': FormControl<int?>(value: medicalRecord?.height),
      // 体重 to en weight
        'weight': FormControl<int?>(value: medicalRecord?.weight),
        'gender': FormControl<String>(value: medicalRecord?.gender ?? 'male'),
        'arrivalDate': FormControl<DateTime>(value: medicalRecord?.arrivalDate, validators: [Validators.required]),
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
        'PATIENT_NAMES': FormGroup({
          'id': FormControl<String?>(),
          'familyNameRomanized': FormControl<String?>(),
          'middleNameRomanized': FormControl<String?>(),
          'firstNameRomanized': FormControl<String?>(),
          'familyNameChineseOrVietnamese': FormControl<String?>(),
          'middleNameChineseOrVietnamese': FormControl<String?>(),
          'firstNameChineseOrVietnamese': FormControl<String?>(),
          'familyNameJapaneseForChinese': FormControl<String?>(),
          'middleNameJapaneseForChinese': FormControl<String?>(),
          'firstNameJapaneseForChinese': FormControl<String?>(),
          'familyNameJapaneseForNonChinese': FormControl<String?>(),
          'middleNameJapaneseForNonChinese': FormControl<String?>(),
          'firstNameJapaneseForNonChinese': FormControl<String?>(),
        }),
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
        'PATIENT_PASSPORTS': FormGroup({
          'id': FormControl<String?>(),
          'passportNumber': FormControl<String?>(),
          'issueDate': FormControl<DateTime>(),
          'expirationDate': FormControl<DateTime>(),
          'visaType': FormControl<String?>(value: 'medicalGuarantee'),
          'visaCategory': FormControl<String?>(),
          'underConfirmation': FormControl<bool?>(value: false),
        }),
        'MEDICAL_RECORD_Companion': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'leader': FormControl<bool>(value: false),
            'remarks': FormControl<String?>(),
            'nameInRomanized': FormControl<String?>(),
            'nameInChineseOrKanji': FormControl<String?>(),
            'nameInJapaneseKanji': FormControl<String?>(),
            'nameInKana': FormControl<String?>(),
            'nationality': FormControl<String?>(),
            'relationship': FormControl<String>(value: '父親'),
            'dateOfBirth': FormControl<DateTime>(),
            'age': FormControl<int?>(),
            'gender': FormControl<String>(value: 'male'),
            'passportNumber': FormControl<String?>(),
            'issueDate': FormControl<DateTime>(),
            'expirationDate': FormControl<DateTime>(),
            'visaType': FormControl<String>(value: 'medicalGuarantee'),
          }),
        ]),
      },
    );
