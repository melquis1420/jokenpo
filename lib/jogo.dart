import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

//Usin random function to app answer.
class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('images/padrao.png');
  var _mensagem = "'Escolha uma opção abaixo'";

  void _opcaoSelecionada(String escolhDoUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    /*print('Escolha do app: ' + escolhaApp);
    print('Escolha do usuário: ' + escolhDoUsuario);
    */

    //Show Image
    switch (escolhaApp) {
      case "pedra":
        //modifi bot image
        setState(() {
          this._imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage('images/papel.png');
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    //Winner Validation

    //User
    if ((escolhDoUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhDoUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhDoUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou!!";
      });

      //Bot
    } else if ((escolhaApp == 'pedra' && escolhDoUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhDoUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhDoUsuario == 'pedra')) {
      setState(() {
        this._mensagem = "Você perdeu 😈";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos 😒";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //Align att center
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () =>
                    _opcaoSelecionada("pedra"), //Using anonymous function
                child: Image.asset(
                  'images/pedra.png',
                  height: 100,
                ),
              ), //detector de gestos
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  'images/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
