import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tolo/model/photo.dart';
import 'package:tolo/route/router.dart';

class PhotoView extends StatefulWidget {
  Photo photo;
  PhotoView({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          trailingIcon: Icons.copy_rounded,
          child: Center(child: Text("ID")),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: "type")).then((result) {
              final snackBar = SnackBar(content: Text('Copied to Clipboard'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });

            // Navigator.popUntil(
            //     context, (route) => route.settings.name == "/album/players");
          },
        ),
        CupertinoContextMenuAction(
          trailingIcon: Icons.file_download_outlined,
          child: Center(child: Text("Download")),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 10,
        child: Image.network(widget.photo.url,
            fit: BoxFit.fitWidth,
            loadingBuilder: (co, ch, lo) => _loadingBuilder(co, ch, lo)),
      ),
    );
  }

  Widget _loadingBuilder(context, child, loadingProgress) {
    if (loadingProgress != null) {
      return Center(
        child: CircularProgressIndicator(
            value: loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!),
      );
    }
    return child;
  }
}
