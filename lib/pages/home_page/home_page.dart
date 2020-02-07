import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/models/PokeApi.dart';
import 'package:pokemon/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokemon/pages/home_page/widgets/poke_item.dart';
import 'package:pokemon/stores/pokeapi_store.dart';
import 'package:pokemon/pages/poke_detail/poke_detail_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
     final _pokemonStore = Provider.of<PokeApiStore>(context);
     if(_pokemonStore.pokeApi == null){
       _pokemonStore.fetchPokemonList();
     }
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
                    child: Observer(builder: (BuildContext builder) {
                      PokeApi _pokeAPi = _pokemonStore.pokeApi;
                      return (_pokeAPi != null)
                          ? AnimationLimiter(
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(12),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: _pokemonStore.pokeApi.pokemon.length,
                                itemBuilder: (context, index) {
                                  Pokemon pokemon =
                                      _pokemonStore.getPokemon(index: index);
                                  //_pokemonStore.pokeApi.pokemon[index];
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: GestureDetector(
                                        child: PokeItem(
                                          types: pokemon.type,
                                          index: index,
                                          nome: pokemon.name,
                                          image: _pokemonStore.getImage(
                                              numero: pokemon.numero),
                                          color: ConstApp.getColorType(
                                              type: pokemon.type[0]),
                                          //num: pokemon.num,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PokeDetailPage(
                                                            index: index),
                                                fullscreenDialog: true,
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
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
