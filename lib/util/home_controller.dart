class HomeController{
  static const x = "X";
  static const o = "O";
  static const vazio = "";
}

class Jogo{
  static final quantidadeBloco = 9;
  static final tamanhoBloco = 100.0;

  List<String>? bloco;

  static List<String>? criarBloco() => List.generate(quantidadeBloco, (index) => HomeController.vazio);

  bool ganhador(String vencedor, int index, List<int> pontos){
    return false;
  }
}
