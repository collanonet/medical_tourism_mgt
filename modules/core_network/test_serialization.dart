import 'lib/src/entities/request/itinerary_simplified_title_request.dart';
import 'dart:convert';

void main() {
  final addOption = AddOption(
    optionName: 'Test Option',
    medicalExaminationDay: '2025-01-01',
    date: '2025-01-01',
    time: '10:00',
  );

  final request = ItineraryTitleRequest(
    patientName: 'Test Patient',
    addOptions: [addOption],
  );

  final jsonMap = request.toJson();
  print(jsonEncode(jsonMap));

  // Also test deserialization
  final jsonString = '{"addOptions": [{"option_name": "Snake Option", "medical_examination_day": "2025-02-02"}]}';
  final decoded = ItineraryTitleRequest.fromJson(jsonDecode(jsonString));
  print('Decoded optionName: ${decoded.addOptions?.first.optionName}');
  print('Decoded medicalExaminationDay: ${decoded.addOptions?.first.medicalExaminationDay}');
}
