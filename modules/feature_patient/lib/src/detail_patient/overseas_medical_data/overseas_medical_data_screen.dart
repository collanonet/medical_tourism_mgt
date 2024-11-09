// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'overseas_medical_data_model.dart';
import 'popup/create_medical_oversea_data_with_file_form.dart';
import 'popup/create_medical_oversea_data_with_file_screen.dart';
import 'popup/create_medical_oversea_data_with_url_form.dart';
import 'popup/create_medical_oversea_data_with_url_screen.dart';
import 'popup/detail_medical_oversea_data/detail_medical_oversea_data_screen.dart';
import 'popup/summary_medical_oversea_data_screen.dart';

class OverseasMedicalDataScreen extends StatefulWidget {
  const OverseasMedicalDataScreen({super.key});

  @override
  State<OverseasMedicalDataScreen> createState() =>
      _OverseasMedicalDataScreenState();
}

class _OverseasMedicalDataScreenState extends State<OverseasMedicalDataScreen> {
  List<String> ids = [];
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DICOMViewerPage(),
    );
  }

  void showCreateWithUrlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () =>
                  createMedicalOverseaDataWithUrlForm()..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const CreateMedicalOverseaDataWithUrlScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => createMedicalOverseaDataWithFileForm(file)
                ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const CreateMedicalOverseaDataWithFileScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showSummaryDialog(
      BuildContext context, List<MedicalRecordOverseaData> data) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
          content: SummaryMedicalOverseaDataScreen(
            data: data,
          ),
        ),
      ),
    );
  }

  void showDetailMedicalOverseaDialog(
      BuildContext context, MedicalRecordOverseaData data) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<OverseasMedicalDataModel>(),
        child: AlertDialog(
            content: DetailMedicalOverseaDataScreen(
              medicalRecordOverseaData: data,
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('　閉じる　'), // TODO: l10n 対応 (閉じる) (close)
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('　印刷する　'), // TODO: l10n 対応 (閉じる) (close)
              ),
            ]),
      ),
    );
  }
}
