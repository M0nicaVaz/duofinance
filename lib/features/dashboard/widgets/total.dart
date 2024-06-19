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
      children: [
        Text(
          'Total de gastos do mês',
          style: theme.textTheme.titleMedium,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'R\$ ',
              style: TextStyle(
                color: Colors.cyan[600],
                fontSize: 38.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '3809',
                  style: TextStyle(
                    color: Colors.cyan[400],
                    fontSize: 38.0,
                  ),
                ),
                TextSpan(
                  text: ',32',
                  style: TextStyle(
                    color: Colors.cyan[600],
                    fontSize: 38.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
