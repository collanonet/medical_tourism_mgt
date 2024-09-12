import 'package:reactive_forms/reactive_forms.dart';

FormGroup relatedPartiesForm() => FormGroup(
  {
    //ガイドまたは通訳者
    'guideInterpreter': FormArray(
      [
        FormGroup(
          {
            'id': FormControl<String>(), // ID
            'arrangePerson': FormControl<String>(value: ''), // 手配担当
            'dateFrom': FormControl<DateTime>(), // 年月日（自）
            'dateTo': FormControl<DateTime>(), // 年月日（至）
            'guideNamaKanji': FormControl<String>(value: ''), // ガイド名（漢字）
            'guideNameKana': FormControl<String>(value: ''), // ガイド名（カナ）
            'phoneNumber': FormControl<String>(value: ''), // 電話番号
            'qualification': FormControl<List<String>>(value: []), // 資格
            'report': FormControl<String>(value: ''), // 報告書
            'accommodationAvailability':
            FormControl<String>(value: ''), // 同宿可否
            'accommodationName': FormControl<String>(value: ''), // 施設名
            'address': FormControl<String>(value: ''), // 所在地
            'phoneNumber2': FormControl<String>(value: ''),
            //qualification
            'itinerary_management': FormControl<bool>(value: false),
            'guide_interpreter': FormControl<bool>(value: false),
            'medical_interpreter': FormControl<bool>(value: false),

          },
        )
      ],
    ),
    //バス会社
    'busCompany': FormGroup(
      {
        'id': FormControl<String>(), // ID
        'arrangePerson': FormControl<String>(value: ''), // 手配担当
        'busCompanyName': FormControl<String>(value: ''), // バス会社名
        'contactPerson': FormControl<String>(value: ''), // 担当者
      },
    ),
    //ドライバー
    'driver': FormArray(
      [
        FormGroup(
          {
            'id': FormControl<String>(), // ID
            'dateYearFrom': FormControl<DateTime>(), // 年月日（自）
            'dateYearTo': FormControl<DateTime>(), // 年月日（至）
            'carNumber': FormControl<int>(), // 車番
            'vehicleType': FormControl<String>(value: ''), // 車種
            'driverNamaKanji':
            FormControl<String>(value: ''), // ドライバー名（漢字）
            'driverNameKana':
            FormControl<String>(value: ''), // ドライバー名（カナ）
            'phoneNumber': FormControl<String>(value: ''), // 電話番号
            'language': FormControl<List<String>>(value: []), // 対応言語
            'accommodationAvailability':
            FormControl<String>(value: ''), // 同宿可否
            'hotelArrangement': FormControl<String>(value: ''), // ホテル手配
            'accommodationName': FormControl<String>(value: ''), // 施設名
            'address': FormControl<String>(value: ''), // 所在地
            'phoneNumber2': FormControl<String>(value: ''),
            //language
            'japanese': FormControl<bool>(value: false),
            'chinese': FormControl<bool>(value: false),
            'vietnamese': FormControl<bool>(value: false),
            'english': FormControl<bool>(value: false),
            'korean': FormControl<bool>(value: false),
            'thai': FormControl<bool>(value: false),
          },
        )
      ],
    ),
    //緊急連絡先
    'emergencyContact': FormArray(
      [
        FormGroup(
          {
            'id': FormControl<String>(), // ID
            'dateYearFrom': FormControl<DateTime>(), // 年月日（自）
            'dateYearTo': FormControl<DateTime>(), // 年月日（至）
            'contactPersonNamaKanji':
            FormControl<String>(value: ''), // 担当者名（漢字）
            'contactPersonNameKana':
            FormControl<String>(value: ''), // 担当者名（カナ）
            'phoneNumber': FormControl<String>(value: ''), // 電話番号
          },
        )
      ],
    )
  },
);
