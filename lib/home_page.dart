import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  final GlobalKey _globalKey = GlobalKey();

  _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Image saved successfully'),
      ));

      // Utils.toast(result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Flutter Basic',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 3,
          backgroundColor: Color.fromARGB(255, 1, 118, 5),
          actions: const [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  // width: 300,
                  height: 300,
                  color: Colors.blue,
                  child: photo == null
                      ? const SizedBox()
                      : Image.file(File(photo!.path)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _saveLocalImage();
              },
              child: Text(
                'Save To Gallery',
                style: TextStyle(color: Colors.black),
              ))
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[800],
          onPressed: () async {
            photo = await picker.pickImage(source: ImageSource.camera);
            setState(() {});
          },
          child: Icon(
            Icons.camera,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}