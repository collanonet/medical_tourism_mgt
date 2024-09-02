// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SummaryListModel {
  SummaryListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<List<SummaryListResponse>>> summaryListData = ValueNotifier(const AsyncData<List<SummaryListResponse>>());
  Future<void> fetchSummaryList(String patientId) async{
    try {
      summaryListData.value = const AsyncData(loading: true);
      final response = await patientRepository.getSummaryList(patientId);
      summaryListData.value =  AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      summaryListData.value = AsyncData(error: e.toString());
    }
  }
    ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteDomesticMedical(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteDomesticMedical(id);
        summaryListData.value = AsyncData(
            data: summaryListData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
