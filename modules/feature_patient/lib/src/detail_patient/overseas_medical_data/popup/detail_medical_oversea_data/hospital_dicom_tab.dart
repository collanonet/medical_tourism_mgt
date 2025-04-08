// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../overseas_medical_data_model.dart';
import 'detail_medical_oversea_form.dart';

class HospitalDICOMTab extends StatefulWidget {
  const HospitalDICOMTab({
    super.key,
    required this.medicalRecordOverseaData,
    this.onRefresh,
  });

  final Function? onRefresh;
  final MedicalRecordOverseaData medicalRecordOverseaData;

  @override
  State<HospitalDICOMTab> createState() => _HospitalDICOMTabState();
}

class _HospitalDICOMTabState extends State<HospitalDICOMTab> {
  late MedicalRecordOverseaData medicalRecordOverseaData;

  @override
  void initState() {
    super.initState();
    medicalRecordOverseaData = widget.medicalRecordOverseaData;
  }

  @override
  void didUpdateWidget(covariant HospitalDICOMTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.medicalRecordOverseaData != widget.medicalRecordOverseaData) {
      medicalRecordOverseaData = widget.medicalRecordOverseaData;
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    medicalRecordOverseaData = widget.medicalRecordOverseaData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
          children: [
            ValueListenableBuilder(
                valueListenable:
                    context.watch<OverseasMedicalDataModel>().submitComment,
                builder: (context, value, _) {
                  return Skeletonizer(
                    enabled: value.data == true,
                    child: ReactiveFormBuilder(
                        form: () => detailMedicalOverseaForm(
                            data:
                                medicalRecordOverseaData.commentDicomFile ?? [])
                          ..markAllAsTouched(),
                        builder: (context, form, __) {
                          return ValueListenableListener(
                            valueListenable: context
                                .read<OverseasMedicalDataModel>()
                                .submitComment,
                            onListen: () {
                              var data = context
                                  .read<OverseasMedicalDataModel>()
                                  .submitComment
                                  .value;

                              if (data.hasData) {
                                widget.onRefresh?.call();
                                medicalRecordOverseaData = data.requireData;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('コメントが送信されました'),
                                  ),
                                );
                              }
                            },
                            child: ReactiveFormArray(
                              formArrayName: 'comments',
                              builder: (context, formArray, child) {
                                final rows = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map((currentForm) => ReactiveForm(
                                        formGroup: currentForm,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child:
                                                  ReactiveValueListenableBuilder(
                                                      formControlName: 'role',
                                                      builder: (context,
                                                          control, _) {
                                                        return ReactiveTextField<
                                                            String>(
                                                          formControlName:
                                                              'comment',
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: control
                                                                        .value ==
                                                                    'Admin'
                                                                ? '管理者'
                                                                : control.value ==
                                                                        'Hospital'
                                                                    ? '病院'
                                                                    : control.value ==
                                                                            'Agent'
                                                                        ? 'エージェント'
                                                                        : 'コメント',
                                                            isDense: true,
                                                          ),
                                                        );
                                                      }),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                formArray.removeAt(formArray
                                                    .controls
                                                    .indexOf(currentForm));
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                              ),
                                            ),
                                          ],
                                        )));
                                return ColumnSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(height: 8),
                                  children: [
                                    ColumnSeparated(
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                      children: rows.toList(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              formArray.add(FormGroup({
                                                'comment':
                                                    FormControl<String>(),
                                                'role': FormControl<String>(
                                                    value: 'Admin'),
                                              }));
                                            },
                                            child: Text('さらに追加します')),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<
                                                    OverseasMedicalDataModel>()
                                                .commentDicomFile(
                                                  widget
                                                      .medicalRecordOverseaData
                                                      .id,
                                                  form,
                                                );
                                          },
                                          child: const Text('送信'),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                  );
                }),
            if (widget.medicalRecordOverseaData.file != null &&
                widget.medicalRecordOverseaData.file?.isNotEmpty == true)
              Expanded(
                child: DicomWebViewer(
                    seriesId: widget.medicalRecordOverseaData.file?.first
                            .parentSeries ??
                        ''),
              ),
            if (widget.medicalRecordOverseaData.sharedUrl != null &&
                widget.medicalRecordOverseaData.sharedUrl?.isNotEmpty == true)
              Expanded(
                child: WebViewWidget(
                  uri: Uri.parse(
                      widget.medicalRecordOverseaData.sharedUrl ?? ''),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
