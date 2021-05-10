
import 'package:pokemon/poke_model.dart';

class PokeController{
 final pokemodel = PokeModel();

 loadPokemon() {
   pokemodel.fetchPokemon();
 }

}