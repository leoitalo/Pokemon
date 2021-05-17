// Import Widgets para layout.
import 'package:flutter/material.dart';
// Import CLass Controller Pokemon.
// Class responsável pela ligação entre a View e o Model.
import 'package:pokemon/poke_controller.dart';
// Class Pokemon
import 'package:pokemon/pokemon.dart';


// Primeira Class a ser chamada no APP. ela extende da Class StatefulWidget por ter alteração de estado.
class PokeView extends StatefulWidget {
  @override
  // Criando uma estancia priavada da Class privada _PokeViewState.
  _PokeViewState createState() => _PokeViewState();
}


class _PokeViewState extends State<PokeView> {
  // Variável final (Não pode ser altrerada depois de iniciada) instanciada da Class Controller.
  final pokeController = PokeController();
  String name;
  String url;

  @override
  Widget build(BuildContext context) {
    // Início da contrução da tela com o widget Material.
    return Material(
      // Recebe um Widget chamad Column onde receberá outros argumentos para a criação do layout
      // Widget Column
      // Responsável por exibir widget filhos na forma vertical
      child: Column(
        // mainAxisAlignment: Argumento responsável para alinhamentos dos widget filhos na veretical,
        // também pode ser usado o crossAxisAlignment: para alinhamento horizontal.
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,

        children: [
          // Por está esperando um Widget FUTURE do tipo Pokemon, este Widget controi uma base para aguardar o retorno do Snapshot
          FutureBuilder<Pokemon>(
            // Propriedade que informa de onde esperar a resposta do Future.            
            future: pokeController.pokemon,
            // Cria o widget com o contexto e snapshot que é o recebimento dos dados vindo do json
            builder: (context, snapshot) {
              // Verifica o stado da chamada e caso não tenha ainda retorno, apresenta um indicador de carregamento.
              if (snapshot.connectionState != ConnectionState.done){
                return CircularProgressIndicator();
              }
              // Caso o status da chamada seja retornado com valor, é retornado a tela ou os dados solicitados.
              if (snapshot.hasData){
                return 
                  // Widget Expanded. Oculpa toda á área, caso tenha widget filho, ocupará as dimenções do filho.
                  Expanded(
                    child:  Column(    
                      children:[
                        // Widget Imagem utilizando o método network para buscar a imagem da internet.
                        Image.network(snapshot.data.urlImage, height: 250, width: 250, fit: BoxFit.cover,),
                        // Widget Text recebendo dados do JSON via sanpshot.data
                        Text(snapshot.data.nome, style: TextStyle(fontSize: 30, color: Colors.black,),),  
                        Expanded(
                          // Widget Listview.Builder
                          child: ListView.builder(
                            // Recebe a informação do tamanho com quantos elementos serão construidos a listview.
                            itemCount: snapshot.data.abilities.length,
                            // Cria a listview com o contexto e o index
                            itemBuilder: (context, index) {
                              // Alimenta as variaveis com os dados do array abilities dentro do json principal.
                              name = snapshot.data.abilities[index].name;
                              url = snapshot.data.abilities[index].url;

                              // Chama o componente criado para otimizar na exibição dos dados.
                              return DadosPokemon(index, name, url);
                            },
                          ),
                        ),
                      ],
                    ),

                );

                // Caso retorne um erro nos dados como requisição não encontrada, retorna um alerta ao usuário.
              } else if (snapshot.hasError){
                return Text(snapshot.error, style: TextStyle(fontSize: 18, color: Colors.red,),);
              }
              
            },
          ),

          // Cria o Widget de botão.
          ElevatedButton(
            onPressed: (){
              // Atualiza o estado do App ao ser precionado.
              setState(() {
                // Chama o método loadPokemon() no Controller para exibir os dados na tela.
                pokeController.loadPokemon();  
              });
            }, 
            child: Text('Load pokemon')
          )
        ],
      ),
    );
  }
}

// Criação da Class DadosPokemon que é um componente ajudando na exibição dos dados.
class DadosPokemon extends StatelessWidget {
  
  final int index;
  final String name;
  final String url;

  DadosPokemon(this.index, this.name, this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.grey,
      child: Text('$name - $url'),
    );
  }
}