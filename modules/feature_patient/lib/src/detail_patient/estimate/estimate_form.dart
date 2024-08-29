// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateForm() => FormGroup({
      'title_estimate': FormGroup({
        'title': FormControl<String>(value: '劉 偉強 様 呼吸器疾患の受診（京大病院）'),
        'quotation_number': FormControl<String>(value: '19Y−0630−1'),
        'issueDate': FormControl<DateTime>(
          value: DateTime.now(),
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'disclosure_agent_patient': FormControl<String>(value: '見積書'),
        'payment_due_date': FormControl<DateTime>(
          value: DateTime.now(),
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'payment_terms': FormControl<String>(value: '来日前前金（預り金）、終了後精算'),
        'contact_person': FormControl<String>(value: '谷川'),
        'prospective': FormControl<String>(value: 'A'),
      }),
      // Agent
      'agent': FormGroup({
        'agent_company_name': FormControl<String>(value: '大瀚人力资源集团'),
        'full_name_kanji': FormControl<String>(value: '李　若汐'),
        'name_kana': FormControl<String>(value: 'リ　ルォシー'),
      }),
      'introducer': FormGroup({
        'introducer_company_name': FormControl<String>(value: '大瀚人力资源集团'),
        'full_name_kanji': FormControl<String>(value: '李　若汐'),
        'name_kana': FormControl<String>(value: 'リ　ルォシー'),
      }),
      // treatment cost
      'treatment_cost': FormArray([
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
      ]),
      'service_fee': FormArray([
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'item': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
          'quantity': FormControl<String>(value: '1'),
          'unit_price': FormControl<String>(value: '100,000'),
          'amount': FormControl<String>(value: '日数による'),
          'cost': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
          'profit': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
      ]),
      // search treatment_cost
      'search_treatment_cost': FormGroup({
        'search_hospitalName': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
      }),
      'search_service_fee': FormGroup({
        'search_hospitalName': FormControl<String>(value: '基本メニュー'),
      }),
      'memo': FormControl<String>(value: '''
2023/5/12　①																									
ベトナム人患者様の検査・治療のコーディネートに関するお見積もりをお送りします。																									
1回目の来日は観光ビザ（貴社手配）で初診と検査のみ、2回目に医療ビザ取得（弊社にて身元保証）にて治療のため来日を想定し、																									
2回ともに必要な項目についてお見積しています。																									
																									
検査と治療について：																									
初診と検査は1日です。（午前中いっぱいで恐らく終わると思いますが）																									
尿検査、CT、膀胱鏡を予定。																									
尿検査の細菌培養検査結果が出るのに1週間程度かかります。																									
結果を見て治療方針を決定するため、一旦帰国して2回目の来日が必要となります。																									
経尿道的尿路結石破砕術（TUL：transurethral lithotomy）にて治療を行う場合は、一般的に2泊3日の入院となるそうです。																									
患者様滞在中に検査結果と治療の説明が受けられればよいですが、帰国後になった場合、ご希望によりオンラインでの説明も可能です。																									
結果をメール等でお知らせするのみでよろしければ、費用はかかりません。																									
検査費用と、膀胱結石の診断がついた場合の治療費概算を確認中、追ってご連絡します。																									
貴社にて前金お預かりをお願いします。																									
																									
担当医師：泌尿器科　医長　村山 慎一郎																									
https://ohori-hosp.jp/division/urology/doctor/#p08																									
毎週水曜の午前中の外来となります。																									
ビザの状況がわかり次第、初診の予約を取ります。																									
																									
東京国際大堀病院のベトナム語のパンフレットをお送りします。ご参考ください。																									
																									
																									
2023/5/12　②																									
検査費用と治療費の概算が出ましたので、お知らせします。																									
日本の保険証を持たない外国人用の料金として、病院が設定している料金です。																									
あくまでも概算で、実際の検査・治療終了後に診療報酬明細によってお支払い金額が決定します。																									
																									
検査費用：12万円前後																									
治療費用：TULでの治療なら130万円前後＋個室代別途、実費。																									
前日入院の場合もあるので、念のため3泊4日と考えておいてください。																									
一番高い個室が17,600円（税込）／日で、3泊4日ですと×4になります。																									
付き添いご家族と泊まり込み通訳者（入院中は医療通訳でなくても可）の室料もかかりますが、																									
ベッドの空き状況によりどのような部屋をどう使うのか、詳細は入院手続き時に確認となります。																																																	
  '''),
    });
