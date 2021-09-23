import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_bloc/data/pokemon_data.dart';

class PokemonRepository {
  final baseURL = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonData> getPokemonPage(int pageIndex) async {
    final queryParas = {'limit': '200', 'offset': (pageIndex * 200).toString()};
    final uri = Uri.https(baseURL, '/api/v2/pokemon', queryParas);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonData.fromJson(json);
  }

  Future<PokemonInfo> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseURL, '/api/v2/pokemon/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonInfo.fromInfo(json);
  }

  Future<PokemonSpecies> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseURL, '/api/v2/pokemon-species/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonSpecies.fromJson(json);
  }
}
