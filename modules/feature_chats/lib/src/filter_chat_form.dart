// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterChat() => FormGroup(
      {
        'patientNameMessage': FormControl<String>(),
      },
    );
