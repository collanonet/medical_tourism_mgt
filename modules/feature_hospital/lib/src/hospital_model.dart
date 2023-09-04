import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class HospitalModel with ChangeNotifier {
  HospitalModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
