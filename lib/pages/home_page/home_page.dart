import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/models/PokeApi.dart';
import 'package:pokemon/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokemon/stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeApiStore;
  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    

    double screeWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.5),
            left: screeWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstApp.blackPokeball,
                width: 240,
                height: 240,
              ),
              opacity: 0.2,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(height: statusHeight),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext builder) {
                        PokeApi _pokeAPi = pokeApiStore.pokeApi;
                        return (_pokeAPi != null) ? 
                          ListView.builder(
                          itemCount: _pokeAPi.pokemon.length,
                          itemBuilder: (context, index) { 
                            return ListTile( title: Text(_pokeAPi.pokemon[index].name),);
                          }) 
                          : 
                          Center( child: CircularProgressIndicator(),);
                      }
                    ), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
