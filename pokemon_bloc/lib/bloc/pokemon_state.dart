part of 'pokemon_bloc.dart';

class PokemonState {
  PokemonInfo? pokemonInfo;
  PokemonSpecies? pokemonSpecies;

  PokemonState({
    this.pokemonInfo,
    this.pokemonSpecies,
  });

  PokemonState copyWith({
    PokemonInfo? pokemonInfo,
    PokemonSpecies? pokemonSpecies,
  }) {
    return PokemonState(
      pokemonInfo: pokemonInfo ?? this.pokemonInfo,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
    );
  }
}

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
