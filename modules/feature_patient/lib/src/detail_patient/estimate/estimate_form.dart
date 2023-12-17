import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateForm() => FormGroup({
      'title_estimate': FormGroup({
        'title': FormControl<String>(value: '劉 偉強 様 呼吸器疾患の受診（京大病院）'),
        'quotation_number': FormControl<String>(value: '19Y−0630−1'),
        'issue_date': FormControl<DateTime>(value: DateTime.now()),
        'disclosure_agent_patient': FormControl<String>(value: '見積書'),
        'payment_due_date': FormControl<DateTime>(value: DateTime.now()),
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
      // search treatment_cost
      'search_treatment_cost': FormGroup({
        'search_hospital_name': FormControl<String>(value: '免疫活性化血管内治療　1回コース'),
      }),
    });
