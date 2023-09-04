import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class QuotationModel with ChangeNotifier {
  QuotationModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
