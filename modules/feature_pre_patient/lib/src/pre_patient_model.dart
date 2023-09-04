import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class PrePatientModel with ChangeNotifier {
  PrePatientModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
