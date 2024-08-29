// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../l10n/app_localizations.dart';

extension CoreUiContextExts on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
