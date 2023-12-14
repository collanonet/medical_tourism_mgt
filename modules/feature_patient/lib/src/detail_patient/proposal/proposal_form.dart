import 'package:reactive_forms/reactive_forms.dart';

FormGroup proposalForm() {
  return FormGroup({
    'hospital_name': FormControl<String>(value: '大阪府済生会吹田病院'),
    'postal_code': FormControl<String>(value: '564-0013'),
    'address': FormControl<String>(value: '大阪府吹田市川園町１−２'),
    'summary': FormControl<String>(value: '''
長年、大阪府下有数の分娩件数を誇っており、OGCS（産婦人科診療相互援助システム）・NMCS（新生時児診療相互援助システム）の参加、NICU（新生児集中治療室）設置。大阪府地域周産期母子医療センターの認定
最新の画像診断機器・放射線治療機器・内視鏡機器を整備、各科連携のもとに集学的ながん診療施設として、早期診断・早期治療の実施。大阪府がん診療拠点病院の指定
24時間体制の救急センター、ICU（集中治療室）を設置し、各種救急疾患に対応、循環器科についてはホットラインを敷き24時間対応
総合リハビリテーションの承認施設として、急性期リハビリテーション医療、スポーツリハビリテーションの提供、理学・作業・言語療法の実施
大阪府肝炎専門医療機関として、肝がん・NASHなど肝疾患の診療
院内LANネットワークを構築し、オーダ・業務系、画像系システム、病院ホームページ、グループウエアを順次導入、2004年から電子カルテ稼動
      '''),
  });
}
