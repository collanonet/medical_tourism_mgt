import 'package:core_l10n/core_l10n.module.dart';
import 'package:core_network/core_network.module.dart';
import 'package:feature_help_and_doc/feature_help_and_doc.module.dart';
import 'package:feature_hospital/feature_hospital.module.dart';
import 'package:feature_invoice/feature_invoice.module.dart';
import 'package:feature_medical_visa/feature_medical_visa.module.dart';
import 'package:feature_patient/feature_patient.module.dart';
import 'package:feature_pre_patient/feature_pre_patient.module.dart';
import 'package:feature_quotation/feature_quotation.module.dart';
import 'package:feature_report/feature_report.module.dart';
import 'package:feature_sale/feature_sale.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:feature_agent/feature_agent.module.dart';
import 'package:feature_auth/feature_auth.module.dart';

import '../config/server.dart';
import 'injection.config.dart';

const staging = Environment('staging');
const production = Environment('production');

@InjectableInit(
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
  externalPackageModulesAfter: [
    ExternalModule(CoreL10nPackageModule),
    ExternalModule(CoreNetworkPackageModule),
    ExternalModule(FeatureAuthPackageModule),
    ExternalModule(FeatureAgentPackageModule),
    ExternalModule(FeatureHelpAndDocPackageModule),
    ExternalModule(FeatureHospitalPackageModule),
    ExternalModule(FeatureInvoicePackageModule),
    ExternalModule(FeatureMedicalVisaPackageModule),
    ExternalModule(FeaturePatientPackageModule),
    ExternalModule(FeaturePrePatientPackageModule),
    ExternalModule(FeatureQuotationPackageModule),
    ExternalModule(FeatureReportPackageModule),
    ExternalModule(FeatureSalePackageModule),
  ],
)
Future<GetIt> configureDependencies(Server server) {
  return GetIt.instance.init(environment: server.name);
}
