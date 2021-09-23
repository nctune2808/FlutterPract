import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokemon_bloc/cubit/details_cubit.dart';

class NavCubit extends Cubit<int?> {
  DetailsCubit detailsCubit;
  NavCubit({
    required this.detailsCubit,
  }) : super(null);

  void showPokemonDetails(int pokemonId) {
    print(pokemonId);
    detailsCubit.getDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokemon() {
    emit(null);
    detailsCubit.clearDetails();
  }
}
