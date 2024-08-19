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

  ValueNotifier<List<Type>> typeData = ValueNotifier([
    Type(type: '健診'),
    Type(type: '治療'),
    Type(type: '陽子線'),
    Type(type: '美容'),
  ]);


  ValueNotifier<List<Area>> areaData = ValueNotifier([
    Area(item: '大阪'),
    Area(item: '神奈川'),
    Area(item: '東京'),
    Area(item: '千葉'),
     Area(item: '兵庫'),
  ]);

  ValueNotifier<List<WithR>> withRData = ValueNotifier([
    WithR(item: 'o'),
    WithR(item: 'O'),
  ]);
}


class Type{
  String type;
  Type({required this.type});

}

class Area{
  String item;
  Area({required this.item});
}

class WithR{
  String item;
  WithR({required this.item});
}
