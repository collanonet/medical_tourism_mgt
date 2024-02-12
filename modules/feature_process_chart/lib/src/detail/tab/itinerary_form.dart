import 'package:reactive_forms/reactive_forms.dart';

FormGroup itineraryForm() => FormGroup(
      {
        'patientNames': FormArray(
          [
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
          ],
        ),
        'tour_name': FormControl<String>(value: ''), // ツアー名
        'Number_of_people': FormControl<String>(value: ''), // 人数
        'group': FormControl<String>(value: ''), // グループ
        'type': FormControl<String>(value: ''), // 種別
        'day': FormArray(
          // 日目
          [
            FormGroup(
              {
                'date': FormControl<String>(value: ''), // 日付
                'meal': FormControl<String>(value: ''), // 食事
                'place_name': FormControl<String>(value: ''), // 地名
                'Accommodation': FormControl<String>(value: ''), // 宿泊場所
                'group': FormArray(
                  // グループ
                  [
                    FormGroup(
                      {
                        'task': FormArray(
                          [
                            FormGroup(
                              {
                                'place_name':
                                    FormControl<String>(value: ''), // 地名
                                'Time_from':
                                    FormControl<String>(value: ''), // 時刻（自）
                                'Time_to':
                                    FormControl<String>(value: ''), // 時刻（至）
                                'traffic': FormControl<String>(value: ''), // 交通
                                'Itinerary':
                                    FormControl<String>(value: ''), // 行程
                              },
                            ),
                            FormGroup(
                              {
                                'place_name':
                                FormControl<String>(value: ''), // 地名
                                'Time_from':
                                FormControl<String>(value: ''), // 時刻（自）
                                'Time_to':
                                FormControl<String>(value: ''), // 時刻（至）
                                'traffic': FormControl<String>(value: ''), // 交通
                                'Itinerary':
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
