import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/compra.model.dart';
import 'package:lista_de_compras/repositories/compra.repository.dart';

class EditaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _compra = Compra();
  final _repository = CompraRepository();

  onSave(BuildContext context, Compra itens) {
    if (_formKey.currentState!.validate()) {
      //validar as informações do form
      _formKey.currentState!.save();
      _repository.update(_compra, itens);
      Navigator.of(context).pop(true);
    } //submit do form do HTML
  }

  @override
  Widget build(BuildContext context) {
    dynamic item = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
        actions: [
          TextButton(
            child: Text(
              "SALVAR",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => onSave(context, item),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: item.descricao,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.red.shade300),
              labelText: "Descrição",
              focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red.shade300)),
            ),
            onSaved: (value) => _compra.descricao = value!,
            validator: (value) => value!.isEmpty ? "Campo Obrigatório" : null,
          ),
        ),
      ),
    );
  }
}
