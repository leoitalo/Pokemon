import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final pokeController = PokeController();
  String name;
  String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder<Pokemon>(
            future: pokeController.pokemon,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done){
                return CircularProgressIndicator();
              }
              if (snapshot.hasData){
                return Expanded(child: 
                
                Column(    
                  children:[
                    Image.network(snapshot.data.urlImage, height: 250, width: 250, fit: BoxFit.cover,),
                    Text(snapshot.data.nome, style: TextStyle(fontSize: 30, color: Colors.black,),),  
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.abilities.length,
                        itemBuilder: (context, index) {
                          name = snapshot.data.abilities[index].name;
                          url = snapshot.data.abilities[index].url;
                          return DadosPokemon(index, name, url);
                        },
                      ),
                    ),
                  ],
                ),

                );
              } else if (snapshot.hasError){
                return Text(snapshot.error, style: TextStyle(fontSize: 18, color: Colors.red,),);
              }
              
            },
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              pokeController.loadPokemon();  
            });
            
          }, child: Text('Load pokemon'))
        ],
      ),
    );
  }
}
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