import 'dart:io';

import 'package:dart_uploader/dart_uploader.dart';
import 'package:dart_uploader/models/task_request.dart';
import 'package:dart_uploader/models/task_status.dart';
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
  final int _counter = 0;

  PickedFile? file;

  TaskStatus? uploadingTask;

  @override
  void dispose() {
    Uploader.shutDown();
    super.dispose();
  }

  void _sendTaskToBg() async {
    file = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    final fileToUpload = File(file!.path);
    final length = await fileToUpload.length();
    Uploader.instance.enqueueTheTask(
      filePath: fileToUpload.path,
      url: '<URL>',
      method: HttpMethod.PUT,
      headers: {
        'Accept': "*/*",
        'Connection': 'keep-alive',
        'Content-Length': length,
      },
    ).listen((event) {
      uploadingTask = event;
      setState(() {});
    });
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
            if (uploadingTask == null) const Text('Processing ....'),
            if (uploadingTask != null)
              uploadingTask!.when<Widget>(
                ongoing: (taskId, percentage, url) {
                  return SizedBox.square(
                    dimension: 35,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CircularProgressIndicator(
                            value: (percentage / 100).toDouble(),
                          ),
                        ),
                        const Align(
                          child: Icon(
                            Icons.upload_file_outlined,
                          ),
                        )
                      ],
                    ),
                  );
                },
                completed: (taskId, url) => const Icon(
                  Icons.file_download_done,
                ),
                failed: (taskId, url, error) => const Icon(
                  Icons.close,
                ),
                cancelled: (taskId, url) => const Icon(
                  Icons.close,
                ),
              )
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
