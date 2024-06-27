import 'package:flutter/material.dart';

showAddDialog(BuildContext context, GlobalKey key) {
  return Container(
    padding: const EdgeInsets.all(24.0),
    height: MediaQuery.sizeOf(context).height,
    color: Colors.grey[900],
    child: Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.start,
      runSpacing: 24.0,
      children: <Widget>[
        Text("Adicionar gasto", style: Theme.of(context).textTheme.titleLarge),
        Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  labelText: 'Gastei com',
                  hintText: 'Ex: Aluguel, mercado, etc.',
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  labelText: 'Valor previsto',
                  prefix: Text('R\$'),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  labelText: 'Valor gasto',
                  prefix: Text('R\$'),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <TextButton>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.greenAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    ),
  );
}
