import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/app_navigator.dart';
import 'package:pokemon_bloc/cubit/details_cubit.dart';
import 'package:pokemon_bloc/cubit/nav_cubit.dart';

import 'bloc/pokemon_bloc.dart';
import 'pokemon_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetails = DetailsCubit();

    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavCubit(detailsCubit: pokemonDetails),
          ),
          BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)),
          ),
          BlocProvider(
            create: (context) => pokemonDetails,
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
