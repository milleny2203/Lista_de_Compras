import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/compra.model.dart';
import 'package:lista_de_compras/repositories/compra.repository.dart';

class NovaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _compra = Compra();
  final _repository = CompraRepository();

  onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //validar as informações do form
      _formKey.currentState!.save();
      _repository.create(_compra);
      Navigator.of(context).pop(true);
    } //submit do form do HTML
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text(
            "Novo Item",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text(
                "SALVAR",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () => onSave(context),
            )
          ],
        ),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.red.shade300),
                  labelText: "Descrição",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red.shade300)),
                ),
                onSaved: (value) => _compra.descricao = value.toString(),
                validator: (value) =>
                    value!.isEmpty ? "Campo Obrigatório" : null,
              ),
            ),
          ),
        ]));
  }
}
