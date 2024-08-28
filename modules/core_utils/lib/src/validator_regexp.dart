class ValidatorRegExp {
  static const String date =
      r'^\d{4}[-/]\d{2}[-/]\d{2}(T|\s)?\d{2}:\d{2}:\d{2}(\.\d{3})?(Z)?$';

  static const String time = r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$';
}
