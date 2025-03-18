// Flutter imports:
import 'package:core_utils/async.dart';
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
  });

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
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    medicalRecordOverseaData = widget.medicalRecordOverseaData;
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
            if (medicalRecordOverseaData.commentDicomFile != null &&
                medicalRecordOverseaData.commentDicomFile?.isNotEmpty == true)
              ...medicalRecordOverseaData.commentDicomFile!
                  .map((e) => TextFormField(
                        controller: TextEditingController(
                          text: e.comment ?? '',
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            e.role == 'Admin'
                                ? '管理者'
                                : e.role == 'Hospital'
                                    ? '病院'
                                    : e.role == 'Agent'
                                        ? 'エージェント'
                                        : '',
                          ),
                        ),
                        enabled: false,
                        readOnly: true,
                      )),
            ValueListenableBuilder(
                valueListenable:
                    context.watch<OverseasMedicalDataModel>().submitComment,
                builder: (context, value, _) {
                  return Skeletonizer(
                    enabled: value.data == true,
                    child: ReactiveFormBuilder(
                        form: () => detailMedicalOverseaForm()..markAllAsTouched(),
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
                                form.reset();
                                medicalRecordOverseaData = data.requireData;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('コメントが送信されました'),
                                  ),
                                );
                              }
                            },
                            child: ReactiveTextField(
                              formControlName: 'comment',
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: '病院名',
                              ),
                              onSubmitted: (control) {
                                context
                                    .read<OverseasMedicalDataModel>()
                                    .commentDicomFile(
                                      widget.medicalRecordOverseaData.id ?? '',
                                      control.value?.toString() ?? '',
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
