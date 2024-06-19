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
            color: Colors.cyan[300],
            child: SizedBox(
              width: 220.0,
              child: Center(
                child: Text(
                  'Pessoa ${index + 1}',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
          );
        }));
  }
}
