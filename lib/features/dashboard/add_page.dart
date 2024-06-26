import 'package:duofinance/features/dashboard/widgets/spending_list.dart';
import 'package:duofinance/features/dashboard/widgets/incomings.dart';
import 'package:duofinance/features/dashboard/widgets/total.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Total(theme: theme),
            ),
            Text(
              'Nosso dinheiro:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            const Expanded(
              flex: 2,
              child: Incomings(),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Vamos usar para pagar:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            const Expanded(
              flex: 4,
              child: SpendingList(),
            ),
          ],
        ));
  }
}
