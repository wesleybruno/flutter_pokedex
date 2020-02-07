import 'package:flutter/material.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/models/PokeApi.dart';
import 'package:pokemon/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;
  Color _color;

  PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pokemonStore = Provider.of<PokeApiStore>(context);
    PageController _controller =
        PageController(initialPage: index, keepPage: false);
    Pokemon pokemon = _pokemonStore.getPokemon(index: index);
    _pokemonStore.setPokemonAtual(pokemon: pokemon);
    _color = ConstApp.getColorType(type: pokemon.type[0]);
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        title: Opacity(
          child: Text(
            _pokemonStore.getPokemonAtual(),
            style: TextStyle(
              fontFamily: 'Google',
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          opacity: 0.5,
        ),
        elevation: 0,
        backgroundColor: _color,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: null)
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(),
              );
            },
          ),
          Positioned(
            top: 50,
            child: SizedBox(
              height: 120,
              child: PageView.builder(
                controller: _controller,
                itemCount: _pokemonStore.pokeApi.pokemon.length,
                itemBuilder: (BuildContext context, int count) {
                  Pokemon _poke = _pokemonStore.getPokemonAtual();
                  _color = ConstApp.getColorType(type: _poke.type[0]);
                  return _pokemonStore.getImage(numero: _poke.numero);
                },
                onPageChanged: (value) {
                  Pokemon _poke = _pokemonStore.getPokemon(index: value);
                  print(_poke.name);
                  print(_poke.numero);
                  _pokemonStore.setPokemonAtual(pokemon: _poke);
                  return _pokemonStore.getImage(numero: _poke.numero);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
