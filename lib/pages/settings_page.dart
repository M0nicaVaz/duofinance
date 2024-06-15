import 'package:duofinance/widgets/template.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      'Hello',
      style: theme.textTheme.bodyLarge!
          .copyWith(color: theme.colorScheme.onPrimary),
    );
  }
}
