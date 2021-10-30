import 'package:flutter/material.dart';
import 'package:tolo/src/photo/photo_repository.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("get photo"),
              onPressed: () {
                PhotoRepository.instance.test();
              },
            ),
          ],
        ),
      ),
    );
  }
}
