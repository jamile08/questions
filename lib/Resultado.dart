import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  final void Function() quandoReiniciar;

  Resultado(this.pontuacao, this.quandoReiniciar);

  String texto() {
    if (pontuacao < 10) {
      return 'Parabéns';
    } else if (pontuacao < 15) {
      return 'Você é bom';
    } else if (pontuacao < 20) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            texto(),
            style: TextStyle(fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
            onPressed: quandoReiniciar,
            color: Colors.blue,
            child: Text(
              'Reiniciar',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
