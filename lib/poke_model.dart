// Import da Class Pokemon
import 'package:pokemon/pokemon.dart';
// Import da Class API
// Class responsável de ir buscar os dados via JSON em uma base de dados OnLine
import 'api.dart';

// Criação da Class Model, classe que se comunicará com a API para obter os dados JSON de uma base OnLine
class PokeModel{
  // Variável privada do tipo Future<Pokemon>
  Future<Pokemon> _pokemon;

  // Objeto representado para aguardar um valor futuro, valor este sendo processado pela class Pokemon que esta sendo
  // processado na class Model
  Future<Pokemon> get pokemon => _pokemon;

  // Método responsável em ir buscar os dados na API passando um número como argumento
  fetchPokemon(int number){
    // Alimentando a variavel _pokemon do tipo Future através do método na Class API
    _pokemon = Api().fetchPokemon(number);
  }
}