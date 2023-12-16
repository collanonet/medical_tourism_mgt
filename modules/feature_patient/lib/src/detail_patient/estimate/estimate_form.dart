import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateForm() => FormGroup({
      'medical_visa': FormControl<String>(),
      'application_date': FormControl<DateTime>(),
      'issue_date': FormControl<DateTime>(),
      'expiration_date': FormControl<DateTime>(),
      'accompanying_persons_number': FormControl<String>(),
      'visa_issuing_overseas_establishments': FormControl<String>(),
      'remarks': FormControl<String>(),
      'payment_status': FormControl<String>(),
    });
