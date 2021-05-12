import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final pokeController = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
            future: pokeController.pokemon,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done){
                return CircularProgressIndicator();
              }
              if (snapshot.hasData){
                return Column(
                  children:[
                    Image.network(snapshot.data.urlImage, height: 300, width: 300, fit: BoxFit.cover,),
                    Text(snapshot.data.nome, style: TextStyle(fontSize: 30, color: Colors.black,),),
                  ],
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