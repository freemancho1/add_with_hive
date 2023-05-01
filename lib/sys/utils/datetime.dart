import 'package:intl/intl.dart';

String dateToString(DateTime? value) =>
  value == null ? '': DateFormat('yyyy-MM-dd').format(value);
