import 'package:core_l10n/core_l10n.module.dart';
import 'package:core_network/core_network.module.dart';
import 'package:feature_agent/feature_agent.module.dart';
import 'package:feature_auth/feature_auth.module.dart';
import 'package:feature_hospital/feature_hospital.module.dart';
import 'package:feature_invoice/feature_invoice.module.dart';
import 'package:feature_medical_visa/feature_medical_visa.module.dart';
import 'package:feature_patient/feature_patient.module.dart';
import 'package:feature_process_chart/feature_process_chart.module.dart';
import 'package:feature_report/feature_report.module.dart';
import 'package:feature_sale/feature_sale.module.dart';
import 'package:feature_web_appointment/feature_web_appointment.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_chat/socket_chat.module.dart';

import '../config/server.dart';
import 'injection.config.dart';

const local = Environment('local');
const stage = Environment('stage');
const production = Environment('production');

@InjectableInit(
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
  externalPackageModulesAfter: [
    ExternalModule(CoreL10nPackageModule),
    ExternalModule(CoreNetworkPackageModule),
    ExternalModule(SocketChatPackageModule),
    ExternalModule(FeatureAuthPackageModule),
    ExternalModule(FeatureAgentPackageModule),
    ExternalModule(FeatureHospitalPackageModule),
    ExternalModule(FeatureInvoicePackageModule),
    ExternalModule(FeatureMedicalVisaPackageModule),
    ExternalModule(FeaturePatientPackageModule),
    ExternalModule(FeatureReportPackageModule),
    ExternalModule(FeatureSalePackageModule),
    ExternalModule(FeatureProcessChartPackageModule),
    ExternalModule(FeatureWebAppointmentPackageModule),
  ],
)
Future<GetIt> configureDependencies(Server server) {
  return GetIt.instance.init(environment: server.name);
}