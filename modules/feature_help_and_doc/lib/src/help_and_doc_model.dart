import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class HelpAndDocModel with ChangeNotifier {
  HelpAndDocModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
