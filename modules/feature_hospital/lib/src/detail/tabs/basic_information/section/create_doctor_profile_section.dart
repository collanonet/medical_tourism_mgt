import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../basic_information_model.dart';

class AddDoctorProfile extends StatefulWidget {
  const AddDoctorProfile({super.key});

  @override
  State<AddDoctorProfile> createState() => AddDoctorProfileState();
}

class AddDoctorProfileState extends State<AddDoctorProfile> {
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
                '医師',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              formCreateDoctor(value),
              addMore(formArray, context)
            ],
          ),
        );
      },
    );
  }

  ReactiveFormArray<Object?> formCreateDoctor(
    AsyncData<List<DoctorProfileHospitalResponse>> value,
  ) {
    return ReactiveFormArray(
      formArrayName: 'addDoctorProfile',
      builder: (context, formArray, child) {
        final rows = formArray.controls
            .map((control) => control as FormGroup)
            .map((currentForm) => ReactiveForm(
                formGroup: currentForm,
                child: createDoctor(currentForm, value, context, formArray)));
        return ColumnSeparated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          children: rows.toList(),
        );
      },
    );
  }

  Row createDoctor(
    FormGroup currentForm,
    AsyncData<List<DoctorProfileHospitalResponse>> value,
    BuildContext context,
    FormArray<Object?> formArray,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            separatorBuilder: (BuildContext context, index) => SizedBox(
              height: context.appTheme.spacing.formSpacing,
            ),
            children: [
              RowSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                separatorBuilder: (BuildContext context, index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      imagePicker().then((value) => {
                            if (value != null)
                              {
                                currentForm.control('profile').value = value,
                              },
                          });
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border: const Border.fromBorderSide(
                              BorderSide(color: Colors.black, width: 1))),
                      child: currentForm.control('profile').value != null &&
                              (currentForm.control('profile').value
                                          as FileSelect)
                                      .file !=
                                  null
                          ? Image.memory(
                              (currentForm.control('profile').value
                                      as FileSelect)
                                  .file!,
                              fit: BoxFit.fill,
                            )
                          : currentForm.control('profile').value != null &&
                                  (currentForm.control('profile').value
                                              as FileSelect)
                                          .url !=
                                      null
                              ? Avatar.network(
                                  (currentForm.control('profile').value
                                          as FileSelect)
                                      .url,
                                  placeholder: const AssetImage(
                                    Images.logoMadical,
                                    package: 'core_ui',
                                  ),
                                  shape: BoxShape.rectangle,
                                  customSize: const Size(200, 200),
                                )
                              : const Icon(CupertinoIcons.camera),
                    ),
                  ),
                  ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.marginExtraSmall,
                    ),
                    children: [
                      const Text('写真公開'),
                      RowSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        separatorBuilder: ((context, index) => SizedBox(
                              width: context.appTheme.spacing.formSpacing,
                            )),
                        children: [
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              formControlName: 'photoRelease',
                              value: '可',
                              onChanged: (value) {},
                              title: Text(
                                '可',
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              formControlName: 'photoRelease',
                              value: '不可',
                              onChanged: (value) {},
                              title: Text(
                                '不可',
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.marginExtraSmall,
                    ),
                    children: [
                      const Text('指名'),
                      RowSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        separatorBuilder: ((context, index) =>
                            const SizedBox()),
                        children: [
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              formControlName: 'name',
                              value: '可',
                              onChanged: (value) {},
                              title: Text(
                                '可',
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              formControlName: 'name',
                              value: '不可',
                              onChanged: (value) {},
                              title: Text(
                                '不可',
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField(
                      formControlName: 'remark',
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text(
                          '備考',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RowSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  IntrinsicWidth(
                    stepWidth: 300,
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
                  IntrinsicWidth(
                    stepWidth: 300,
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
                  IntrinsicWidth(
                    stepWidth: 300,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  IntrinsicWidth(
                    stepWidth: 300,
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
                  IntrinsicWidth(
                    stepWidth: 300,
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
                ],
              ),
              ReactiveFormArray(
                formArrayName: 'affiliatedAcademicSociety',
                builder: (context, formArray, child) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map(
                        (currentForm) => IntrinsicWidth(
                          child: ReactiveForm(
                            formGroup: currentForm,
                            child: RowSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              separatorBuilder: ((BuildContext context,
                                      int index) =>
                                  SizedBox(
                                    width: context.appTheme.spacing.formSpacing,
                                  )),
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'name',
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      label: Text(
                                        '所属学会',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                  return Wrap(
                    spacing: context.appTheme.spacing.formSpacing,
                    runSpacing: context.appTheme.spacing.formSpacing,
                    children: [
                      ...rows,
                      IntrinsicWidth(
                        child: InkWell(
                          onTap: () => formArray.add(FormGroup({
                            'name': FormControl<String>(),
                          })),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
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
                                  '所属学会を追加',
                                  style: TextStyle(
                                      color: context.appTheme.primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ReactiveFormArray(
                formArrayName: 'qualifications',
                builder: (context, formArray, child) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map(
                        (currentForm) => IntrinsicWidth(
                          child: ReactiveForm(
                            formGroup: currentForm,
                            child: RowSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              separatorBuilder: ((BuildContext context,
                                      int index) =>
                                  SizedBox(
                                    width: context.appTheme.spacing.formSpacing,
                                  )),
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'name',
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      label: Text(
                                        '資格',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                  return Wrap(
                    spacing: context.appTheme.spacing.formSpacing,
                    runSpacing: context.appTheme.spacing.formSpacing,
                    children: [
                      ...rows,
                      IntrinsicWidth(
                        child: InkWell(
                          onTap: () => formArray.add(FormGroup({
                            'name': FormControl<String>(),
                          })),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
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
                                  '資格を追加',
                                  style: TextStyle(
                                      color: context.appTheme.primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.marginExtraSmall,
                ),
                children: [
                  const Text('オンライン診療'),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    separatorBuilder: ((context, index) => SizedBox(
                          width: context.appTheme.spacing.formSpacing,
                        )),
                    children: [
                      IntrinsicWidth(
                        child: ReactiveRadioListTile(
                          formControlName: 'onlineMedicalTreatment',
                          value: '可',
                          onChanged: (value) {},
                          title: Text(
                            "可",
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        child: ReactiveRadioListTile(
                          formControlName: 'onlineMedicalTreatment',
                          value: '不可',
                          onChanged: (value) {},
                          title: Text(
                            "不可",
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              RowSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                separatorBuilder: (context, index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField(
                      formControlName: 'trainingCompletionCertificateNumber',
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text(
                          '研修修了証番号',
                        ),
                      ),
                    ),
                  ),
                  ColumnSeparated(
                    mainAxisAlignment: MainAxisAlignment.start,
                    separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.formSpacing,
                    ),
                    children: [
                      Text(
                        '厚生労働省指定オンライン診療研修修了証',
                        style: context.textTheme.bodySmall,
                      ),
                      RowSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        separatorBuilder: (context, index) => SizedBox(
                          width: context.appTheme.spacing.formSpacing,
                        ),
                        children: [
                          RowSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                IconButton(
                                    onPressed: () {
                                      filePicker().then((value) {
                                        if (value != null) {
                                          currentForm
                                              .control('fileDoctor')
                                              .value = value;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      CupertinoIcons.paperclip,
                                      color: context.appTheme.primaryColor,
                                    )),
                                ReactiveValueListenableBuilder<FileSelect>(
                                    formControlName: 'fileDoctor',
                                    builder: (context, control, _) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (control.value?.url != null) {
                                            openUrlInBrowser(
                                                fileName: control.value!.url!);
                                          }
                                        },
                                        child: Text(
                                          control.value?.filename ??
                                              'File Input .....',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      );
                                    }),
                              ]),
                          GestureDetector(
                            onTap: () {
                              filePicker().then((value) {
                                if (value != null) {
                                  currentForm.control('fileDoctor').value =
                                      value;
                                }
                              });
                            },
                            child: Chip(
                              label: const Text('変更する'),
                              labelStyle: TextStyle(
                                color:
                                    context.appTheme.secondaryBackgroundColor,
                              ),
                              backgroundColor: context.appTheme.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              RowSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  IntrinsicWidth(
                    stepWidth: 300,
                    child: ReactiveTextField(
                      formControlName: 'telephoneNumber',
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text(
                          '電話番号',
                        ),
                      ),
                    ),
                  ),
                  IntrinsicWidth(
                    stepWidth: 300,
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
                  IntrinsicWidth(
                    stepWidth: 300,
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
              if (formArray.controls.indexOf(currentForm) != 0)
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    formArray.removeAt(formArray.controls.indexOf(currentForm));
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell addMore(FormArray<dynamic> formArray, BuildContext context) {
    return InkWell(
      onTap: () => formArray.add(FormGroup({
        '_id': FormControl<String>(),
        'hospital': FormControl<String?>(),
        'profile': FormControl<FileSelect>(),
        'photoRelease': FormControl<String>(value: '可'),
        'name': FormControl<String>(value: '可'),
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
        'onlineMedicalTreatment': FormControl<String>(value: '可'),
        'trainingCompletionCertificateNumber': FormControl<String>(),
        'fileDoctor': FormControl<FileSelect>(),
        'completionCertificate': FormArray([
          FormGroup({
            'name': FormControl<String>(),
          })
        ]),
        'telephoneNumber': FormControl<String>(),
        'faxNumber': FormControl<String>(),
        'email': FormControl<String>(
          validators: [
            Validators.email,
          ],
        ),
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
            '医師を追加',
            style: TextStyle(color: context.appTheme.primaryColor),
          )
        ],
      ),
    );
  }
}
