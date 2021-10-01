import 'package:pokemon_bloc/data/pokemon_list.dart';

class PokemonData {
  List<PokemonListing> pokemonList;
  bool canLoadNext;

  PokemonData({
    required this.pokemonList,
    required this.canLoadNext,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    final canLoadNext = json['next'] != null;
    final pokemonList = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();

    return PokemonData(pokemonList: pokemonList, canLoadNext: canLoadNext);
  }
}

// class PokemonDetails {
//   PokemonInfo pokemonInfo;
//   PokemonSpecies pokemonSpecies;
//   PokemonDetails({
//     required this.pokemonInfo,
//     required this.pokemonSpecies,
//   });
// }

class PokemonInfo {
  final int id;
  final String name;
  final String imgURL;
  final List<String> types;
  final int height;
  final int weight;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.imgURL,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory PokemonInfo.fromJsonToInfo(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final imgURL = json['sprites']['front_default'];
    final height = json['height'];
    final weight = json['weight'];
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();
    return PokemonInfo(
        id: id,
        name: name,
        imgURL: imgURL,
        types: types,
        height: height,
        weight: weight);
  }
}

class PokemonSpecies {
  final String description;
  PokemonSpecies({
    required this.description,
  });

  factory PokemonSpecies.fromJsonToSpecies(Map<String, dynamic> json) {
    final description = json['flavor_text_entries'][0]['flavor_text'];
    return PokemonSpecies(description: description);
  }
}
