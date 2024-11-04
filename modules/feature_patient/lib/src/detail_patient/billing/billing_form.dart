import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup billingForm() => FormGroup({
      // treatment cost
      'deposit': FormControl<double>(),
      'settlementFee': FormControl<double>(),
      'balance': FormControl<double>(),
      'treatment_cost': FormArray([
        FormGroup({
          'occurrence_date': FormControl<DateTime>(
           
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'hospitalName': FormControl<String>(value: ''),
          'treatment_details': FormControl<String>(value: ''),
          'amount': FormControl<String>(
            value: '',
          ),
          'remaining_amount': FormControl<String>(
            value: '',
            disabled: true,
          ),
          'file' : FormControl<FileSelect>(),
        }),
      ]),
      'remarks': FormControl<String>(value: ''),
    });
