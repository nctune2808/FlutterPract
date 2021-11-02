import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/album.dart';
import 'package:tolo/src/album/album_bloc.dart';
import 'package:tolo/src/album/photo/photo_view.dart';
import 'package:tolo/src/home/loading_view.dart';
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
      appBar: AppBar(
        title: Text("Album"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.filter_list_rounded),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Filter 1')),
                    PopupMenuItem(child: Text('Filter 2')),
                  ])
        ],
      ),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return BlocBuilder<AlbumBloc, AlbumState>(
            builder: (context, state) {
              if (state.status is StatusSucess) {
                return _sceneBuilder(state.albums!);
              } else {
                return LoadingView();
              }
            },
          );
        },
      ),
    );
  }

  Widget _sceneBuilder(List<Album> albums) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AlbumBloc>().add(FetchAlbumEvent());
        await Future.delayed(Duration(seconds: 1));
      },
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.all(30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 30),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Text(albums[index].name),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        // settings: RouteSettings(name: "/album/players"),
                        builder: (_) => _albumBuilder(albums[index])));
              },
            );
          },
        ),
      ),
    );
  }

  // new scene

  Widget _albumBuilder(Album album) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.border_all_rounded),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('List')),
                    PopupMenuItem(child: Text('Gird')),
                  ]),
          PopupMenuButton(
              icon: Icon(Icons.filter_list_rounded),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Filter 1')),
                    PopupMenuItem(child: Text('Filter 2')),
                  ])
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: album.photos.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Image.network(album.photos[index].url!, fit: BoxFit.cover),
            onTap: () {
              showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.95),
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.black,
                    contentPadding: EdgeInsets.zero,
                    content: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1,
                        initialPage: index,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                      ),
                      items: album.photos
                          .map((photo) => PhotoView(photo: photo))
                          .toList(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
