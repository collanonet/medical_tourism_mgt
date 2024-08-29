// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

Map<String, String Function(Object)> validationMessages = {
  ValidationMessage.required: (error) => '必須項目です',
  ValidationMessage.pattern: (error) => '無効な値です',
  ValidationMessage.email: (error) => '無効なメールアドレスです',
  ValidationMessage.number: (error) => '無効な数値です',
};
