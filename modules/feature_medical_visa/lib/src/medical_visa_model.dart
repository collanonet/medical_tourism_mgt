import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class MedicalVisaModel with ChangeNotifier {
  MedicalVisaModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
