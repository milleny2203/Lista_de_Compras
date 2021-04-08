import 'package:lista_de_compras/models/compra.model.dart';

class CompraRepository {
  // ignore: deprecated_member_use
  static List<Compra> compras = [];

  CompraRepository() {
    if (compras.isEmpty) {
      compras.add(
        Compra(
            id: "1",
            descricao: "Sabão em pó",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "2",
            descricao: "Amaciante",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "3",
            descricao: "Detergente",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "4",
            descricao: "Sabonete em barra",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "5",
            descricao: "Escova de dente",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "6",
            descricao: "Condicionador",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "7",
            descricao: "Arroz",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "8",
            descricao: "Feijão",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "9",
            descricao: "Açucar",
            comprado: false,
            quantidade: 0,
            estoque: false),
      );
      compras.add(
        Compra(
            id: "10",
            descricao: "Café",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "11",
            descricao: "Coca-cola",
            comprado: false,
            quantidade: 0,
            estoque: false),
      );
      compras.add(
        Compra(
            id: "12",
            descricao: "Óleo",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "13",
            descricao: "Vinagre",
            comprado: false,
            quantidade: 0,
            estoque: false),
      );
      compras.add(
        Compra(
            id: "14",
            descricao: "Pipoca",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "15",
            descricao: "Margarina",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "16",
            descricao: "Pão de forma",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "17",
            descricao: "Escova de cabelo",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "18",
            descricao: "Molho de tomate",
            comprado: false,
            quantidade: 0,
            estoque: false),
      );
      compras.add(
        Compra(
            id: "19",
            descricao: "Farinha",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "1",
            descricao: "Macarrão Instantâneo",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "20",
            descricao: "Sal",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "21",
            descricao: "Leite em pó",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "22",
            descricao: "Cartela 12 ovos",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "23",
            descricao: "Pão de alho",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "24",
            descricao: "Suco de Uva 500ml",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
      compras.add(
        Compra(
            id: "25",
            descricao: "Shoyo",
            comprado: false,
            quantidade: 0,
            estoque: true),
      );
    }
  }

  void create(Compra item) {
    compras.add(item);
  }

  List<Compra> read() {
    return compras;
  }

  void delete(String descricao) {
    final item = compras.singleWhere((t) => t.descricao == descricao);
    compras.remove(item);
  }

  void update(Compra newCompra, Compra oldCompra) {
    final item = compras.singleWhere((t) => t.descricao == oldCompra.descricao);
    item.descricao = newCompra.descricao;
  }
}
