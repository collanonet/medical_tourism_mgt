import 'package:reactive_forms/reactive_forms.dart';

FormGroup relatedPartiesForm() => FormGroup(
      {
        //ガイドまたは通訳者
        'guideInterpreter': FormArray(
          [
            FormGroup(
              {
                'arrangePerson': FormControl<String>(value: ''), // 手配担当
                'dateFrom': FormControl<String>(value: ''), // 年月日（自）
                'dateTo': FormControl<String>(value: ''), // 年月日（至）
                'guideNamaKanji': FormControl<String>(value: ''), // ガイド名（漢字）
                'guideNameKana': FormControl<String>(value: ''), // ガイド名（カナ）
                'phoneNumber': FormControl<String>(value: ''), // 電話番号
                'qualification': FormControl<String>(value: ''), // 資格
                'report': FormControl<String>(value: ''), // 報告書
                'accommodationAvailability':
                    FormControl<String>(value: ''), // 同宿可否
                'accommodationName': FormControl<String>(value: ''), // 施設名
                'address': FormControl<String>(value: ''), // 所在地
                'phoneNumber2': FormControl<String>(value: ''), // 電話番号
                'itinerary_management': FormControl<bool>(value: false),
                'guide_interpreter': FormControl<bool>(value: false),
                'medical_interpreter': FormControl<bool>(value: false),
                'possibility_of_staying_together': FormControl<bool>(),
              },
            )
          ],
        ),
        //バス会社
        'busCompany': FormGroup(
          {
            'arrangePerson': FormControl<String>(value: ''), // 手配担当
            'busCompanyName': FormControl<String>(value: ''), // バス会社名
            'contactPerson': FormControl<String>(value: ''), // 担当者
          },
        ),
        //ドライバー
        'driver': FormArray(
          [
            FormGroup(
              {
                'Date_from': FormControl<String>(value: ''), // 年月日（自）
                'Date_to': FormControl<String>(value: ''), // 年月日（至）
                'car_number': FormControl<String>(value: ''), // 車番
                'Car_model': FormControl<String>(value: ''), // 車種
                'Driver_name_Kanji':
                    FormControl<String>(value: ''), // ドライバー名（漢字）
                'Driver_name_kana':
                    FormControl<String>(value: ''), // ドライバー名（カナ）
                'telephone_number_1': FormControl<String>(value: ''), // 電話番号
                'supported_language': FormControl<String>(value: ''), // 対応言語
                'Accommodation_possible':
                    FormControl<String>(value: ''), // 同宿可否
                'Hotel_arrangement': FormControl<String>(value: ''), // ホテル手配
                'Name_of_facility': FormControl<String>(value: ''), // 施設名
                'location': FormControl<String>(value: ''), // 所在地
                'telephone_number_2': FormControl<String>(value: ''), // 電話番号
                'car_model': FormControl<String>(value: ''), //
                'japanese': FormControl<bool>(value: false),
                'chinese': FormControl<bool>(value: false),
                'vietnamese': FormControl<bool>(value: false),
                'english': FormControl<bool>(value: false),
                'korean': FormControl<bool>(value: false),
                'other': FormControl<bool>(value: false),
                'possibility_of_staying_together': FormControl<bool>(),
                'hotel_arrangements': FormControl<bool>(),
              },
            )
          ],
        ),
        //緊急連絡先
        'emergency_contact': FormArray(
          [
            FormGroup(
              {
                'Date_from': FormControl<String>(value: ''), // 年月日（自）
                'Date_to': FormControl<String>(value: ''), // 年月日（至）
                'Person_in_charge_Kanji':
                    FormControl<String>(value: ''), // 担当者名（漢字）
                'Person_in_charge_kana':
                    FormControl<String>(value: ''), // 担当者名（カナ）
                'telephone_number': FormControl<String>(value: ''), // 電話番号
              },
            )
          ],
        )
      },
    );
