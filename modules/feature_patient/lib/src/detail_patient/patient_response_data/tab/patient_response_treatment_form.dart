import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm() => FormGroup({
      'number_people': FormControl<int>(), // 健診希望人数
      'age': FormControl<int>(), // 年齢
      'sex': FormControl<String>(), // 性別
      'relationship ': FormControl<String>(), // 本人との関係
      'attend': FormControl<String>(), // 希望する医療機関はありますか
      'disease': FormControl<String>(), // 希望するエリア・医療機関名
      'reason': FormControl<String>(), // 理由
      'PET_CT': FormControl<DateTime>(), // PET-CT
      'MRI': FormControl<String>(), // MRI
      'Gastroscope': FormControl<String>(), // 胃カメラ
      'Free_input': FormControl<String>(), // 自由入力
      'concerned ': FormControl<String>(), // 現在気になっていること
      'introducer': FormControl<String>(), // 仲介会社・紹介者
      'cancer_History ': FormControl<String>(), // がんの既往歴
      'cancer_site': FormControl<String>(), // がんの部位
      'currently_diabetes': FormControl<String>(), // 現在糖尿病
      'diabetes_medication': FormControl<String>(), // 糖尿病服薬
      'fasting_blood_sugar': FormControl<String>(), // 空腹時血糖
      'implant': FormControl<String>(), // インプラント
      'implant_date': FormControl<DateTime>(), // インプラントをした時期
      'Body_metal_tattoo': FormControl<String>(), // 体内金属/刺青（tatooo）
      'MRI_after_having_metal': FormControl<String>(), // 体内金属後に/刺青後にMRI受診したことが
      'Part_material': FormControl<String>(), // 部位とその材質
      'Claustrophobia': FormControl<String>(), // 閉所恐怖症
    });
