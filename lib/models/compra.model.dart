class Compra {
  String id;
  String descricao;
  int quantidade;
  bool comprado;
  bool estoque;

  Compra(
      {this.id = '',
      this.descricao = '',
      this.comprado = false,
      this.quantidade = 0,
      this.estoque = true});
}
