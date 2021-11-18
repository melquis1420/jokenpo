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
  void _opcaoSelecionada(String escolhDoUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print('Escolha do app: ' + escolhaApp);
    print('Escolha do usuário: ' + escolhDoUsuario);
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
                fontSize: 20,
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
              'Escolha uma opção abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () =>
                    _opcaoSelecionada("pedra"), //usando uma função anonima
                child: Image.asset(
                  'images/pedra.png',
                  height: 100,
                ),
              ), //detector de gestos
              GestureDetector(
                onTap: () =>
                    _opcaoSelecionada("papel"), //usando uma função anonima
                child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    _opcaoSelecionada("tesoura"), //usando uma função anonima
                child: Image.asset(
                  'images/tesoura.png',
                  height: 100,
                ),
              ),
              /*
              Image.asset(
                'images/papel.png',
                height: 100,
              ),
              Image.asset(
                'images/pedra.png',
                height: 100,
              ),
              Image.asset(
                'images/tesoura.png',
                height: 100,
              ),
              */
            ],
          )
        ],
      ),
    );
  }
}
