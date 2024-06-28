import 'package:duofinance/widgets/add_form.dart';
import 'package:flutter/material.dart';

showAddDialog({
  required BuildContext context,
  String? title,
  String? expectedValue,
  String? spentValue,
}) async {
  return await showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => AddForm(
            expectedValue: expectedValue,
            spentValue: spentValue,
            title: title,
          ));
}
