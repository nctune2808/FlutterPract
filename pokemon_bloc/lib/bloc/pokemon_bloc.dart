import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokemon_bloc/data/pokemon_list.dart';
import 'package:pokemon_bloc/data/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoading();

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonLoadSuccessed(
            pokemonList: pokemonPageResponse.pokemonList,
            canLoadNext: pokemonPageResponse.canLoadNext);
      } catch (e) {
        yield PokemonLoadFailed(error: e);
      }
    }
  }
}
