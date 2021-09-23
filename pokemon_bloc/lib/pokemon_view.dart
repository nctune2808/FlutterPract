import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/bloc/pokemon_bloc.dart';
import 'package:pokemon_bloc/cubit/nav_cubit.dart';

class PokemonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon'),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonLoadSuccessed) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: state.pokemonList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        child: GridTile(
                          child: Column(
                            children: [
                              Image.network(state.pokemonList[index].imageURL),
                              Text(state.pokemonList[index].name),
                            ],
                          ),
                        ),
                      ),
                      onTap: () => BlocProvider.of<NavCubit>(context)
                          .showPokemonDetails(state.pokemonList[index].id),
                    );
                  });
            } else if (state is PokemonLoadFailed) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
