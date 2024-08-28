// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_auth/data_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuotationModel with ChangeNotifier {
  QuotationModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
