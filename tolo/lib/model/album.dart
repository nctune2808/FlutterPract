import 'package:firebase_storage/firebase_storage.dart';

import 'package:tolo/model/photo.dart';

class Album {
  Reference ref;
  String name;
  List<Photo> photos;

  Album({
    required this.ref,
    required this.name,
    required this.photos,
  });

  Album copyWith({
    Reference? ref,
    String? name,
    List<Photo>? photos,
  }) {
    return Album(
      ref: ref ?? this.ref,
      name: name ?? this.name,
      photos: photos ?? this.photos,
    );
  }
}
