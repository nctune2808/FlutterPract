import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

const String uploadImage = r"""
mutation($file: Upload!) {
  upload(file: $file)
}
""";

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  bool _uploadInProgress = false;

  _uploadImage(BuildContext context) async {
    setState(() {
      _uploadInProgress = true;
    });

    var byteData = _image!.readAsBytesSync();

    var multipartFile = MultipartFile.fromBytes(
      'photo',
      byteData,
      filename: '${DateTime.now().second}.jpg',
      contentType: MediaType("image", "jpg"),
    );

    var opts = MutationOptions(
      document: gql(uploadImage),
      variables: {
        "file": multipartFile,
      },
    );

    var client = GraphQLProvider.of(context).value;

    var results = await client.mutate(opts);

    setState(() {
      _uploadInProgress = false;
    });

    var message = results.hasException
        ? '${results.exception}'
        : "Image was uploaded successfully!";

    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future selectImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        print(image.path);
        _image = File(image.path);
      }
      print("null");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (_image != null)
              Flexible(
                flex: 9,
                child: Image.file(_image!),
              )
            else
              Flexible(
                flex: 9,
                child: Center(
                  child: Text("No Image Selected"),
                ),
              ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.photo_library),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Select File"),
                      ],
                    ),
                    onPressed: () => selectImage(),
                  ),
                  if (_image != null)
                    Mutation(
                      options: MutationOptions(
                        document: gql(uploadImage),
                        onCompleted: (d) {
                          print(d);
                          setState(() {
                            _uploadInProgress = false;
                          });
                        },
                        update: (cache, results) {
                          var message = results!.hasException
                              ? '${results.exception!}'
                              : "Image was uploaded successfully!";

                          final snackBar = SnackBar(content: Text(message));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                      builder: (runMutation, result) {
                        return ElevatedButton(
                          child: _isLoadingInProgress(),
                          onPressed: () {
                            setState(() {
                              _uploadInProgress = true;
                            });

                            var byteData = _image!.readAsBytesSync();

                            var multipartFile = MultipartFile.fromBytes(
                              'photo',
                              byteData,
                              filename: '${DateTime.now().second}.jpg',
                              contentType: MediaType("image", "jpg"),
                            );

                            runMutation(<String, dynamic>{
                              "file": multipartFile,
                            });
                          },
                        );
                      },
                    ),
                  // if (_image != null)
                  //   ElevatedButton(
                  //     child: _isLoadingInProgress(),
                  //     onPressed: () => _uploadImage(context),
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _isLoadingInProgress() {
    return _uploadInProgress
        ? CircularProgressIndicator()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.file_upload),
              SizedBox(
                width: 5,
              ),
              Text("Upload File"),
            ],
          );
  }
}
