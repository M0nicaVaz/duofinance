import 'package:duofinance/utils/format_value.dart';
import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  const Total({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Total de gastos do mês',
          style: theme.textTheme.titleMedium,
        ),
        Center(
          child: Text(
            formatValue(4032.57),
            style: const TextStyle(
              color: Colors.cyanAccent,
              fontSize: 34.0,
            ),
          ),
        ),
      ],
    );
  }
}
