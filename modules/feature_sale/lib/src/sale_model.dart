import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';

class SaleModel with ChangeNotifier {
  SaleModel({
    required this.authRepository,
  });

  final AuthRepository authRepository;
}
