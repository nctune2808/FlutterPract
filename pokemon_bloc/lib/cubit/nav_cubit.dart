import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokemon_bloc/cubit/details_cubit.dart';

class NavCubit extends Cubit<int> {
  DetailsCubit detailsCubit;
  NavCubit({
    required this.detailsCubit,
  }) : super(0);

  void showPokemonDetails(int pokemonId) async {
    detailsCubit.getDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokemon() async {
    // emit(null);
    detailsCubit.clearDetails();
  }
}
