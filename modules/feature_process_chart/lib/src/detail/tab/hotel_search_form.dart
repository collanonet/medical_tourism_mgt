// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelSearchForm() => FormGroup(
      {
        'accommodationName': FormControl<String>(value: ''), // 施設名
       // 'accommodationType': FormControl<List<String>>(value: []),
        'hotel': FormControl<bool>(), //
        'apartment_hotel': FormControl<bool>(), // // タイプ
        'usageRecord': FormControl<bool>(), // 利用実績
        'area': FormControl<String>(value: ''), // エリア
        'isJapanese': FormControl<bool>(value: false),
        'isChinese': FormControl<bool>(value: false),
        'isVietnamese': FormControl<bool>(value: false),
        'isEnglish': FormControl<bool>(value: false),
        'isKorean': FormControl<bool>(value: false),
        'isThai': FormControl<bool>(value: false),
      },
    );
