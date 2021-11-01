import 'dart:async';
import 'dart:io' as io;
import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/src/gallery/galerry_repository.dart';
import 'package:tolo/src/photo/photo_repository.dart';

import 'save_as/save_as.dart';

enum UploadType {
  file,
  clear,
}

class GalleryView extends StatelessWidget {
  GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskManager(),
    );
  }
}

/// A StatefulWidget which keeps track of the current uploaded files.
class TaskManager extends StatefulWidget {
  // ignore: public_member_api_docs
  TaskManager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskManager();
  }
}

class _TaskManager extends State<TaskManager> {
  List<firebase_storage.UploadTask> _uploadTasks = [];
  File? _image;

  /// The user selects a file, and the task is added to the list.

  /// Handles the user pressing the PopupMenuItem item.
  Future<void> handleUploadType(UploadType type) async {
    switch (type) {
      case UploadType.file:
        PickedFile? file =
            await ImagePicker().getImage(source: ImageSource.gallery);

        firebase_storage.UploadTask? task =
            await PhotoRepository.instance.uploadFile(file!);
        if (task != null) {
          setState(() {
            _uploadTasks = [..._uploadTasks, task];
            _image = File(file.path);
          });
        }
        break;
      case UploadType.clear:
        setState(() {
          _uploadTasks = [];
        });
        break;
    }
  }

  void _removeTaskAtIndex(int index) {
    setState(() {
      _uploadTasks = _uploadTasks..removeAt(index);
    });
  }

  Future<void> _downloadBytes(firebase_storage.Reference ref) async {
    final bytes = await ref.getData();
    // Download...
    await saveAsBytes(bytes!, 'some-image.jpg');
  }

  Future<void> _downloadLink(firebase_storage.Reference ref) async {
    final link = await ref.getDownloadURL();

    await Clipboard.setData(ClipboardData(
      text: link,
    ));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Success!\n Copied download URL to Clipboard!',
        ),
      ),
    );
  }

  Future<void> _downloadFile(firebase_storage.Reference ref) async {
    final io.Directory systemTempDir = io.Directory.systemTemp;
    final io.File tempFile = io.File('${systemTempDir.path}/temp-${ref.name}');
    if (tempFile.existsSync()) await tempFile.delete();

    await ref.writeToFile(tempFile);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Success!\n Downloaded ${ref.name} \n from bucket: ${ref.bucket}\n '
          'at path: ${ref.fullPath} \n'
          'Wrote "${ref.fullPath}" to tmp-${ref.name}.txt',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Example App'),
        actions: [
          PopupMenuButton<UploadType>(
            onSelected: handleUploadType,
            icon: const Icon(Icons.add),
            itemBuilder: (context) => [
              const PopupMenuItem(
                  // ignore: sort_child_properties_last
                  child: Text('Upload local file'),
                  value: UploadType.file),
              if (_uploadTasks.isNotEmpty)
                const PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: Text('Clear list'),
                    value: UploadType.clear)
            ],
          )
        ],
      ),
      body: _uploadTasks.isEmpty
          ? const Center(child: Text("Press the '+' button to add a new file."))
          : ListView.builder(
              itemCount: _uploadTasks.length,
              itemBuilder: (context, index) => Column(
                children: [
                  UploadTaskListTile(
                    task: _uploadTasks[index],
                    onDismissed: () => _removeTaskAtIndex(index),
                    onDownloadLink: () {
                      _downloadLink(_uploadTasks[index].snapshot.ref);
                    },
                    onDownload: () {
                      if (kIsWeb) {
                        _downloadBytes(_uploadTasks[index].snapshot.ref);
                      } else {
                        _downloadFile(_uploadTasks[index].snapshot.ref);
                      }
                    },
                  ),
                  if (_image != null) Image.file(_image!)
                ],
              ),
            ),
    );
  }
}

/// Displays the current state of a single UploadTask.
class UploadTaskListTile extends StatelessWidget {
  // ignore: public_member_api_docs
  const UploadTaskListTile({
    Key? key,
    required this.task,
    required this.onDismissed,
    required this.onDownload,
    required this.onDownloadLink,
  }) : super(key: key);

  /// The [UploadTask].
  final firebase_storage.UploadTask /*!*/ task;

  /// Triggered when the user dismisses the task from the list.
  final VoidCallback /*!*/ onDismissed;

  /// Triggered when the user presses the download button on a completed upload task.
  final VoidCallback /*!*/ onDownload;

  /// Triggered when the user presses the "link" button on a completed upload task.
  final VoidCallback /*!*/ onDownloadLink;

  /// Displays the current transferred bytes of the task.
  String _bytesTransferred(firebase_storage.TaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalBytes}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<firebase_storage.TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (
        BuildContext context,
        AsyncSnapshot<firebase_storage.TaskSnapshot> asyncSnapshot,
      ) {
        Widget subtitle = const Text('---');
        firebase_storage.TaskSnapshot? snapshot = asyncSnapshot.data;
        firebase_storage.TaskState? state = snapshot?.state;

        if (asyncSnapshot.hasError) {
          if (asyncSnapshot.error is firebase_core.FirebaseException &&
              (asyncSnapshot.error as firebase_core.FirebaseException).code ==
                  'canceled') {
            subtitle = const Text('Upload canceled.');
          } else {
            // ignore: avoid_print
            print(asyncSnapshot.error);
            subtitle = const Text('Something went wrong.');
          }
        } else if (snapshot != null) {
          subtitle = Text('$state: ${_bytesTransferred(snapshot)} bytes sent');
        }

        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: ($) => onDismissed(),
          child: ListTile(
            title: Text('Upload Task #${task.hashCode}'),
            subtitle: subtitle,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (state == firebase_storage.TaskState.running)
                  IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: task.pause,
                  ),
                if (state == firebase_storage.TaskState.running)
                  IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: task.cancel,
                  ),
                if (state == firebase_storage.TaskState.paused)
                  IconButton(
                    icon: const Icon(Icons.file_upload),
                    onPressed: task.resume,
                  ),
                if (state == firebase_storage.TaskState.success)
                  IconButton(
                    icon: const Icon(Icons.file_download),
                    onPressed: onDownload,
                  ),
                if (state == firebase_storage.TaskState.success)
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: onDownloadLink,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
