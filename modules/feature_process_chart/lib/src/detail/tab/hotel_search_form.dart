import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelSearchForm() => FormGroup(
      {
        'Name_of_facility': FormControl<String>(value: ''), // 施設名
        'type': FormControl<String>(value: ''), // タイプ
        'Usage_record': FormControl<String>(value: ''), // 利用実績
        'area': FormControl<String>(value: ''), // エリア
        'supported_language': FormControl<String>(value: ''), // 対応言語
        'hotel': FormControl<bool>(), //
        'apartment_hotel' : FormControl<bool>(), //
        'usage_history' : FormControl<String>(), //
        'japanese' : FormControl<bool>(value: false),
        'chinese' : FormControl<bool>(value: false),
        'vietnamese' : FormControl<bool>(value: false),
        'english' : FormControl<bool>(value: false),
        'korean' : FormControl<bool>(value: false),
        'thai' : FormControl<bool>(value: false),
      },
    );
