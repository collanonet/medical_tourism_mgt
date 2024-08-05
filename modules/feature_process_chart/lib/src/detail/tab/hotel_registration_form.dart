import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelRegistrationForm() => FormGroup(
      {
        'Name_of_facility': FormControl<String>(value: ''), // 施設名
        'location': FormControl<String>(value: ''), // 所在地
        'Person_in_charge_name': FormControl<String>(value: ''), // 担当者名
        'telephone_number': FormControl<String>(value: ''), // 電話番号
        '1_night_price': FormControl<String>(value: ''), // 1泊の料金
        'Accommodation_memo': FormControl<String>(value: ''), // 宿泊メモ
        'Foreign_language_staff': FormControl<String>(value: ''), // 外国語スタッフ
        'evaluation': FormControl<String>(value: ''),// 評価
        'japanese' : FormControl<bool>(value: false),
        'chinese' : FormControl<bool>(value: false),
        'vietnamese' : FormControl<bool>(value: false),
        'english' : FormControl<bool>(value: false),
        'other' : FormControl<bool>(value: false),
      },
    );
