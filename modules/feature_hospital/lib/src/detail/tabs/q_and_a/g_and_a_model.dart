import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class QAndAModel extends ChangeNotifier {
  QAndAModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<NewRegistrationHospitalResponse>>>
      newRegistrationHospitalData = ValueNotifier(
          const AsyncData<List<NewRegistrationHospitalResponse>>(data: []));

  AsyncData<List<SearchQAResponse>>
      listSectionQAndAHospitalData = const AsyncData();

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchNewRegistrationHospital(formGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> fetchNewRegistrationHospital(
      FormGroup formGroup, String hospitalId) async {
    try {
      newRegistrationHospitalData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getNewRegistrationHospital(
        hospitalId,
      );
      // insertDataNewRegisterRequest(formGroup, result);
      newRegistrationHospitalData.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      newRegistrationHospitalData.value = AsyncData(error: e);
    }
  }

  Future<void> fetchSearchQA({String? classification,String? search}) async{
    
      listSectionQAndAHospitalData = const AsyncData(loading: true);
      notifyListeners();
      return hospitalRepository.getSearchQA(classification: classification,search: search).then((value){
        listSectionQAndAHospitalData = AsyncData(data: value);
     
      }).catchError((error){
        logger.d(error);
        listSectionQAndAHospitalData = AsyncData(error: error);
      }).whenComplete((){
        notifyListeners();
      });
   
  }

 AsyncData<SearchQAResponse> _postSearchQAData = const  AsyncData();
  AsyncData<SearchQAResponse> get postSearchQAData => _postSearchQAData;

  Future<void> postSearchQA(SearchQARequest searchQARequest) async{
    _postSearchQAData = const AsyncData(loading: true);
    notifyListeners();

    return hospitalRepository.postSearchQA(searchQARequest).then((value){
      _postSearchQAData = AsyncData(data: value);
    //  listSectionQAndAHospitalData.data?.removeWhere((element) => element.id == searchQARequest.)
    }).catchError((error){
      logger.d(error);
      _postSearchQAData = AsyncData(error: error);
    }).whenComplete((){
      notifyListeners();
    });
  }


  ValueNotifier<AsyncData<NewRegistrationHospitalResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitNewRegistrationHospital(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postNewRegistrationHospital(
        NewRegistrationHospitalRequest(
          hospital: formGroup.control('hospital').value,
          updateDate: formGroup.control('updateDate').value,
          updatedBy: formGroup.control('updatedBy').value,
          classification: formGroup.control('classification').value,
          shareThisQADataWithHospitals:
              formGroup.control('shareThisQADataWithHospitals').value,
          question: formGroup.control('question').value,
          answer: formGroup.control('answer').value,
        ),
      );
      submit.value = AsyncData(data: response);
      newRegistrationHospitalData.value = AsyncData(
          data: newRegistrationHospitalData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }
}
