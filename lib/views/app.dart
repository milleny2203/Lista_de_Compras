import 'package:flutter/material.dart';
import 'package:lista_de_compras/views/lista.page.dart';
import 'package:lista_de_compras/views/nova.page.dart';
import 'package:lista_de_compras/views/edita.page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //desenha tela do app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //toggleableActiveColor: Colors.green,
          primaryColor: Colors.pink[300],
          accentColor: Colors.pink[300]),
      // home: ListaPage(),
      routes: {
        '/': (context) => ListaPage(),
        '/nova': (context) => NovaPage(),
        '/edita': (context) => EditaPage(),
      },
      initialRoute: '/',
    ); //MaterialApp	}
  }
}
