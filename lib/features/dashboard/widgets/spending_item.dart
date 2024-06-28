import 'package:duofinance/core/entities/spending_entity.dart';
import 'package:duofinance/utils/format_value.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Spending item;

  const ListItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.drag_indicator_rounded,
        size: 20,
        color: Colors.grey[600]!,
      ),
      horizontalTitleGap: 4,
      title: Text(item.title),
      subtitle: RichText(
        text: TextSpan(
          children: <TextSpan>[
            if (item.spent != item.expected) ...expectedValues(item),
            TextSpan(
              text: formatValue(item.spent),
              style: TextStyle(
                  color: item.spent <= item.expected
                      ? Colors.greenAccent
                      : Colors.redAccent,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

List<TextSpan> expectedValues(Spending item) => <TextSpan>[
      TextSpan(
        text: 'Previsto: ',
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 12.0,
        ),
      ),
      TextSpan(
        text: formatValue(item.expected),
        style: TextStyle(
          color: Colors.cyan[100]!,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: '  |  ',
        style: TextStyle(
          color: Colors.grey[600]!,
          fontSize: 12.0,
        ),
      ),
      TextSpan(
        text: 'Gasto: ',
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 12.0,
        ),
      ),
    ];
