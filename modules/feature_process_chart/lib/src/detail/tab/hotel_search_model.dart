import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HotelSearchModel{
  HotelSearchModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;


  ValueNotifier<AsyncData<DetailHotelSearchResponse>> hotelSearchData =ValueNotifier(const AsyncData());

  Future<void> fetchHotelSearch({
    String? accommodationName,
    String? accommodationType,
    String? area,
    bool? usageRecord,
    bool? japanese,
    bool? english,
    bool? vietnamese,
    bool? thai,
    bool? korean,
    bool? chinese,
  }) async{
    try{
      hotelSearchData.value = const  AsyncData(loading: true);
      final response = await processChartRepository.getDetailHotelSearch(
        accommodationName: accommodationName,
        accommodationType: accommodationType,
        area: area,
        usageRecord: usageRecord,
        japanese: japanese,
        english: english,
        vietnamese: vietnamese,
        thai: thai,
        korean: korean,
        chinese: chinese,
      );

      //insertHotelSearch(formGroup, response);
      hotelSearchData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      hotelSearchData.value = AsyncData(error: e);
    }
  }

  // void insertHotelSearch(FormGroup formGroup,DetailHotelSearchResponse? data){
  //   formGroup.control('accommodationName').value = data?.accommodationName;
  //   formGroup.control('accommodationType').value = data?.accommodationType;
  //   formGroup.control('usageRecord').value = data?.usageRecord;
  //   formGroup.control('area').value = data?.area;
  //   formGroup.control('supported_language').value = data?.supportedLanguage;
  //   formGroup.control('hotel').value = data?.hotel;
  //   formGroup.control('apartment_hotel').value = data?.apartmentHotel;
  //   formGroup.control('usage_history').value = data?.usageHistory;
  //   formGroup.control('japanese').value = data?.japanese;
  //   formGroup.control('chinese').value = data?.chinese;
  //   formGroup.control('vietnamese').value = data?.vietnamese;
  //   formGroup.control('english').value = data?.english;
  //   formGroup.control('korean').value = data?.korean;
  //   formGroup.control('thai').value = data?.thai;
  // }


  // ValueNotifier<AsyncData<DetailHotelSearchResponse>> submitHotelSearchData =ValueNotifier(const AsyncData());

  // Future<void> submitHotelSearch(FormGroup formGroup) async{
  //   try{
  //     submitHotelSearchData.value = const  AsyncData(loading: true);
  //     final response = await processChartRepository.postDetialHotelSearch(
  //       DetailHotelSearchRequest(
  //         accommodationName: formGroup.control('accommodationName').value,
  //         accommodationType: formGroup.control('accommodationType').value,
  //         usageRecord: formGroup.control('Usage_record').value,
  //         area: formGroup.control('area').value,
  //         supportedLanguage: formGroup.control('supported_language').value,
  //         hotel: formGroup.control('hotel').value,
  //         apartmentHotel: formGroup.control('apartment_hotel').value,
  //         usageHistory: formGroup.control('usage_history').value,
  //         japanese: formGroup.control('japanese').value,
  //         chinese: formGroup.control('chinese').value,
  //         vietnamese: formGroup.control('vietnamese').value,
  //         english: formGroup.control('english').value,
  //         korean: formGroup.control('korean').value,
  //         thai: formGroup.control('thai').value,
  //       ),
  //     );
  //     submitHotelSearchData.value = AsyncData(data: response);
  //     hotelSearchData.value = AsyncData(data: response);

  //   }catch(e){
  //     logger.d(e);
  //     submitHotelSearchData.value = AsyncData(error: e.toString());
  //   }
  // }
}
