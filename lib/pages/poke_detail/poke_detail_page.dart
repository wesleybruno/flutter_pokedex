import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    Pokemon _pokemonAtual = _pokemonStore.getPokemonAtual;
    _color = ConstApp.getColorType(type: _pokemonAtual.type[0]);
    PageController _controller = PageController(initialPage: index, keepPage: false);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Observer(builder: (BuildContext context) {
            _color = ConstApp.getColorType(type: _pokemonStore.pokemonAtual.type[0]);
            return AppBar(
              title: Opacity(
                child: Text(
                  _pokemonStore.pokemonAtual.name,
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
            );
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Observer(builder: (_) {
            _color =
                ConstApp.getColorType(type: _pokemonStore.pokemonAtual.type[0]);
            return Container(color: _color);
          }),
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
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _controller,
                itemCount: _pokemonStore.pokeApi.pokemon.length,
                itemBuilder: (BuildContext context, int count) {
                  Pokemon _pokeitem = _pokemonStore.getPokemon(index: count);
                  return _pokemonStore.getImage(numero: _pokeitem.numero);
                },
                onPageChanged: (index) {
                  _pokemonStore.setPokemonAtual(index: index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
