import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityForm() => FormGroup(
      {
        'Hotel': FormArray(
          [
            FormGroup(
              {
                'arrangePerson': FormControl<String>(value: ''), // 手配担当
                'accommodationName': FormControl<String>(value: ''), // 施設名
                'address': FormControl<String>(value: ''), // 所在地
                'contactPersonName': FormControl<String>(value: ''), // 担当者名
                'phoneNumber': FormControl<String>(value: ''), // 電話番号
                'remarks': FormControl<String>(value: ''), // 備考
                'foreignLanguageStaff':
                    FormControl<List<String>>(value: []), // 外国語スタッフ
                'japanese': FormControl<bool>(value: false), //
                'chinese': FormControl<bool>(value: false), //
                'vietnamese': FormControl<bool>(value: false), //
                'english': FormControl<bool>(value: false), //
                'others': FormControl<String>(value: ''),
                'other': FormControl<bool>(value: false), //
              },
            ),
          ],
        ),
        'drop_in_facility': FormGroup(
          {
            'arrangePerson': FormControl<String>(value: ''), // 手配担当
            'places': FormArray([
              FormGroup({
                'accommodationName': FormControl<String>(value: ''), // 施設名
                'address': FormControl<String>(value: ''), // 所在地
                'contactPersonName': FormControl<String>(value: ''), // 担当者名
                'phoneNumber': FormControl<String>(value: ''), // 電話番号
              })
            ])
          },
        )
      },
    );
