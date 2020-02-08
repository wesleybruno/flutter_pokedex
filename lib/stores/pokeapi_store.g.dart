// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$getCorPokemonAtualComputed;

  @override
  PokeApi get getCorPokemonAtual => (_$getCorPokemonAtualComputed ??=
          Computed<PokeApi>(() => super.getCorPokemonAtual))
      .value;
  Computed<Pokemon> _$getPokemonAtualComputed;

  @override
  Pokemon get getPokemonAtual => (_$getPokemonAtualComputed ??=
          Computed<Pokemon>(() => super.getPokemonAtual))
      .value;

  final _$pokeApiAtom = Atom(name: '_PokeApiStoreBase.pokeApi');

  @override
  PokeApi get pokeApi {
    _$pokeApiAtom.context.enforceReadPolicy(_$pokeApiAtom);
    _$pokeApiAtom.reportObserved();
    return super.pokeApi;
  }

  @override
  set pokeApi(PokeApi value) {
    _$pokeApiAtom.context.conditionallyRunInAction(() {
      super.pokeApi = value;
      _$pokeApiAtom.reportChanged();
    }, _$pokeApiAtom, name: '${_$pokeApiAtom.name}_set');
  }

  final _$pokemonAtualAtom = Atom(name: '_PokeApiStoreBase.pokemonAtual');

  @override
  Pokemon get pokemonAtual {
    _$pokemonAtualAtom.context.enforceReadPolicy(_$pokemonAtualAtom);
    _$pokemonAtualAtom.reportObserved();
    return super.pokemonAtual;
  }

  @override
  set pokemonAtual(Pokemon value) {
    _$pokemonAtualAtom.context.conditionallyRunInAction(() {
      super.pokemonAtual = value;
      _$pokemonAtualAtom.reportChanged();
    }, _$pokemonAtualAtom, name: '${_$pokemonAtualAtom.name}_set');
  }

  final _$corPokemonAtualAtom = Atom(name: '_PokeApiStoreBase.corPokemonAtual');

  @override
  dynamic get corPokemonAtual {
    _$corPokemonAtualAtom.context.enforceReadPolicy(_$corPokemonAtualAtom);
    _$corPokemonAtualAtom.reportObserved();
    return super.corPokemonAtual;
  }

  @override
  set corPokemonAtual(dynamic value) {
    _$corPokemonAtualAtom.context.conditionallyRunInAction(() {
      super.corPokemonAtual = value;
      _$corPokemonAtualAtom.reportChanged();
    }, _$corPokemonAtualAtom, name: '${_$corPokemonAtualAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
