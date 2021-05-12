
import 'dart:math';

import 'package:pokemon/poke_model.dart';
import 'package:pokemon/pokemon.dart';

class PokeController{
 final pokemodel = PokeModel();

 Future<Pokemon> get pokemon => pokemodel.pokemon;

 loadPokemon() {
   pokemodel.fetchPokemon(Random().nextInt(1000));
 }

}