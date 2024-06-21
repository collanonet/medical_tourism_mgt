import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HospitalModel with ChangeNotifier {
  HospitalModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<BasicInformationHospitalResponse>>> hospitals =
      ValueNotifier(const AsyncData());

  Future<void> fetchHospitals() async {
    hospitals.value = const AsyncData(loading: true);
    try {
      final response = await hospitalRepository.getHospitals();
      logger.d(response.length);
      hospitals.value = AsyncData(data: response);
    } catch (e) {
      hospitals.value = AsyncData(error: e);
    }
  }
}
