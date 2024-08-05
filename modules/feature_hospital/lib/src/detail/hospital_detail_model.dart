import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class HospitalDetailModel {
  HospitalDetailModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<BasicInformationHospitalResponse>>
      basicInformationData = ValueNotifier(const AsyncData());

  void update(BasicInformationHospitalResponse data) {
    basicInformationData.value = AsyncData(data: data);
  }
}
