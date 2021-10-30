import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:tolo/model/album.dart';
import 'package:tolo/src/album/album_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitState());
  AlbumRepository _albumRepo = AlbumRepository.instance;

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    if (event is FetchAlbumEvent) {
      String path = await _albumRepo.getAvatar();
      yield state.copyWith(status: StatusSucess(), path: path);
    }
  }
}
