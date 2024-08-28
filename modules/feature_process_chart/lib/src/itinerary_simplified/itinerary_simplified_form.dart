// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup itinerarySimplifiedForm() {
  return FormGroup({
    'title': FormGroup({
      'patientName': FormControl<String>(value: ''), // 患者名
      'Medical_institution_name': FormControl<String>(value: ''), // 医療機関名
      'Consultation_date_and_time': FormControl<String>(value: ''), // 受診日時
      'Start_time': FormControl<String>(value: ''), // 開始時間
      'Ending_time_planned': FormControl<String>(value: ''), // 終了時間（予定）
      'health_checkup_package': FormControl<String>(value: ''), // 健康診断パッケージ
      'Add_option': FormArray([
        FormGroup({
          'option_name': FormControl<String>(value: ''), // オプション名
          'Medical_examination_day': FormControl<String>(value: ''), // 健診日
          'date': FormControl<String>(value: ''), // 日時
          'time': FormControl<String>(value: ''),
        })
      ])
    }),
    //事前説明
    'prior_explanation': FormGroup({
      'Explanation_of_various_tests': FormControl<String>(value: ''), // 各種検査の説明
      'Explanation_of_various_tests_note': FormControl<String>(value: ''),
      'Meals_before_and_on_the_day_of_the_test':
          FormControl<String>(value: ''), // 検査前・当日の食事について
      'About_taking_medicine': FormControl<String>(value: ''), // 薬の服用について
      'What_to_bring_on_the_day_of_the_medical_examination':
          FormControl<String>(value: ''), // 健康診断当日の持ち物
      'Other_considerations': FormControl<String>(value: ''), // その他の考慮事項
    }),
    'interpreter_or_guide_input': FormGroup({
      'interpreter_or_guide': FormControl<String>(value: ''), // 通訳者またはガイド
      'date': FormControl<String>(value: ''), // 合流日時
      'time': FormControl<String>(value: ''),
      'meeting_place': FormControl<String>(value: ''), // 合流場所
    }),
    //送迎
    'Transfer_input': FormGroup({
      'Transfer': FormControl<String>(value: ''), // 送迎
      'date': FormControl<String>(value: ''), // 合流日時
      'time': FormControl<String>(value: ''),
      'place': FormControl<String>(value: ''), // 場所
      'Driver_in_charge': FormControl<String>(value: ''), // 担当ドライバー
    }),
  });
}
