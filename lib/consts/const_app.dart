import 'package:flutter/material.dart';

class ConstApp {
  static const whitePokeball = 'assets/images/pokeball.png';
  static const blackPokeball = 'assets/images/pokeball_dark.png';
  static const String baseURL = 'https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json';

  static Color getColorType({String type}){
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
        break;
      case 'Fire':
        return Colors.red;
        break;
      case 'Water':
        return Colors.blue;
        break;
      
      default:
        return Colors.white;
    }
  }
}
