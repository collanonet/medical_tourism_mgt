import 'package:reactive_forms/reactive_forms.dart';

FormGroup basicInformationForm() {
  return FormGroup({
    'howToMakeRequest': FormGroup({
      '_id': FormControl<String?>(),
      'hospital': FormControl<String?>(),
      'dateOfUpdate': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'updater': FormControl<String>(),
      'memo': FormControl<String>(),
      'updates': FormControl<String>(),
    }),
    'basicInformation': FormGroup({
      '_id': FormControl<String?>(),
      'hospitalNameChinese': FormControl<String>(
        validators: [Validators.required],
      ),
      'hospitalNameKatakana': FormControl<String>(
        validators: [Validators.required],
      ),
      'zipCode': FormControl<String>(),
      'location': FormControl<String>(
        validators: [Validators.required],
      ),
      'googleMap': FormControl<String>(),
      'phoneNumber': FormControl<String>(
        validators: [Validators.required],
      ),
      'faxNumber': FormControl<String>(
        validators: [Validators.required],
      ),
      'homepage': FormControl<String>(),
      'supportedMenu': FormControl<bool>(value: false),
      'healthCheckup': FormControl<bool>(value: false),
      'treatment': FormControl<bool>(value: false),
      'heavy-ionBeam': FormControl<bool>(value: false),
      'protonBeam': FormControl<bool>(value: false),
      'regenerativeMedicine': FormControl<bool>(value: false),
      'beauty': FormControl<bool>(value: false),
      'phone': FormControl<bool>(value: false),
      'fax': FormControl<bool>(value: false),
      'mail': FormControl<bool>(value: false),
      'line': FormControl<bool>(value: false),
      'note': FormControl<String>(),
      'english': FormControl<bool>(value: false),
      'chinese': FormControl<bool>(value: false),
      'vietnamese': FormControl<bool>(value: false),
      'otherLanguages': FormControl<bool>(value: false),
      'languages': FormControl<String>(),
      'onlineCheck': FormControl<String>(),
      'appointment': FormControl<String>(),
      'cdr': FormControl<bool>(value: false),
      'storageUrl': FormControl<bool>(value: false),
      'viewMyPage': FormControl<bool>(value: false),
      'mailAttachment': FormControl<bool>(value: false),
      'loanerTablet': FormControl<bool>(value: false),
      'jmip': FormControl<bool>(value: false),
      'jci': FormControl<bool>(value: false),
      'jih': FormControl<bool>(value: false),
      'ningenDoctor': FormControl<bool>(value: false),
      'japanHealth': FormControl<bool>(value: false),
      'societyRorRegenerativeMedicine': FormControl<bool>(value: false),
      'osakaPrefecturalBase': FormControl<bool>(value: false),
      'certified': FormControl<bool>(value: false),
      'shift1': FormControl<String>(),
      'shift2': FormControl<String>(),
      'shift1Mon': FormControl<String>(value: '×'),
      'shift1Tue': FormControl<String>(value: '×'),
      'shift1Wed': FormControl<String>(value: '×'),
      'shift1Thu': FormControl<String>(value: '×'),
      'shift1Fri': FormControl<String>(value: '×'),
      'shift1Sat': FormControl<String>(value: '×'),
      'shift1Sun': FormControl<String>(value: '×'),
      'shift2Mon': FormControl<String>(value: '×'),
      'shift2Tue': FormControl<String>(value: '×'),
      'shift2Wed': FormControl<String>(value: '×'),
      'shift2Thu': FormControl<String>(value: '×'),
      'shift2Fri': FormControl<String>(value: '×'),
      'shift2Sat': FormControl<String>(value: '×'),
      'shift2Sun': FormControl<String>(value: '×'),
      'memo': FormControl<String>(),
    }),
    'medicalRecordHospitals': FormArray([
      FormGroup({
        '_id': FormControl<String?>(),
        'hospital': FormControl<String?>(),
        'dateOfUpdate': FormControl<DateTime>(
          validators: [Validators.required],
        ),
        'departmentName': FormControl<String>(),
        'nameKanji': FormControl<String>(),
        'nameKana': FormControl<String>(),
        'telephoneNumber': FormControl<String>(),
        'email': FormControl<String>(),
        'faxNumber': FormControl<String>(),
      }),
    ]),
    'addDoctorProfile': FormArray([
      FormGroup({
        '_id': FormControl<String?>(),
        'hospital': FormControl<String?>(),
        'profile': FormControl<String>(),
        'photoRelease': FormControl<String>(),
        'name': FormControl<String>(),
        'remark': FormControl<String>(),
        'departmentName': FormControl<String>(),
        'post': FormControl<String>(),
        'specialty': FormControl<String>(),
        'nameKanji': FormControl<String>(),
        'nameKana': FormControl<String>(),
        'affiliatedAcademicSociety': FormArray([
          FormGroup({
            'name': FormControl<String>(),
          })
        ]),
        'qualifications': FormArray([
          FormGroup({
            'name': FormControl<String>(),
          })
        ]),
        'onlineMedicalTreatment': FormControl<String>(),
        'trainingCompletionCertificateNumber': FormControl<String>(),
        'completionCertificate': FormArray([
          FormGroup({
            'name': FormControl<String>(),
          })
        ]),
        'telephoneNumber': FormControl<String>(),
        'faxNumber': FormControl<String>(),
        'email': FormControl<String>(),
        'remark2': FormControl<String>(),
      })
    ]),
    'additionalInformationSection': FormGroup({
      '_id': FormControl<String?>(),
      'hospital': FormControl<String?>(),
      'outsourcingContract': FormControl<String>(),
      'contract': FormArray([
        FormGroup({
          'name': FormControl<String>(),
        })
      ]),
      'msCorporation': FormControl<String>(),
      'referralFee': FormControl<String>(),
      'treatmentCostPointCalculationPerPoint': FormControl<String>(),
      'remark': FormControl<String>(),
      'paymentSiteTighten': FormControl<String>(),
      'paymentSitePayment': FormControl<String>(),
    }),
    'paymentOptionSection': FormGroup({
      '_id': FormControl<String?>(),
      'hospital': FormControl<String?>(),
      'payer': FormControl<String>(),
      'paymentTiming': FormControl<String>(),
      'feeBack': FormControl<String>(),
      'paymentDirectlyToTheHospital': FormControl<String>(),
      'transfer': FormControl<bool>(value: false),
      'electronicPayment': FormControl<bool>(value: false),
      'alipay': FormControl<bool>(value: false),
      'unionPayPay': FormControl<bool>(value: false),
      'unionPay': FormControl<bool>(value: false),
      'weChatPay': FormControl<bool>(value: false),
      'creditCard': FormControl<bool>(value: false),
      'visa': FormControl<bool>(value: false),
      'masterCard': FormControl<bool>(value: false),
      'americanExpress': FormControl<bool>(value: false),
      'jcb': FormControl<bool>(value: false),
      'cash': FormControl<bool>(value: false),
      'remark': FormControl<String>(),
    }),
    'supportLanguageSection': createSupportLanguageSection(languages),
  });
}

List<String> languages = ['中国語', 'ベトナム語', '英語', '自由入力'];

FormArray createSupportLanguageSection(List<String> languages) {
  return FormArray(
    languages
        .map((language) => FormGroup({
              '_id': FormControl<String?>(),
              'hospital': FormControl<String?>(),
              'supportLanguage': FormControl<String>(value: language),
              'foreignStaff': FormControl<bool>(value: false),
              'medicalInterpretationSupport': FormControl<bool>(value: false),
            }))
        .toList(),
  );
}
