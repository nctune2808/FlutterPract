part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class PokemonPageRequest extends PokemonEvent {
  final int page;
  PokemonPageRequest({
    required this.page,
  });
}
