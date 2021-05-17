import 'dart:convert';

// Import da Class HTTP responsável pela comunicação do APP com a internet.
import 'package:http/http.dart' as http;
// Import da Class Pokemon.
import 'package:pokemon/pokemon.dart';

// Class API, responsável por ir buscar os dados em uma base de dados OnLine.
class Api{
  // ignore: missing_return
  // Método do tipo Future<Pokemon> onde recebe um argumento do tipo inteiro
  // Recebe uma propriedade ASYNC indicando que este método é Assincrono.
  Future<Pokemon> fetchPokemon(int number) async {

    // Variavel do tipo Final onde recebe os dados vindos da base OnLine em forma de JSON
    // esta chamada tem uma propriedade AWAIT que informa que a váriavel irá aguardar o resultado da resposta da consulta
    // e que o programa pode continuar sendo execultado.
    final response = await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$number'));
    
    // Verificando se a resposta obtida da base OnLine foi efetuada com sucesso
    if (response.statusCode == 200){
      // Retrorno positivo, o JSON é decodificado e alimentado o objeto Pokemon
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      // Retorno negativo, é emitido um alerta de texto informando que os dados não foram acessados
      return Future.error('Pokemon não encontrado!');
    }
  }
}