import 'package:flutter/material.dart';

class Incomings extends StatelessWidget {
  const Incomings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(2, (int index) {
          return Card(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Pessoa1',
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Renda total: 6000',
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                  Text(
                    'Proporção: 60%',
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                  Text(
                    'Contribuição: 2000',
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                  Text(
                    'Restante: 4000',
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
