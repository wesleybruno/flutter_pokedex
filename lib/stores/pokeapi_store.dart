import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/models/PokeApi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {

@observable 
PokeApi pokeApi;

@action
fetchPokemonList(){
  pokeApi = null;
  loadPokeApi().then( (response) => {
    pokeApi =  response
  });


  

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
}