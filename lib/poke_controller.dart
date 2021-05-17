
// Import da Class math do dart, está class é reposnável por operações matemáticas
import 'dart:math';
// Import da Class Model pokemon.
// Class responsável pelo gerenciamento dos dados.
import 'package:pokemon/poke_model.dart';
// Import da Class Pokemon
import 'package:pokemon/pokemon.dart';

// Criação da Class Controller, classe que se comunicará com o Model para obter os dados
class PokeController{
  // Variável final (Não pode ser altrerada depois de iniciada) instanciada da Class Model.
  final pokemodel = PokeModel();

  // Objeto representado para aguardar um valor futuro, valor este sendo processado pela class Pokemon que esta sendo
  // processado na class Model
  Future<Pokemon> get pokemon => pokemodel.pokemon;

  // Método utilizado para passar um argumento de forma randomica para o Model que é responsável pelos dados
  loadPokemon() {
    // Execulta o método fetchPokemon() na Class pokemodel passando um argumento;
    pokemodel.fetchPokemon(Random().nextInt(1000));
  }

}