// Criação da Class Pokemon.
class Pokemon{
  String nome;
  String urlImage;
  // Criação da variável do tipo List<Ability>. Ability é o dado que será mapeado dentro do JSON e alimentado na variável abilities.
  List<Ability> abilities;

  // Método fromJson onde será mapeado o JSON base recebido da base OnLine.
  // Este método usará o Map<Key, Value> json ... O Map receberá uma chave String e um valor dinâmico e adicionaá ao array json
  // Este construtor é invocado na Class API para ser alimentado.
  Pokemon.fromJson(Map<String, dynamic> json){

    // Alimentando as variáveis com os dados do JSON
    nome = json['name'];
    urlImage = json['sprites']['front_default'];

    // Criação da variável arrayAbilities que será alimentada com os dados [novo array] do item abilities do JSON criando uma lista.
    var arrayAbilities = json['abilities'] as List;

    // Alimentando a variável List abilities com os dados obtidos e armazenados no arrayAbilities
    // É utilizado o método map() onde recebe uma Closure (m){ ... } ... Passando o nome item e retornando um objeto Ability em 
    // forma de lista. 
    abilities = arrayAbilities.map((item) {
      return Ability.fronJson(item['ability']);
    }).toList();

  }
}

// Criação da Class Ability 
class Ability{
  String name;
  String url;

  // Método fromJson onde será mapeado o JSON base recebido da base OnLine.
  // Este método usará o Map<Key, Value> json ... O Map receberá uma chave String e um valor dinâmico e adicionaá ao array json.
  // Este contrutor é invocado dentro do construtor da Class Pokemon onde é alimentado.
  Ability.fronJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}