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
      await hospitalRepository.getHospitals(
        pageSize: 30,
        hospitalName: form?.control('hospitalName').value == null ? null : form!.control('hospitalName').value,
        type: form?.control('type').value == null ? null : form!.control('type').value,
        location: form?.control('location').value == null ? null : form!.control('location').value,
        rHave: form?.control('rHave').value == null ? null : form!.control('rHave').value,
        hospitalType1: form?.control('hospitalType1').value == null ? null : form!.control('hospitalType1').value,
        hospitalType2: form?.control('hospitalType2').value == null ? null : form!.control('hospitalType2').value,
        hospitalType3: form?.control('hospitalType3').value == null ? null : form!.control('hospitalType3').value,
        hospitalType4: form?.control('hospitalType4').value == null ? null : form!.control('hospitalType4').value,
      ).then((response){
          logger.d(response.length);
      hospitals.value = AsyncData(data: response);
      notifyListeners();
      }).catchError((error) {
        logger.e(error);
        hospitals.value = AsyncData(error: error);
      }).whenComplete((){
        notifyListeners();
      });
      
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
