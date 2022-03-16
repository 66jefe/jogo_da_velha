import 'package:exemplo/cor/cores.dart';
import 'package:exemplo/util/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
String jogador = "X";
bool perdedor = false;
List<int> pontos = [0,0,0,0,0,0,0,0];


Jogo jogo = Jogo();

  @override
  void initSate(){
    super.initState();
    jogo.bloco = Jogo.criarBloco();
    print(jogo.bloco);
  }

  @override
  Widget build(BuildContext context) {
    double blocoLargura = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primeiraCor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Jogador atual ${jogador}'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: blocoLargura,
            height: blocoLargura,
            child: GridView.count(
              crossAxisCount: Jogo.quantidadeBloco ~/ 3,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Jogo.quantidadeBloco, (index){
                return InkWell(
                  onTap: perdedor 
                  ? null 
                  : (){
                    if (jogo.bloco![index] == "") {
                      setState(() {
                        jogo.bloco![index] = jogador;
                        if(jogador == "X") 
                          jogador = "O";
                        else {
                          jogador = "X";
                        }
                      });
                    }
                  },
                  child: Container(
                    width: Jogo.tamanhoBloco,
                    height: Jogo.tamanhoBloco,
                    decoration: BoxDecoration(
                      color: MainColor.segundaCor,
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    child: Center(
                      child: Text(
                        jogo.bloco![index], 
                        style: TextStyle(
                          color: jogo.bloco![index] == "X" 
                          ?Colors.blue
                          :Colors.pink,
                          fontSize: 64.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),   
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                jogo.bloco = Jogo.criarBloco();
                jogador = "X";
              });
            }, 
            icon: const Icon(Icons.replay),
            label: const Text('Reiniciar o Jogo'),
          ),
        ],
      ),
    );
  }
}