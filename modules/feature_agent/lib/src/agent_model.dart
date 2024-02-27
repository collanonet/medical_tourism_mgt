import 'package:data_agent/data_agent.dart';
import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentModel with ChangeNotifier {
  AgentModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;
}