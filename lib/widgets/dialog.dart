import 'package:duofinance/widgets/add_form.dart';

showAddDialog({
  String? title,
  String? expectedValue,
  String? spentValue,
}) {
  return AddForm(
    expectedValue: expectedValue,
    spentValue: spentValue,
    title: title,
  );
}
