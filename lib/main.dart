import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'questionario.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int perguntaSelecionada = 0;
  var pontuacaoTotal = 0;

  final _questions = const [
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Coelho', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Azul',  'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual sua comida favorita?',
      'respostas': [
        {'texto': 'Pizza', 'pontuacao': 10},
        {'texto': 'Lasanha', 'pontuacao': 5},
        {'texto': 'Coxinha', 'pontuacao': 3},
        {'texto': 'Macarrão', 'pontuacao': 1},
      ],
    },
  ];

  void resposta(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontuacao;
      });
    }
  }

  void reiniciarQuestionario(){
    setState(() {
      pontuacaoTotal = 0;
      perguntaSelecionada = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      title: 'Flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Título da AppBar',
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: perguntaSelecionada,
                questions: _questions,
                resposta: resposta,
              )
            : Resultado(
              pontuacao: pontuacaoTotal,
              onReiniciarQuestionario: reiniciarQuestionario,
            ),
      ),
    );
  }
}
