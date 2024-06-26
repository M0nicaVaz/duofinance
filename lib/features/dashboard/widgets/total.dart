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
        const Center(
          child: Text(
            'R\$ 3809,32',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 34.0,
            ),
          ),
        ),
      ],
    );
  }
}
