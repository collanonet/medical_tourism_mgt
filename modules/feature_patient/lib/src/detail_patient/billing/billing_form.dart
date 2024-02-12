import 'package:reactive_forms/reactive_forms.dart';

FormGroup billingForm() => FormGroup({
      // treatment cost
      'treatment_cost': FormArray([
        FormGroup({
          'occurrence_date': FormControl<DateTime>(
            value: DateTime.now(),
          ),
          'hospitalName': FormControl<String>(
            value: 'りんくうメディカルクリニック'
          ),
          'treatment_details': FormControl<String>(
            value: '免疫活性化血管内治療　1回コース'
          ),
          'amount': FormControl<String>(
            value: '1,000,000',
          ),
          'remaining_amount': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'occurrence_date': FormControl<DateTime>(
            value: DateTime.now(),
          ),
          'hospitalName': FormControl<String>(
            value: 'りんくうメディカルクリニック'
          ),
          'treatment_details': FormControl<String>(
            value: '免疫活性化血管内治療　1回コース'
          ),
          'amount': FormControl<String>(
            value: '1,000,000',
          ),
          'remaining_amount': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'occurrence_date': FormControl<DateTime>(
            value: DateTime.now(),
          ),
          'hospitalName': FormControl<String>(
            value: 'りんくうメディカルクリニック'
          ),
          'treatment_details': FormControl<String>(
            value: '免疫活性化血管内治療　1回コース'
          ),
          'amount': FormControl<String>(
            value: '1,000,000',
          ),
          'remaining_amount': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
        FormGroup({
          'occurrence_date': FormControl<DateTime>(
            value: DateTime.now(),
          ),
          'hospitalName': FormControl<String>(
            value: 'りんくうメディカルクリニック'
          ),
          'treatment_details': FormControl<String>(
            value: '免疫活性化血管内治療　1回コース'
          ),
          'amount': FormControl<String>(
            value: '1,000,000',
          ),
          'remaining_amount': FormControl<String>(
            value: '5,000,000',
            disabled: true,
          ),
        }),
      ]),
      'remarks': FormControl<String>(value: '日本滞在中に現金で返金'),
    });
