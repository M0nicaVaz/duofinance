import 'package:intl/intl.dart';

String formatValue(double? value) {
  final NumberFormat formatValue = NumberFormat.simpleCurrency(
    locale: 'pt-br',
    decimalDigits: 2,
  );

  return formatValue.format(value);
}
