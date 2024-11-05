// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../widgets/header_detail_patient.dart';
import 'basic_info/basic_info_page.dart';
import 'billing/billing_page.dart';
import 'detail_patient_model.dart';
import 'domestic_medical_data/domestic_medical_data_page.dart';
import 'estimate/estimate_page.dart';
import 'medical_payment_details/medical_payment_details_page.dart';
import 'medical_summary/medical_summary_page.dart';
import 'medical_visa/medical_visa_page.dart';
import 'overseas_medical_data/overseas_medical_data_page.dart';
import 'patient_response_data/patient_response_page.dart';
import 'progress_list/progress_list_page.dart';
import 'proposal/proposal_page.dart';
import 'statement/statement_page.dart';
import 'web_reservation/detail_patient_web_reservation_page.dart';

class DetailPatientScreen extends StatefulWidget {
  const DetailPatientScreen({
    super.key,
    this.patient,
    this.id,
  });

  final Patient? patient;
  final String? id;

  @override
  State<DetailPatientScreen> createState() => _DetailPatientScreenState();
}

class _DetailPatientScreenState extends State<DetailPatientScreen> {

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder2(
        first: context.watch<DetailPatientModel>().medicalRecord,
        second: context.watch<DetailPatientModel>().patientData,
        builder: (context, medicalRecord, patientData, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderDetailPatient(),
              Padding(
                padding: EdgeInsets.only(
                    top: context.appTheme.spacing.marginMedium,
                    left: context.appTheme.spacing.marginMedium),
                child: ValueListenableBuilder<int>(
                  valueListenable: _selectedIndex,
                  builder: (BuildContext context, int value, Widget? child) {
                    return Wrap(
                      children: [
                        TabBarWidget(
                          selectedIndex: value,
                          menu: [
                            '基本情報', // basic information
                            if (medicalRecord.hasData) ...[
                              'Web予約', // Web reservation
                              '進捗一覧', // progress list
                              '患者回答データ', // Patient Response Data
                              '海外診療データ', // Overseas medical data
                              '診療サマリー', // Medical summary
                              'ご提案', // proposal
                              '医療ビザ', // medical visa
                              '国内診療データ', // statement
                              '見積書', // estimate
                              '請求書', // Statement
                              '精算履歴', // billing
                              '診療報酬明細', // billing details
                            ],
                          ],
                          onPressed: (index) {
                            _selectedIndex.value = index;
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (BuildContext context, int index, Widget? child) {
                  return Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.all(context.appTheme.spacing.marginMedium),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            context.appTheme.spacing.borderRadiusMedium),
                        color: Colors.white,
                      ),
                      child: <Widget>[
                        BasicInformationPage(
                          patient: widget.patient ?? patientData.data,
                        ),
                        if (medicalRecord.hasData) ...[
                          DetailPatientWebReservationPage(
                            patient: patientData.requireData,
                          ),
                          ProgressListPage(
                            patient: patientData.requireData,
                          ),
                          PatientResponsePage(
                            patient: patientData.requireData,
                          ),
                          OverseasMedicalDataPage(
                            patient: patientData.requireData,
                          ),
                          MedicalSummaryPage(
                            patient: patientData.requireData,
                          ),
                          ProposalPage(
                            patient: patientData.requireData,
                          ),
                          MedicalVisaPage(
                            patient: patientData.requireData,
                            id: medicalRecord.requireData.id,
                          ),
                          DomesticMedicalDataPage(
                            patient: patientData.requireData,
                            id: patientData.requireData.id,
                          ),
                          EstimatePage(
                            patient: patientData.requireData,
                            medicalRecord: medicalRecord.requireData,
                          ),
                          StatementPage(
                            patient: patientData.requireData,
                            medicalRecord: medicalRecord.requireData,
                          ),
                          BillingPage(
                            patient: patientData.requireData,
                          ),
                          MedicalPaymentDetailsPage(
                            patient: patientData.requireData,
                            id: patientData.requireData.id,
                          ),
                        ]
                      ][index],
                    ),
                  );
                },
              )
            ],
          );
        });
  }
}
//pages[index]
