import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/models/PokeApi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi pokeApi;

  @observable
  Pokemon pokemonAtual;

  @action
  fetchPokemonList() {
    pokeApi = null;
    loadPokeApi().then((response) => {pokeApi = response});
  }

  @action
  getPokemon({int index}) {
    return pokeApi.pokemon[index];
  }

  @action
  setPokemonAtual({Pokemon pokemon}) {
    pokemonAtual = pokemon;
  }

  @action
  getPokemonAtual() {
    return pokemonAtual;
  }

  Future<PokeApi> loadPokeApi() async {
    try {
      final response = await http.get(ConstApp.baseURL);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (e) {
      print('Erro ao carregar lista');
      print(e);

      return null;
    }
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      height: 80,
      width: 80,
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }
}
