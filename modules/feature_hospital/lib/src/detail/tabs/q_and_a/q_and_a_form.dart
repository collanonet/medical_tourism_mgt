import 'package:reactive_forms/reactive_forms.dart';

FormGroup qAndAForm({required String hospital}) {
  return FormGroup({
    'newRegistrationSection':  FormGroup({
      'hospital': FormControl<String>(value: hospital),
      'updateDate': FormControl<DateTime>(validators: [Validators.required]),
      'updatedBy': FormControl<String>(validators: [Validators.required]),
      'classification': FormControl<String>(validators: [Validators.required]),
      'shareThisQADataWithHospitals':
          FormControl<bool>(validators: [Validators.required]),
      'question': FormControl<String>(validators: [Validators.required]),
      'answer': FormControl<String>(validators: [Validators.required]),
    }),
    'listSection': FormGroup({
      'classification': FormControl<String>(),
      'enterKeyword': FormControl<String>(),
      'about': FormControl<String>(
          value:
              '3.0T MRI装置を導入しています。3.0T MRI装置は、撮影時における複数回の息止めが不要になりました。息止めをすることなく自由呼吸でブレのない止まっている画像提供が可能です。最新のAI技術を用い画像を作成することで、高画質な画像の提供が可能です。高速撮像により検査時間の短縮ができ、患者さんの負担軽減できます。当院の血管撮影装置は、高度な画像処理技術により画像の高画質化が可能です。被爆の適切なモニタリングにより一層の被ばくの低減が可能です。'),
    }),
  });
}
