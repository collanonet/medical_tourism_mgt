import 'package:reactive_forms/reactive_forms.dart';

FormGroup basicInfoForm({
  String? patientId,
}) =>
    FormGroup(
      {
        'id': FormControl<String?>(),
        'dateOfBirth': FormControl<DateTime>(
          validators: [Validators.required],
        ), //生年月日
        'age': FormControl<int?>(), // 年齢
        'height': FormControl<int?>(), // 身長
        'weight': FormControl<int?>(), // 体重
        'gender': FormControl<bool>(), // 性別
        'isMale': FormControl<bool>(
          value: true,
        ), // 男性
        'isFemale': FormControl<bool>(), // 女性
        'arrivalDate': FormControl<DateTime>(
          validators: [Validators.required],
        ), // 来日日
        'consultationDate': FormControl<DateTime>(),
        'returnDate': FormControl<DateTime>(),
        'proposalNumber': FormControl<String>(
          validators: [Validators.required],
        ),
        'receptionDate': FormControl<DateTime>(),
        'type': FormArray([
          FormGroup({
            'type': FormControl<String>(
              validators: [Validators.required],
            ),
          })
        ]),
        'progress': FormControl<String>(),
        'advancePaymentDate': FormControl<DateTime>(),
        'receivingMethod': FormControl<String>(),
        'memo': FormControl<String>(),
        'patient': FormControl<String>(value: patientId),

        'MEDICAL_RECORD_HOSPITALS': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'hospitalName': FormControl<String?>(),
            'medicalCardNumber': FormControl<String?>(),
          }),
        ]),
        'Travel_group': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'name': FormControl<String?>(),
          })
        ]),
        'Patient_account': FormGroup({
          'loginId': FormControl<String?>(
            disabled: true,
          ),
          'loginPassword': FormControl<String?>(
            value: '********',
            disabled: true,
          ),
        }),
        'PATIENT_NAMES': FormGroup({
          'id': FormControl<String?>(),
          'familyNameRomanized': FormControl<String?>(
            validators: [Validators.required],
          ),
          'middleNameRomanized': FormControl<String?>(),
          'firstNameRomanized': FormControl<String?>(
            validators: [Validators.required],
          ),
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
          'email': FormControl<String?>(),
          'chatToolLink': FormArray([
            FormGroup({
              'chatToolLink': FormControl<String>(),
            })
          ]),
          'chatQr': FormArray([
            FormGroup({
              'chatQr': FormControl<String>(),
            })
          ]),
          'patient': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_BUDGETS': FormGroup({
          'id': FormControl<String?>(),
          'budget': FormControl<String?>(),
          'remarks': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_AGENTS': FormGroup({
          'id': FormControl<String?>(),
          'company': FormControl<String?>(
            validators: [Validators.required],
          ),
          'nameInKanji': FormControl<String?>(
            validators: [Validators.required],
          ),
          'nameInKana': FormControl<String?>(
            validators: [Validators.required],
          ),
        }),
        'MEDICAL_RECORD_Referrers': FormGroup({
          'id': FormControl<String?>(),
          'company': FormControl<String?>(
            validators: [Validators.required],
          ),
          'nameInKanji': FormControl<String?>(
            validators: [Validators.required],
          ),
          'nameInKana': FormControl<String?>(
            validators: [Validators.required],
          ),
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
          'visaType': FormControl<String?>(
            value: 'medicalGuarantee',
            validators: [Validators.required],
          ),
          'visaCategory': FormControl<String?>(),
          'underConfirmation': FormControl<bool?>(),
        }),
        'MEDICAL_RECORD_Companion': FormArray([
          FormGroup({
            'id': FormControl<String?>(),
            'leader': FormControl<bool>(),
            'remarks': FormControl<String?>(),
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
            'nationality': FormControl<String?>(),
            'relationship': FormControl<String>(),
            'dateOfBirth': FormControl<DateTime>(),
            'age': FormControl<int?>(),
            'gender': FormControl<bool>(),
            'mobileNumber': FormControl<String?>(),
            'email': FormControl<String?>(),
            'chatToolLink': FormControl<String?>(),
            'passportNumber': FormControl<String?>(),
            'issueDate': FormControl<DateTime>(),
            'expirationDate': FormControl<DateTime>(),
            'visaType': FormControl<String>(),
          }),
        ]),
      },
    );
