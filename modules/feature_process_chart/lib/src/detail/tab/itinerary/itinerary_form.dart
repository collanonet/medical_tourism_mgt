import 'package:reactive_forms/reactive_forms.dart';

FormGroup itineraryForm() => FormGroup(
  {
    '_id': FormControl<String>(),
    'patient': FormArray(
      [
        FormGroup(
          {
            'patientName': FormControl<String>(value: ''), // 患者名
          },
        ),
      ],
    ),
    'tourName': FormControl<String>(value: ''), // ツアー名
    'peopleNumber': FormControl<int>(), // 人数
    'group': FormControl<int>(), // グループ
    'classification': FormControl<String>(value: ''), // 種別
    'day': FormArray(
      [
        FormGroup(
          {
            '_id': FormControl<String>(value: ''),
            'date': FormControl<DateTime>(), // 日付
            'meals': FormControl<List<bool>>(value: []),
            //meals
            'morning': FormControl<bool>(value: false),
            'noon': FormControl<bool>(value: false),
            'evening': FormControl<bool>(value: false),

            'placeName': FormControl<String>(value: ''), // 地名
            'placeStay': FormControl<String>(value: ''), // 宿泊場所
            'groups': FormArray(
              // グループ
              [
                FormGroup(
                  {
                    'tasks': FormArray(
                      [
                        FormGroup(
                          {
                            '_id': FormControl<String>(),
                            'placeName':
                            FormControl<String>(value: ''), // 地名
                            'timeFrom':
                            FormControl<String>(value: ''), // 時刻（自）
                            'timeTo':
                            FormControl<String>(value: ''), // 時刻（至）
                            'transportation':
                            FormControl<String>(value: ''), // 交通
                            'itinerary':
                            FormControl<String>(value: ''), // 行程
                          },
                        ),
                      ],
                    ),
                  },
                ),
              ],
            ),
          },
        ),
      ],
    ),
  },
);
