import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'Resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacao = 0;

  @override
  Widget build(BuildContext context) {
    void _responder(int nota) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacao += nota;
      });
      print(_pontuacao);
    }

    final perguntas = const [
      {
        'texto': 'Qual a sua cor favorita?',
        'respostas': [
          {'texto': 'Rosa', 'nota': 10},
          {'texto': 'Salmão', 'nota': 7},
          {'texto': 'Lilas', 'nota': 5},
          {'texto': 'Vermelho', 'nota': 3},
        ],
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': [
          {'texto': 'Cachorro', 'nota': 10},
          {'texto': 'Gato', 'nota': 7},
          {'texto': 'Borboleta', 'nota': 5},
          {'texto': 'Mico', 'nota': 3},
        ],
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': [
          {'texto': 'Aragão', 'nota': 10},
          {'texto': 'Claudinei', 'nota': 7},
          {'texto': 'Neiva', 'nota': 5},
          {'texto': 'Fernando', 'nota': 3},
        ],
      }
    ];

    bool temPerguntaSelecionada() {
      return _perguntaSelecionada < perguntas.length;
    }

    void quandoReiniciar() {
      setState(() {
        _perguntaSelecionada = 0;
        _pontuacao = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada()
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoSelecionada: _responder,
              )
            : Resultado(_pontuacao, quandoReiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
