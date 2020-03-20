import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CameraRouteState();
}

class CameraRouteState extends State<CameraRoute> {
  CameraDescription _camera;
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      setState(() {
        _camera = cameras.first;

        _controller = CameraController(
          _camera,
          ResolutionPreset.ultraHigh,
        );

        _initializeControllerFuture = _controller.initialize();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initializeControllerFuture != null) {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: CameraPreview(_controller),
              floatingActionButton: TakePhotoButton(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class TakePhotoButton extends StatelessWidget {
  final CameraController _controller;

  TakePhotoButton(CameraController controller) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.camera_alt),
      onPressed: () async {
        try {
          final path = join(
              (await getTemporaryDirectory()).path, '${DateTime.now()}.png');

          await _controller.takePicture(path);
          print('Saved picture at path ${path.toString()}');
          await GallerySaver.saveImage(path);

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(path),
                    height: 40.0,
                  ),
                ),
                Text('Image has been saved')
              ],
            ),
          ));
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
