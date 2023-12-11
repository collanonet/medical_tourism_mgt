import 'package:reactive_forms/reactive_forms.dart';

FormGroup normalSummaryForm() {
  return FormGroup({
    'entry_date': FormControl<DateTime>(),
    //氏名（パスポート）
    'name_passport': FormControl<String>(
      disabled: true,
    ),
    // 生年月日
    'date_of_birth': FormControl<DateTime>(
      disabled: true,
    ),
    // 年齢
    'age': FormControl<int>(
      disabled: true,
    ),
    // 氏名（中国語漢字/ベトナム語表記）
    'name_chinese_vietnamese': FormControl<String>(
      disabled: true,
    ),

    'current_address': FormControl<String>(),
    // 氏名（カナ）
    'name_kana': FormControl<String>(
      disabled: true,
    ),
    // 携帯番号（患者様）
    'mobile_number_patient': FormControl<String>(
      disabled: true,
    ),
    // 性別
    'gender': FormControl<String>(
      disabled: true,
    ),
    'mobile_number_domestic': FormControl<String>(),
    'disease_name': FormControl<String>(),
    'tissue_type': FormControl<String>(),
    'special_note': FormControl<String>(),
    'reffer_medical_institution_name': FormControl<String>(),
    'preexisting_medical_conditions_family_history': FormControl<String>(),
    'referral_medical_institution_etc': FormControl<String>(),
    'course_illness_test_results_etc': FormControl<String>(value: '''
【経緯】
16歳の健診でＢ型肝炎の感染と認められた。その後、臨床症状等がなかったため、特に治療などもしなかったです。
2023年6月にベトナムのハノイにあるＸＡＮＨ　ＰＯＮ　病院で健診を受けたとき下記の所見がありました。
現時点では臨床症状は特になし。
・2023/6/6の血液検査：
・ＨＢＶ核酸定量検査：4330ＩＵ/mL    21650　Copies/mL
・白血球：　　好中球：上昇　40.5%  , リンパ球：上昇　49.6%
・血小板：149Ｇ/L
・血中尿酸：上昇　424.3 umol/l
・AST（GOT）：123.9 UI/L        ALT(GPT):281.2  UI/L        GGT:124.5 U/L     AFP:10.56 ng/ml
・腫瘍マーカー検査：　　CYFRA：2.85　ng/mL
・尿検査：異常なし
・腹部CT:異常なし
・2023/6/6の腹部エコー：異常なし

      '''),
    'medical_condition': FormControl<String>(),
    'special_note2': FormControl<String>(),
    'metastasis': FormControl<String>(),
    'radiotherapy': FormControl<String>(),
    'anticancer_drug_treatment': FormControl<String>(),
    'biopsy': FormControl<String>(),
    'patients_preferences': FormControl<String>(value: '''
日本の医師のオンライン診療を受け、治療方法や投薬について相談したい。
おすすめの薬があれば、処方箋を発行していただき、薬をベトナムに送ってほしい。
      '''),
    'agent_name': FormControl<String>(
      disabled: true,
    ),
    'person_in_charge_name': FormControl<String>(),
    'mobile_number': FormControl<String>(),
    'patients_address_stay': FormControl<String>(),
    'emergency_contact': FormControl<String>(),
    'remarks': FormControl<String>(),
  });
}
