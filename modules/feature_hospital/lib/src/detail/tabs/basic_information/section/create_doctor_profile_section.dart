import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_information_model.dart';

class AddDoctorProfile extends StatefulWidget {
  const AddDoctorProfile({super.key});

  @override
  State<AddDoctorProfile> createState() => AddeDoctorProfileState();
}

class AddeDoctorProfileState extends State<AddDoctorProfile> {
  Uint8List imageBytes = Uint8List(8);
  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('addDoctorProfile') as FormArray;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().doctorInformationData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: context.appTheme.spacing.formSpacing),
              children: [
                const Text(
                  'メモ',
                  style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReactiveFormArray(
                    formArrayName: 'addDoctorProfile',
                    builder: (context, formArray, child) {
                      final rows = formArray.controls
                          .map((control) => control as FormGroup)
                          .map((currentForm) => ReactiveForm(
                              formGroup: currentForm,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: ColumnSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    separatorBuilder:
                                        ((BuildContext context, index) =>
                                            SizedBox(
                                              height: context
                                                  .appTheme.spacing.formSpacing,
                                            )),
                                    children: [
                                      RowSeparated(
                                          separatorBuilder:
                                              ((BuildContext context, index) =>
                                                  SizedBox(
                                                    width: context.appTheme
                                                        .spacing.formSpacing,
                                                  )),
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                imagePicker().then((value) => {
                                                      if (value != null)
                                                        {
                                                          // setState(() {
                                                          //   imageBytes = value;
                                                          // })
                                                        }
                                                    });
                                              },
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(6)),
                                                    border: Border.fromBorderSide(
                                                        BorderSide(
                                                            color: Colors.black,
                                                            width: imageBytes
                                                                        .length !=
                                                                    8
                                                                ? 0
                                                                : 1))),
                                                child: imageBytes.length != 8
                                                    ? Image.memory(
                                                        imageBytes,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : const Icon(
                                                        CupertinoIcons.camera),
                                              ),
                                            ),
                                            ColumnSeparated(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                separatorBuilder:
                                                    ((context, index) =>
                                                        SizedBox(
                                                          height: context
                                                              .appTheme
                                                              .spacing
                                                              .marginExtraSmall,
                                                        )),
                                                children: [
                                                  const Text('写真公開'),
                                                  RowSeparated(
                                                      separatorBuilder:
                                                          ((context, index) =>
                                                              SizedBox(
                                                                width: context
                                                                    .appTheme
                                                                    .spacing
                                                                    .formSpacing,
                                                              )),
                                                      children: [
                                                        IntrinsicWidth(
                                                          stepWidth: 2,
                                                          child:
                                                              ReactiveRadioListTile(
                                                            formControlName:
                                                                'photoRelease',
                                                            value: '可',
                                                            onChanged:
                                                                (value) {},
                                                            title: Text(
                                                              "可",
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                        IntrinsicWidth(
                                                          stepWidth: 2,
                                                          child:
                                                              ReactiveRadioListTile(
                                                            formControlName:
                                                                'photoRelease',
                                                            value: '不可',
                                                            onChanged:
                                                                (value) {},
                                                            title: Text(
                                                              "不可",
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                ]),
                                            ColumnSeparated(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                separatorBuilder:
                                                    ((context, index) =>
                                                        SizedBox(
                                                          height: context
                                                              .appTheme
                                                              .spacing
                                                              .marginExtraSmall,
                                                        )),
                                                children: [
                                                  const Text('指名'),
                                                  RowSeparated(
                                                      separatorBuilder: ((context,
                                                              index) =>
                                                          const SizedBox(
                                                              // width: context
                                                              //     .appTheme
                                                              //     .spacing
                                                              //     .formSpacing,
                                                              )),
                                                      children: [
                                                        IntrinsicWidth(
                                                          stepWidth: 2,
                                                          child:
                                                              ReactiveRadioListTile(
                                                            formControlName:
                                                                'name',
                                                            value: '可',
                                                            onChanged:
                                                                (value) {},
                                                            title: Text(
                                                              "可",
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                        IntrinsicWidth(
                                                          stepWidth: 2,
                                                          child:
                                                              ReactiveRadioListTile(
                                                            formControlName:
                                                                'name',
                                                            value: '不可',
                                                            onChanged:
                                                                (value) {},
                                                            title: Text(
                                                              "不可",
                                                              style: context
                                                                  .textTheme
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                ]),
                                            Expanded(
                                              child: ReactiveTextField(
                                                formControlName: 'remark',
                                                decoration:
                                                    const InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  label: Text(
                                                    '備考',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      RowSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'departmentName',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '部署名',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'post',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '役職',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'specialty',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '専門',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      RowSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'nameKanji',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '氏名（漢字）',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'nameKana',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '氏名（カナ）',
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(),
                                          ),
                                        ],
                                      ),
                                      ReactiveFormArray(
                                          formArrayName:
                                              'affiliatedAcademicSociety',
                                          builder: (context, formArray, child) {
                                            final rows = formArray.controls
                                                .map((control) =>
                                                    control as FormGroup)
                                                .map((currentForm) =>
                                                    IntrinsicWidth(
                                                      child: ReactiveForm(
                                                          formGroup:
                                                              currentForm,
                                                          child: RowSeparated(
                                                            separatorBuilder:
                                                                ((BuildContext
                                                                            context,
                                                                        int index) =>
                                                                    SizedBox(
                                                                      width: context
                                                                          .appTheme
                                                                          .spacing
                                                                          .formSpacing,
                                                                    )),
                                                            children: [
                                                              IntrinsicWidth(
                                                                stepWidth: 300,
                                                                child:
                                                                    ReactiveTextField(
                                                                  formControlName:
                                                                      'name',
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    filled:
                                                                        true,
                                                                    label: Text(
                                                                      '所属学会',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    ));
                                            return Wrap(
                                              spacing: context
                                                  .appTheme.spacing.formSpacing,
                                              runSpacing: context
                                                  .appTheme.spacing.formSpacing,
                                              children: [
                                                ...rows,
                                                IntrinsicWidth(
                                                  child: InkWell(
                                                    onTap: () => formArray
                                                        .add(FormGroup({
                                                      'name':
                                                          FormControl<String>(),
                                                    })),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.add_circle,
                                                          color: context
                                                              .appTheme
                                                              .primaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginSmall,
                                                        ),
                                                        Text(
                                                          '所属学会を追加',
                                                          style: TextStyle(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                      ReactiveFormArray(
                                          formArrayName: 'qualifications',
                                          builder: (context, formArray, child) {
                                            final rows = formArray.controls
                                                .map((control) =>
                                                    control as FormGroup)
                                                .map((currentForm) =>
                                                    IntrinsicWidth(
                                                      child: ReactiveForm(
                                                          formGroup:
                                                              currentForm,
                                                          child: RowSeparated(
                                                            separatorBuilder:
                                                                ((BuildContext
                                                                            context,
                                                                        int index) =>
                                                                    SizedBox(
                                                                      width: context
                                                                          .appTheme
                                                                          .spacing
                                                                          .formSpacing,
                                                                    )),
                                                            children: [
                                                              IntrinsicWidth(
                                                                stepWidth: 300,
                                                                child:
                                                                    ReactiveTextField(
                                                                  formControlName:
                                                                      'name',
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    filled:
                                                                        true,
                                                                    label: Text(
                                                                      '資格',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    ));
                                            return Wrap(
                                              spacing: context
                                                  .appTheme.spacing.formSpacing,
                                              runSpacing: context
                                                  .appTheme.spacing.formSpacing,
                                              children: [
                                                ...rows,
                                                IntrinsicWidth(
                                                  child: InkWell(
                                                    onTap: () => formArray
                                                        .add(FormGroup({
                                                      'name':
                                                          FormControl<String>(),
                                                    })),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.add_circle,
                                                          color: context
                                                              .appTheme
                                                              .primaryColor,
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginSmall,
                                                        ),
                                                        Text(
                                                          '資格を追加',
                                                          style: TextStyle(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                      ColumnSeparated(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          separatorBuilder: ((context, index) =>
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginExtraSmall,
                                              )),
                                          children: [
                                            const Text('オンライン診療'),
                                            RowSeparated(
                                                separatorBuilder:
                                                    ((context, index) =>
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .formSpacing,
                                                        )),
                                                children: [
                                                  IntrinsicWidth(
                                                    stepWidth: 2,
                                                    child:
                                                        ReactiveRadioListTile(
                                                      formControlName:
                                                          'onlineMedicalTreatment',
                                                      value: '可',
                                                      onChanged: (value) {},
                                                      title: Text(
                                                        "可",
                                                        style: context.textTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    stepWidth: 2,
                                                    child:
                                                        ReactiveRadioListTile(
                                                      formControlName:
                                                          'onlineMedicalTreatment',
                                                      value: '不可',
                                                      onChanged: (value) {},
                                                      title: Text(
                                                        "不可",
                                                        style: context.textTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                  ),
                                                ])
                                          ]),
                                      RowSeparated(
                                          separatorBuilder: ((context, index) =>
                                              SizedBox(
                                                width: context.appTheme.spacing
                                                    .formSpacing,
                                              )),
                                          children: [
                                            Expanded(
                                              child: ReactiveTextField(
                                                formControlName:
                                                    'trainingCompletionCertificateNumber',
                                                decoration:
                                                    const InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  label: Text(
                                                    '研修修了証番号',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      RowSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'telephoneNumber',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  '電話番号',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'faxNumber',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  'FAX番号',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'email',
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                label: Text(
                                                  'メール',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ReactiveTextField(
                                        formControlName: 'remark2',
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          label: Text(
                                            '備考',
                                          ),
                                        ),
                                      ),
                                      if (formArray.controls
                                                  .indexOf(currentForm) !=
                                              0 ||
                                          currentForm
                                                  .control('departmentName')
                                                  .value !=
                                              null) ...{
                                        IconButton(
                                          icon: const Icon(Icons.delete_forever,
                                              color: Colors.red),
                                          onPressed: () => formArray.removeAt(
                                            formArray.controls
                                                .indexOf(currentForm),
                                          ),
                                        ),
                                      }
                                    ],
                                  )),
                                ],
                              )));
                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        children: rows.toList(),
                      );
                    }),
                InkWell(
                  onTap: () => formArray.add(FormGroup({
                    '_id': FormControl<String?>(),
                    'hospital': FormControl<String?>(),
                    'profile': FormControl<String>(),
                    'photoRelease': FormControl<String>(),
                    'name': FormControl<String>(),
                    'remark': FormControl<String>(),
                    'departmentName': FormControl<String>(),
                    'post': FormControl<String>(),
                    'specialty': FormControl<String>(),
                    'nameKanji': FormControl<String>(),
                    'nameKana': FormControl<String>(),
                    'affiliatedAcademicSociety': FormArray([
                      FormGroup({
                        'name': FormControl<String>(),
                      })
                    ]),
                    'qualifications': FormArray([
                      FormGroup({
                        'name': FormControl<String>(),
                      })
                    ]),
                    'onlineMedicalTreatment': FormControl<String>(),
                    'trainingCompletionCertificateNumber':
                        FormControl<String>(),
                    'completionCertificate': FormArray([
                      FormGroup({
                        'name': FormControl<String>(),
                      })
                    ]),
                    'telephoneNumber': FormControl<String>(),
                    'faxNumber': FormControl<String>(),
                    'email': FormControl<String>(),
                    'remark2': FormControl<String>(),
                  })),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginSmall,
                      ),
                      Text(
                        '担当者を追加',
                        style: TextStyle(color: context.appTheme.primaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
