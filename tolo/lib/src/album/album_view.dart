import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/src/album/album_bloc.dart';
import 'package:tolo/src/album/album_repository.dart';
import 'package:tolo/utility/state/status.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key}) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Album")),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return BlocBuilder<AlbumBloc, AlbumState>(
            builder: (context, state) {
              if (state.status is StatusSucess) {
                return _sceneBuilder(state.path!);
              }
              return Container();
            },
          );
        },
      ),
    );
  }

  Widget _sceneBuilder(String path) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("get album"),
            onPressed: () {
              // AlbumRepository.instance.test();
            },
          ),
          Image.network(path)
        ],
      ),
    );
  }
}
