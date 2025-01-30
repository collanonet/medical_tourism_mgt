// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class HospitalModel with ChangeNotifier {
  HospitalModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<BasicInformationHospitalResponse>>> hospitals =
      ValueNotifier(const AsyncData());

  Future<void> fetchHospitals({FormGroup? form}) async {
    hospitals.value = const AsyncData(loading: true);
    notifyListeners();
    try {
      await hospitalRepository
          .getHospitals(
        hospitalNameChinese: form?.control('hospitalName').value,
        hospitalNameKatakana: form?.control('hospitalName').value,
        healthCheckup: form?.control('type').value != null
            ? form?.control('type').value == '健診'
            : null,
        treatment: form?.control('type').value != null
            ? form?.control('type').value == '治療'
            : null,
        heavyIonBeam: form?.control('type').value != null
            ? form?.control('type').value == '重粒子線'
            : null,
        protonBeam: form?.control('type').value != null
            ? form?.control('type').value == '陽子線'
            : null,
        regenerativeMedicine: form?.control('type').value != null
            ? form?.control('type').value == '再生医療'
            : null,
        beauty: form?.control('type').value != null
            ? form?.control('type').value == '美容'
            : null,
        rHave: form?.control('rHave').value,
        universityHospitalType:
            form?.control('universityHospitalType').value != null
                ? form?.control('universityHospitalType').value
                : null,
        nationalAndPublicHospitalsType:
            form?.control('nationalAndPublicHospitalsType').value != null
                ? form?.control('nationalAndPublicHospitalsType').value
                : null,
        privateHospitalType: form?.control('privateHospitalType').value != null
            ? form?.control('privateHospitalType').value
            : null,
        clinicType: form?.control('clinicType').value != null
            ? form?.control('clinicType').value
            : null,
      )
          .then((response) {
        logger.d(response.length);
        hospitals.value = AsyncData(data: response);
        notifyListeners();
      }).catchError((error) {
        logger.e(error);
        hospitals.value = AsyncData(error: error);
      }).whenComplete(() {
        notifyListeners();
      });
    } catch (e) {
      hospitals.value = AsyncData(error: e);
    }
  }

  ValueNotifier<List<Type>> typeData = ValueNotifier([
    Type(type: '健診'), // healthCheckup
    Type(type: '治療'), // treatment
    Type(type: '重粒子線'), // heavyIonBeam
    Type(type: '陽子線'), // protonBeam
    Type(type: '再生医療'), // regenerativeMedicine
    Type(type: '美容'), // beauty
  ]);

  ValueNotifier<List<Area>> areaData = ValueNotifier([
    Area(item: '北海道'),
    Area(item: '青森県'),
    Area(item: '岩手県'),
    Area(item: '宮城県'),
    Area(item: '秋田県'),
    Area(item: '山形県'),
    Area(item: '福島県'),
    Area(item: '茨城県'),
    Area(item: '栃木県'),
    Area(item: '群馬県'),
    Area(item: '埼玉県'),
    Area(item: '千葉県'),
    Area(item: '東京都'),
    Area(item: '神奈川県'),
  ]);

  ValueNotifier<List<WithR>> withRData = ValueNotifier([
    WithR(item: '◎'),
    WithR(item: '○'),
  ]);
}

class Type {
  String type;

  Type({required this.type});
}

class Area {
  String item;

  Area({required this.item});
}

class WithR {
  String item;

  WithR({required this.item});
}
