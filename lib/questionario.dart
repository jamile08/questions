import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoSelecionada;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    bool temPerguntaSelecionada() {
      return perguntaSelecionada < perguntas.length;
    }

    List<Map<String, Object>> respostas = temPerguntaSelecionada()
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas
            .map((resp) =>
                Resposta(resp['texto'], () => quandoSelecionada(resp['nota'])))
            .toList(),
      ],
    );
  }
}
