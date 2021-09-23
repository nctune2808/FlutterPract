import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/cubit/nav_cubit.dart';
import 'package:pokemon_bloc/details_view.dart';
import 'package:pokemon_bloc/pokemon_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: PokemonView()),
          if (pokemonId != null) MaterialPage(child: DetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokemon();
          return route.didPop(result);
        },
      );
    });
  }
}
