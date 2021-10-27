part of 'wall_bloc.dart';

abstract class WallEvent {}

class FetchWallEvent extends WallEvent {}

class StreamWallEvent extends WallEvent {}

class AddWallEvent extends WallEvent {
  Wall wall;
  AddWallEvent({
    required this.wall,
  });
}
