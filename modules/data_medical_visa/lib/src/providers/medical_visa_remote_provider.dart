import 'dart:io';

import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class MedicalVisaRemoteProvider {
  MedicalVisaRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;


}
