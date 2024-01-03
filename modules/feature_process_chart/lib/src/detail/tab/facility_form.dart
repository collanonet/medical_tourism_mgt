import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityForm() => FormGroup(
      {
        '手配担当': FormControl<String>(value: ''), // 手配担当
        '施設名': FormControl<String>(value: ''), // 施設名
        '所在地': FormControl<String>(value: ''), // 所在地
        '担当者名': FormControl<String>(value: ''), // 担当者名
        '電話番号': FormControl<String>(value: ''), // 電話番号
        '備考': FormControl<String>(value: ''), // 備考
        '外国語スタッフ': FormControl<String>(value: ''), // 外国語スタッフ
      },
    );
