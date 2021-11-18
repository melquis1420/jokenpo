import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
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

          //evento de toque na tela
          GestureDetector(
            onTap: () {
              print('Imagem clicada!');
            },
            child: Image.asset('images/padrao.png'),
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
            ],
          )
        ],
      ),
    );
  }
}
