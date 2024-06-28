import 'package:duofinance/core/entities/budget.dart';
import 'package:duofinance/utils/format_value.dart';
import 'package:flutter/material.dart';

final List<Budget> budgets = <Budget>[
  Budget(
      id: 1,
      username: "Alguém",
      incoming: 6000,
      percentage: 60,
      contribution: 4000,
      remaining: 2000),
  Budget(
      id: 1,
      username: "Alguém tb",
      incoming: 4000,
      percentage: 40,
      contribution: 2000,
      remaining: 2000),
];

class Incomings extends StatelessWidget {
  const Incomings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: budgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.grey[850],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 18, right: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      budgets[index].username,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    cardLine(
                      label: "Renda total",
                      content: formatValue(budgets[index].incoming),
                    ),
                    cardLine(
                      percent: budgets[index].percentage,
                      label: "Contribuição",
                      content: formatValue(budgets[index].contribution),
                    ),
                    cardLine(
                        label: "Restante",
                        content: formatValue(budgets[index].remaining)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

RichText cardLine({
  required String label,
  required String content,
  double? percent,
}) =>
    RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: '$label: ',
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 14.0,
          ),
        ),
        if (percent != null)
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '$content ',
                style: TextStyle(
                  color: Colors.cyanAccent[100],
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: '$percent%',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        if (percent == null)
          TextSpan(
              text: content,
              style: TextStyle(
                  color: Colors.cyanAccent[100],
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600)),
      ]),
    );
