import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class HotelSearchModel{
  HotelSearchModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;


  ValueNotifier<AsyncData<DetailHotelSearchResponse>> hotelSearchData =ValueNotifier(const AsyncData());

  Future<void> fetchHotelSearch(FormGroup formGroup) async{
    try{
      hotelSearchData.value = const  AsyncData(loading: true);
      final response = await processChartRepository.getDetailHotelSearch();

      insertHotelSearch(formGroup, response);
      hotelSearchData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }

  void insertHotelSearch(FormGroup formGroup,DetailHotelSearchResponse? data){
    formGroup.control('Name_of_facility').value = data?.name;
    formGroup.control('type').value = data?.type;
    formGroup.control('Usage_record').value = data?.usageRecord;
    formGroup.control('area').value = data?.area;
    formGroup.control('supported_language').value = data?.supportedLanguage;
    formGroup.control('hotel').value = data?.hotel;
    formGroup.control('apartment_hotel').value = data?.apartmentHotel;
    formGroup.control('usage_history').value = data?.usageHistory;
    formGroup.control('japanese').value = data?.japanese;
    formGroup.control('chinese').value = data?.chinese;
    formGroup.control('vietnamese').value = data?.vietnamese;
    formGroup.control('english').value = data?.english;
    formGroup.control('korean').value = data?.korean;
    formGroup.control('thai').value = data?.thai;
  }


  ValueNotifier<AsyncData<DetailHotelSearchResponse>> submitHotelSearchData =ValueNotifier(const AsyncData());

  Future<void> submitHotelSearch(FormGroup formGroup) async{
    try{
      submitHotelSearchData.value = const  AsyncData(loading: true);
      final response = await processChartRepository.postDetialHotelSearch(
        DetailHotelSearchRequest(
          name: formGroup.control('Name_of_facility').value,
          type: formGroup.control('type').value,
          usageRecord: formGroup.control('Usage_record').value,
          area: formGroup.control('area').value,
          supportedLanguage: formGroup.control('supported_language').value,
          hotel: formGroup.control('hotel').value,
          apartmentHotel: formGroup.control('apartment_hotel').value,
          usageHistory: formGroup.control('usage_history').value,
          japanese: formGroup.control('japanese').value,
          chinese: formGroup.control('chinese').value,
            vietnamese: formGroup.control('vietnamese').value,
            english: formGroup.control('english').value,
          korean: formGroup.control('korean').value,
          thai: formGroup.control('thai').value,
         
        

        ),
      );
      submitHotelSearchData.value = AsyncData(data: response);
      hotelSearchData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitHotelSearchData.value = AsyncData(error: e.toString());
    }
  }
}
