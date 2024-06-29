import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityForm() => FormGroup(
      {
        'Hotel': FormArray([
          // ホテル
          FormGroup({
            'Person_in_charge_of_arrangements':
                FormControl<String>(value: ''), // 手配担当
            'Name_of_facility': FormControl<String>(value: ''), // 施設名
            'location': FormControl<String>(value: ''), // 所在地
            'Person_in_charge_name': FormControl<String>(value: ''), // 担当者名
            'telephone_number': FormControl<String>(value: ''), // 電話番号
            'remarks': FormControl<String>(value: ''), // 備考
            'Foreign_language_staff': FormControl<String>(value: ''), // 外国語スタッフ
            'japanese': FormControl<bool>(), //
            'chinese': FormControl<bool>(), //
            'vietnamese': FormControl<bool>(), //
            'english': FormControl<bool>(), //
            'others': FormControl<bool>(), //
          }),
        ]),
        'drop_in_facility': FormGroup({
          'Person_in_charge_of_arrangements':
              FormControl<String>(value: ''), // 手配担当
          'facility': FormArray([
            FormGroup({
              'Name_of_facility': FormControl<String>(value: ''), // 施設名
              'location': FormControl<String>(value: ''), // 所在地
              'Person_in_charge_name': FormControl<String>(value: ''), // 担当者名
              'telephone_number': FormControl<String>(value: ''), // 電話番号
            })
          ])
        })
      },
    );
