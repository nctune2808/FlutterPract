part of 'wall_bloc.dart';

abstract class WallEvent {}

class FetchWallEvent extends WallEvent {}

class StreamWallEvent extends WallEvent {}

class RefreshWallEvent extends WallEvent {}
