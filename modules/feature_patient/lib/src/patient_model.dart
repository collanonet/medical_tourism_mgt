import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientModel with ChangeNotifier {
  PatientModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
