import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelRegistrationForm() => FormGroup({
    'accommodationName': FormControl<String>(validators: [Validators.required]),
    //'accommodationType': FormControl<List<String>>(validators: [Validators.required]),
   // 'area': FormControl<String>(),
    'address': FormControl<String>(),
    'contactPersonName': FormControl<String>(),
    'phoneNumber': FormControl<String>(),
    'ratePerNight': FormControl<double>(),
    'accommodationMemo': FormControl<String>(),
    'isJapanese': FormControl<bool>(),
    'isChinese': FormControl<bool>(),
    'isVietnamese': FormControl<bool>(),
    'isEnglish': FormControl<bool>(),
    'isOthers': FormControl<bool>(),
    'other': FormControl<String>(),
    'evaluation': FormControl<int>(),
   // 'memo': FormControl<String>(),
  });
