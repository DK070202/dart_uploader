import 'dart:io';

import 'package:dart_uploader/dart_uploader.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  runApp(const MyApp());

  await Uploader.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PickedFile? file;

  Task? uploadingTask;

  @override
  void dispose() {
    Uploader.shutDown();
    super.dispose();
  }

  void _sendTaskToBg() async {
    file = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    final fileToUpload = File(file!.path);
    final length = await fileToUpload.length();

    /// TODO : Here register the task from where we can listen updates.
    Uploader.instance.enqueueTheTask(
      filePath: fileToUpload.path,
      url: '<URL>',
      method: HttpMethod.PUT,
      headers: {
        'Accept': "*/*",
        'Connection': 'keep-alive',
        'Content-Length': length,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (uploadingTask != null && uploadingTask!.status.isUploading)
              SizedBox.square(
                dimension: 35,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CircularProgressIndicator(
                        value: (uploadingTask!.percentage / 100).toDouble(),
                      ),
                    ),
                    const Align(
                      child: Icon(
                        Icons.upload_file_outlined,
                      ),
                    )
                  ],
                ),
              ),
            if (uploadingTask != null && uploadingTask!.status.isFailed)
              const Icon(
                Icons.close,
              ),
            if (uploadingTask != null && uploadingTask!.status.isFailed)
              const Icon(
                Icons.close,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendTaskToBg,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
