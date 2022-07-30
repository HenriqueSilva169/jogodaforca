import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jogodaforca/function.dart';
import 'package:jogodaforca/tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JogoDaForca(),
    );
  }
}

class JogoDaForca extends StatefulWidget {
  const JogoDaForca({Key? key}) : super(key: key);

  @override
  State<JogoDaForca> createState() => _JogoDaForcaState();
}

List words = ["sushi", "beterraba", "mãos", "manga", "guatemala"];
List tips = [
  "COMIDA JAPONESA",
  "HORTALIÇA",
  "MEMBRO DO CORPO",
  "FRUTA",
  "PAÍS"
];

String tip = tips[randomNumber];
String word = words[randomNumber];
String text = "";

// cria uma lista com uma quantidade de 0 igual a quantidade de letras
var foundLetters = List.filled(word.length, 0);

// letras que aparecerão na tela
String visibleLetters = showLetters(word, foundLetters);

// contador de erros, se ultrapassar 6 (contando com a forca vazia), o jogador perde
int wrongCounter = 0;
int rigtCounter = 0;

class _JogoDaForcaState extends State<JogoDaForca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jogo da Forca')),
      body: Column(children: [
        Center(
          child: Image(image: AssetImage(forcaImages[wrongCounter])),
        ),
        Center(
          child: Text(
            visibleLetters,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        if (wrongCounter > 4)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Dica: $tip'),
          ),
        Wrap(
          children: [
            for (String letter in letters)
              if (wrongCounter < 6)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // guarda a lista antiga para comparar depois
                      List oldSet = foundLetters.toList();
                      // verifica a letra enviada e adiciona nas letras visiveis caso acertada
                      foundLetters = letterVerifier(word, letter, foundLetters);
                      visibleLetters = showLetters(word, foundLetters);

                      // compara a nova lista com a antiga, se ficar igual
                      // pro dart, todas as listas são iguais, ele não compara os elementos dentro
                      // então é necessáriio usar a função listEquals que faz isso
                      if (listEquals(oldSet, foundLetters)) {
                        wrongCounter++;
                      }
                      if (wrongCounter >= 6) {
                        text = "Você Perdeu!";
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((build) => result(
                                      text: text,
                                    ))));
                      }
                      void loli(l) {
                        if (!foundLetters.contains(0)) {
                          rigtCounter = 1;
                        }
                      }

                      foundLetters.forEach((letra) => loli(letra));
                      if (rigtCounter == 1) {
                        text = "Você Ganhou!";
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((build) => result(
                                      text: text,
                                    ))));
                      }
                      print(rigtCounter);
                    });
                  },
                  child: Text(letter),
                ),
          ],
        ),
        Text("Henrique Gleison Silva, Arthur Oliveira de Souza")
      ]),
    );
  }
}
