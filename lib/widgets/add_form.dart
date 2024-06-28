import 'package:duofinance/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddForm extends StatefulWidget {
  final String? title;
  final String? expectedValue;
  final String? spentValue;

  const AddForm({
    super.key,
    this.title,
    this.expectedValue,
    this.spentValue,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _hasUniqueValue = false;
  String? spendingTitle;
  String? spendingExpected;
  String? spendingSpent;

  handleSave() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(24.0),
      height: MediaQuery.sizeOf(context).height,
      color: Colors.grey[900],
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.start,
        runSpacing: 24.0,
        children: <Widget>[
          Text(
            widget.title != null
                ? "Editando: ${widget.title}"
                : "Adicionar gasto",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  initialValue: widget.title,
                  onSaved: (String? value) => spendingTitle = value,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  keyboardType: TextInputType.text,
                  validator: (String? value) => Validator.validateLength(
                      value: value,
                      message: "Este campo não pode ser vazio",
                      length: 1),
                  decoration: const InputDecoration(
                    labelText: 'Gastei com',
                    hintText: 'Ex: Aluguel, mercado, etc.',
                  ),
                ),
                const SizedBox(height: 8.0),
                if (!_hasUniqueValue)
                  TextFormField(
                    initialValue: widget.expectedValue,
                    onSaved: (String? value) => spendingExpected = value,
                    validator: Validator.validateNumber,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Valor previsto',
                      prefix: Text('R\$ '),
                    ),
                  ),
                const SizedBox(height: 8.0),
                TextFormField(
                  initialValue: widget.spentValue,
                  onSaved: (String? value) => spendingSpent = value,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: Validator.validateNumber,
                  decoration: const InputDecoration(
                    labelText: 'Valor gasto',
                    prefix: Text('R\$ '),
                  ),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.only(top: 8.0),
                  title: const Text('Valor único?'),
                  value: _hasUniqueValue,
                  onChanged: (bool value) {
                    setState(() {
                      _hasUniqueValue = value;
                    });
                  },
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
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                onPressed: handleSave,
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
