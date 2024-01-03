import 'package:reactive_forms/reactive_forms.dart';

FormGroup itineraryForm() => FormGroup(
      {
        'patient_names': FormArray(
          [
            FormGroup(
              {
                'patient_name': FormControl<String>(value: ''), // 患者名
              },
            ),
          ],
        ),
        'tour name': FormControl<String>(value: ''), // ツアー名
        'Number of people': FormControl<String>(value: ''), // 人数
        'group': FormControl<String>(value: ''), // グループ
        'type': FormControl<String>(value: ''), // 種別
        'day': FormArray(
          // 日目
          [
            FormGroup(
              {
                'date': FormControl<String>(value: ''), // 日付
                'meal': FormControl<String>(value: ''), // 食事
                'place name': FormControl<String>(value: ''), // 地名
                'Accommodation': FormControl<String>(value: ''), // 宿泊場所
                'group': FormArray(
                  // グループ
                  [
                    FormGroup(
                      {
                        'group_number':
                            FormControl<String>(value: ''), // グループ番号
                        'task': FormArray(
                          [
                            FormGroup(
                              {
                                'place name':
                                    FormControl<String>(value: ''), // 地名
                                'Time (from)':
                                    FormControl<String>(value: ''), // 時刻（自）
                                'Time (to)':
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
