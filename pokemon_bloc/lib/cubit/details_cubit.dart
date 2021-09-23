import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_bloc/data/pokemon_data.dart';
import 'package:pokemon_bloc/data/pokemon_repository.dart';

class DetailsCubit extends Cubit<PokemonDetails?> {
  final _pokemonRepository = PokemonRepository();

  DetailsCubit() : super(null);

  void getDetails(int pokemonId) async {
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = response[0] as PokemonInfo;
    final speciesInfo = response[1] as PokemonSpecies;

    emit(PokemonDetails(pokemonInfo: pokemonInfo, pokemonSpecies: speciesInfo));
  }

  void clearDetails() => emit(null);
}
