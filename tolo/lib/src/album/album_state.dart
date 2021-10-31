part of 'album_bloc.dart';

class AlbumState {
  final List<Album>? albums;
  final String? path;
  final Status? status;
  AlbumState({
    this.albums,
    this.path,
    this.status = const StatusInitial(),
  });

  AlbumState copyWith({
    List<Album>? albums,
    String? path,
    Status? status,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      path: path ?? this.path,
      status: status ?? this.status,
    );
  }
}

class AlbumInitState extends AlbumState {}
