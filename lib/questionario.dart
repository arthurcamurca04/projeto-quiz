import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int perguntaSelecionada;
  final void Function(int) resposta;

  Questionario({
    @required this.questions,
    @required this.perguntaSelecionada,
    @required this.resposta,
  });


  bool get temPerguntaSelecionada {
    return perguntaSelecionada < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? questions[perguntaSelecionada]['respostas']
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Questao(questions[perguntaSelecionada]['texto']),
          ),
        ),
        ...respostas.map((resp) => BtnResposta(resp['texto'], () => resposta(resp['pontuacao']))).toList(),
      ],
    );
  }
}
