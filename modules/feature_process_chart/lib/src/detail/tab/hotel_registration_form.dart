import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelRegistrationForm() => FormGroup({
      'accommodationName':
          FormControl<String>(validators: [Validators.required]),
      //'accommodationType': FormControl<List<String>>(validators: [Validators.required]),
      //'area': FormControl<String>(),
      'address': FormControl<String>(),
      'contactPersonName': FormControl<String>(),
      'phoneNumber': FormControl<String>(),
      'ratePerNight': FormControl<double>(),
      'accommodationMemo': FormControl<String>(),
      'isJapanese': FormControl<bool>(value: false),
      'isChinese': FormControl<bool>(value: false),
      'isVietnamese': FormControl<bool>(value: false),
      'isEnglish': FormControl<bool>(value: false),
      'isOthers': FormControl<bool>(value: false),
      'other': FormControl<String>(value: ''),
      'evaluation': FormControl<int>(),
      // 'memo': FormControl<String>(),
    });
