import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelSearchForm() => FormGroup(
      {
        'Name_of_facility': FormControl<String>(value: ''), // 施設名
        'type': FormControl<String>(value: ''), // タイプ
        'Usage_record': FormControl<String>(value: ''), // 利用実績
        'area': FormControl<String>(value: ''), // エリア
        'supported_language': FormControl<String>(value: ''), // 対応言語
      },
    );
