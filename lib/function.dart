import 'dart:math';
import 'package:diacritic/diacritic.dart';

Random number = Random();
int randomNumber = number.nextInt(5);

// Verificador de letras
List<int> letterVerifier(String word, String letter, List<int> list) {
  int x = 0; // contador

  // roda um for pela palavra
  for (var rune in word.runes) {
    // cada caractere é transformado em string e retirado os acentos
    var character = removeDiacritics(String.fromCharCode(rune));

    //verifica se a letra enviada existe na palavra
    if (character == letter) {
      list[x] = 1; // adiciona 1 na posição X se a letra existe
    }

    x++;
  }

  // retorna a lista que recebeu, com "1"s caso tenha a letra
  return list;
}

List forcaImages = [
  'assets/forca0.png',
  'assets/forca1.png',
  'assets/forca2.png',
  'assets/forca3.png',
  'assets/forca4.png',
  'assets/forca5.png',
  'assets/forca6.png',
];

// pega a lista de 0 e 1s e mostra na tela as letras de cada posição
String showLetters(String word, List list) {
  int x = 0;
  String wordRevealed = "";

  for (var boolean in list) {
    if (boolean == 1) {
      wordRevealed = '$wordRevealed ${word[x]}';
    } else {
      wordRevealed = '$wordRevealed __';
    }
    x++;
  }

  return wordRevealed;
}

List letters = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];
