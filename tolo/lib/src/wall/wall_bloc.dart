import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/wall.dart';
import 'package:tolo/src/wall/wall_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'wall_event.dart';
part 'wall_state.dart';

class WallBloc extends Bloc<WallEvent, WallState> {
  WallRepository _wallRepo = WallRepository.instance;
  WallBloc() : super(WallInitState());

  Stream<WallState> mapFetchEventToState() async* {
    List<Wall> walls = await _wallRepo.getWalls();
    yield state.copyWith(status: StatusSucess(), walls: walls);
  }

  @override
  Stream<WallState> mapEventToState(WallEvent event) async* {
    if (event is FetchWallEvent) {
      yield* mapFetchEventToState();
    }

    if (event is AddWallEvent) {
      await _wallRepo.addWall(wall: event.wall);
      yield state.copyWith(status: StatusSucess());
      yield* mapFetchEventToState();
    }
  }
}
