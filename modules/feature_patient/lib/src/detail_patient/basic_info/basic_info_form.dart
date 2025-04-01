// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup basicInfoForm({
  String? patientId,
}) =>
    FormGroup(
      {
        '_id': FormControl<String?>(),
        'dateOfBirth': FormControl<DateTime>(
          validators: [
            Validators.required,
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'age': FormControl<int?>(value: 0),
        'height': FormControl<double>(
          value: 0,
        ), // 身長
        'weight': FormControl<double>(
          value: 0,
        ), // 体重
        'gender': FormControl<bool>(
          value: true,
        ), // 性別
        'isMale': FormControl<bool>(
          value: true,
        ), // 男性
        'isFemale': FormControl<bool>(
          value: false,
        ), // 女性
        'arrivalDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ), // 来日日
        'consultationDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'returnDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'proposalNumber': FormControl<String>(validators: [
          Validators.required,
        ]),
        'receptionDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'type': FormArray([
          FormGroup({
            'type': FormControl<String>(validators: [
              Validators.required,
            ]),
          })
        ]),
        'progress': FormControl<String>(),
        'advancePaymentDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'receivingMethod': FormControl<String>(),
        'memo': FormControl<String>(value: ''),
        'patient': FormControl<String>(value: patientId),
        'deletedMedicalRecordHospitals': FormControl<List<String>>(value: []),
        'MEDICAL_RECORD_HOSPITALS': FormArray([
          FormGroup({
            '_id': FormControl<String?>(),
            'hospitalName': FormControl<String?>(),
            'hospitalData': FormControl<BasicInformationHospitalResponse>(),
            'medicalCardNumber': FormControl<String?>(),
          }),
        ]),
        'travelGroup': FormGroup({
          '_id': FormControl<String?>(),
          'toGroupLeader': FormControl<bool>(
            value: false,
          ),
          'travelGroup': FormArray([
            FormGroup({
              'name': FormControl<String?>(
                value: '',
              ),
            })
          ]),
        }),

        'Patient_account': FormGroup({
          'loginId': FormControl<String?>(),
          'loginPassword': FormControl<String?>(
            value: '********',
            disabled: true,
          ),
          'isClosed': FormControl<bool>(
            value: false,
          ),
        }),
        'PATIENT_NAMES': FormGroup({
          '_id': FormControl<String?>(),
          'familyNameRomanized': FormControl<String?>(
            value: '',
            validators: [Validators.required],
          ),
          'middleNameRomanized': FormControl<String?>(
            value: '',
          ),
          'firstNameRomanized': FormControl<String?>(
            value: '',
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
          '_id': FormControl<String?>(),
          'nationality': FormControl<String?>(),
          'nativeLanguage': FormControl<String?>(),
          'residentialArea': FormControl<String?>(),
          'currentAddress': FormControl<String?>(),
          'mobileNumber': FormControl<String?>(),
          'email': FormControl<String>(
            validators: [
              Validators.email,
            ],
          ),
          'chatToolLink': FormArray([
            FormGroup({
              'chatToolLink': FormControl<String>(value: ''),
            })
          ]),
          'chatQrImage': FormControl<FileSelect>(),
          'patient': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_BUDGETS': FormGroup({
          '_id': FormControl<String?>(),
          'budget': FormControl<double>(
            value: 0,
          ),
          'remarks': FormControl<String?>(),
        }),
        'MEDICAL_RECORD_AGENTS': FormGroup({
          '_id': FormControl<String?>(),
          'company': FormControl<String?>(value: '', validators: [
            Validators.required,
          ]),
          'nameInKanji': FormControl<String?>(
            value: '',
          ),
          'nameInKana': FormControl<String?>(
            value: '',
          ),
        }),
        'MEDICAL_RECORD_Interpreter': FormGroup({
          '_id': FormControl<String?>(value: ''),
          'requiredOrUnnnecessary': FormControl<String>(value: ''),
          'interpreter': FormControl<String>(value: ''),
        }),
        'PATIENT_PASSPORTS': FormGroup({
          '_id': FormControl<String?>(),
          'passportNumber': FormControl<String?>(),
          'issueDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'expirationDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'visaType': FormControl<String?>(
            value: 'medicalGuarantee',
          ),
          'visaCategory': FormControl<String>(),
          'underConfirmation': FormControl<bool?>(value: false),
        }),
        'MEDICAL_RECORD_Companion': FormArray([
          FormGroup({
            '_id': FormControl<String?>(),
            'leader': FormControl<bool>(
              value: false,
            ),
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
            'dateOfBirth': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'age': FormControl<int?>(),
            'gender': FormControl<bool>(
              value: true,
            ), // 性別
            'isMale': FormControl<bool>(
              value: true,
            ), // 男性
            'isFemale': FormControl<bool>(), // 女
            'mobileNumber': FormControl<String?>(),
            'email': FormControl<String>(
              validators: [
                Validators.email,
              ],
            ),
            'chatToolLink': FormArray([
              FormGroup({
                'chatToolLink': FormControl<String>(value: ''),
              })
            ]),
            'chatQrImage': FormControl<FileSelect>(),
            'passportNumber': FormControl<String?>(),
            'issueDate': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'expirationDate': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'visaType': FormControl<String>(value: ''),
          }),
        ]),
      },
    );
