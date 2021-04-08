import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_de_compras/repositories/compra.repository.dart';
import 'package:lista_de_compras/models/compra.model.dart';
//import 'package:lista_de_compras/views/nova.page.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

enum cor { AZUL, VERDE }

class _ListaPageState extends State<ListaPage> {
  final repository = CompraRepository();

  late List<Compra> compras;

  @override
  initState() {
    super.initState();
    this.compras = repository.read();
  }

  Future adicionarItem(BuildContext context) async {
    {
      //context = estado atual da tela
      var result = await Navigator.of(context).pushNamed('/nova');
      setState(() {
        if (result == true && result != null) {
          this.compras = repository.read();
          ordenarLista();
        }
      });
    }
  }

  Future atualizarItem(BuildContext context, Compra compra) async {
    {
      var result = await Navigator.of(context).pushNamed(
        '/edita',
        arguments: compra,
      );
      if (result == true && result != null) {
        setState(() {
          this.compras = repository.read();
          ordenarLista();
        });
      }
    }
  }

  Future confirmarExecucao(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Confirma a exclusão?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("NÃO"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("SIM"),
            ),
          ],
        );
      },
    );
  }

  Future ordenarLista() async {
    compras.sort((a, b) => a.quantidade.compareTo(b.quantidade));

    return compras;
  }

  bool canEdit = false;
  int qtd = 0;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text("Lista de Compras"),
        actions: [
          IconButton(
              color: Colors.pink[50],
              icon: Icon(Icons.edit),
              onPressed: () => setState(() => canEdit = !canEdit))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //Navigator.of(context).pushNamed('/');
        },
        child: ListView.builder(
            itemCount: repository.read().length,
            itemBuilder: (_, indice) {
              var item = compras[indice];
              String estoque = 'Disponível';

              String dropdownValue = item.quantidade.toString();

              return Dismissible(
                  key: Key(item.descricao),
                  background: Container(
                      color: Colors.red,
                      child: Text(
                        "Apagar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {}
                    {
                      repository.delete(item.descricao);
                      setState(() => this.compras.remove(item));
                    }
                    if (direction == DismissDirection.startToEnd) {
                      //invoca o médoto atualizar
                    }
                  },
                  /*  confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return confirmarExecucao(context);
                }
              },*/
                  child: Container(
                    color: item.comprado && item.estoque
                        ? Colors.green[100]
                        : item.estoque
                            ? Colors.white
                            : Colors.grey[300],
                    child: CheckboxListTile(
                      value: item.comprado && item.estoque,
                      activeColor: Colors.green,
                      //tileColor: item.estoque ? Colors.white : Colors.grey[300],
                      //selectedTileColor: Colors.green[200],

                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            canEdit
                                ? IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.pink[300],
                                    ),
                                    onPressed: () =>
                                        atualizarItem(context, item))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        item.estoque = false;
                                        ordenarLista();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    )),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.descricao,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: item.comprado && item.estoque
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  item.estoque
                                      ? Text(
                                          estoque,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          'Item fora de estoque',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ]),
                            DropdownButton(
                              value: dropdownValue,
                              icon: Icon(
                                Icons.arrow_drop_down_circle_rounded,
                                color: Colors.purple[100],
                              ),
                              iconSize: 19,
                              elevation: 20,
                              iconDisabledColor: item.estoque
                                  ? Colors.green[700]
                                  : Colors.grey[400],
                              dropdownColor: item.estoque
                                  ? Colors.white
                                  : Colors.grey[300],
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (item.estoque) {
                                    dropdownValue = newValue!;
                                    item.quantidade = int.parse(newValue);
                                    ordenarLista();
                                  } else {
                                    dropdownValue = '';
                                  }
                                });
                              },
                              items: <String>[
                                '0',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                                '8',
                                '9'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }).toList(),
                            )
                          ]),

                      /*IconButton(
                      onPressed: () {
                        setState(() {
                          qtd = item.quantidade++;
                        });
                      },
                      icon: Icon(Icons.add_shopping_cart),
                      alignment: Alignment.bottomRight,
                    ),
                    Text(" $qtd ")*/

                      onChanged: (value) {
                        setState(() {
                          item.comprado = value!;
                        });
                      },
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => adicionarItem(context),
        child: Icon(
          Icons.add,
          color: Colors.pink[50],
        ),
        backgroundColor: Colors.pink[300],
      ),
    );
  }
}
