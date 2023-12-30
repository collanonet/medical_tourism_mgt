import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup detailPatientWebReservationForm() => FormGroup({
      '1st_choice': FormControl<DateTime>(), // 第１希望
      '2nd_choice': FormControl<DateTime>(), // 第２希望
      '3rd_choice': FormControl<DateTime>(), // 第３希望
      'No_desired_date': FormControl<bool>(), // 希望日なし
      'remarks': FormControl<String>(), // 備考
      'Medical_institution_name': FormControl<String>(), // 医療機関名
      'Doctor_name': FormControl<String>(), // 医師名
      'shift_1': FormControl<String>(value: '10時〜12時'), //
      'shift_2': FormControl<String>(value: '13時〜16時'), //
      'Candidate_Date': FormArray([
        FormGroup({
          'First_choice': FormControl<DateTime>(), // 第一希望
          'choice': FormControl<String>(value: '午前'), // 午前, 午後, 終日
          'Time_period_from': FormControl<String>(), // 時間帯（自）
          'Time_period_to': FormControl<String>(), // 時間帯（至）
        }),
        FormGroup({
          'First_choice': FormControl<DateTime>(), // 第一希望
          'choice': FormControl<String>(value: '午後'), // 午前, 午後, 終日
          'Time_period_from': FormControl<String>(), // 時間帯（自）
          'Time_period_to': FormControl<String>(), // 時間帯（至）
        }),
        FormGroup({
          'First_choice': FormControl<DateTime>(), // 第一希望
          'choice': FormControl<String>(), // 午前, 午後, 終日
          'Time_period_from': FormControl<String>(), // 時間帯（自）
          'Time_period_to': FormControl<String>(), // 時間帯（至）
        }),
      ]),
      'message': FormControl<String>(), // メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）
      'date': FormControl<DateTime>(), // 年月日
      'time': FormControl<TimeOfDay>(), // 時間
    });
