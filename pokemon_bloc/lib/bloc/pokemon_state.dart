part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoadSuccessed extends PokemonState {
  final List<PokemonListing> pokemonList;
  final bool canLoadNext;
  PokemonLoadSuccessed({
    required this.pokemonList,
    required this.canLoadNext,
  });
}

class PokemonLoadFailed extends PokemonState {
  final Object error;
  PokemonLoadFailed({
    required this.error,
  });
}
