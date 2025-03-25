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
          area: form?.control('area').value,
        hospitalNameChinese: form?.control('hospitalName').value,
        healthCheckup: form?.control('type').value != null
            ? form?.control('type').value == '健診'
                ? true
                : null
            : null,
        treatment: form?.control('type').value != null
            ? form?.control('type').value == '治療'
                ? true
                : null
            : null,
        heavyIonBeam: form?.control('type').value != null
            ? form?.control('type').value == '重粒子線'
                ? true
                : null
            : null,
        protonBeam: form?.control('type').value != null
            ? form?.control('type').value == '陽子線'
                ? true
                : null
            : null,
        regenerativeMedicine: form?.control('type').value != null
            ? form?.control('type').value == '再生医療'
                ? true
                : null
            : null,
        beauty: form?.control('type').value != null
            ? form?.control('type').value == '美容'
                ? true
                : null
            : null,
        rHave: form?.control('rHave').value,
        universityHospitalType: form?.control('universityHospitalType').value,
        nationalAndPublicHospitalsType:
            form?.control('nationalAndPublicHospitalsType').value,
        privateHospitalType: form?.control('privateHospitalType').value,
        clinicType: form?.control('clinicType').value,
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
    ...[
      "北海道",
      "青森",
      "岩手",
      "宮城",
      "秋田",
      "山形",
      "福島",
      "茨城",
      "栃木",
      "群馬",
      "埼玉",
      "千葉",
      "東京",
      "神奈川",
      "新潟",
      "富山",
      "石川",
      "福井",
      "山梨",
      "長野",
      "岐阜",
      "静岡",
      "愛知",
      "三重",
      "滋賀",
      "京都",
      "大阪",
      "兵庫",
      "奈良",
      "和歌山",
      "鳥取",
      "島根",
      "岡山",
      "広島",
      "山口",
      "徳島",
      "香川",
      "愛媛",
      "高知",
      "福岡",
      "佐賀",
      "長崎",
      "熊本",
      "大分",
      "宮崎",
      "鹿児島",
      "沖縄"
    ].map((e) => Area(item: e)),
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
