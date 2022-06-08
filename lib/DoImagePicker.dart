// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

//這個版本我有手動修改過，我只留下上傳多張相片的功能。

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Picker Demo',
      // home: DoImagePicker(title: 'Image Picker Example'),
      home: DoImagePicker(),
    );
  }
}

class DoImagePicker extends StatefulWidget {
  const DoImagePicker({Key? key}) : super(key: key);
  // final String? title;

  @override
  _DoImagePickerState createState() => _DoImagePickerState();
}

class _DoImagePickerState extends State<DoImagePicker> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      //我改變這邊，並且將圖片的值給固定住
      try {
        final List<XFile>? pickedFileList = await _picker.pickMultiImage(
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 100,
        );
        setState(() {
          _imageFileList = pickedFileList;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(File(_imageFileList![index].path)),
              );
            },
            itemCount: _imageFileList!.length,
          ),
          label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      isVideo = false;
      setState(() {
        _imageFile = response.file;
        _imageFileList = response.files;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title!),
      // ),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
          future: retrieveLostData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Text(
                  'You have not yet picked an image.',
                  textAlign: TextAlign.center,
                );
              case ConnectionState.done:
                return _handlePreview();
              default:
                if (snapshot.hasError) {
                  return Text(
                    'Pick image/video error: ${snapshot.error}}',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Text(
                    'You have not yet picked an image.',
                    textAlign: TextAlign.center,
                  );
                }
            }
          },
        )
            : _handlePreview(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                  isMultiImage: true,
                );
              },
              heroTag: 'image1',
              tooltip: 'Pick Multiple Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                try {
                  var map = Map<String, dynamic>();

                  for (var item in _imageFileList!) {
                    print(item.path);
                    File uploadPhtot = File(item.path);
                    var fileContent = uploadPhtot.readAsBytesSync();
                    var fileContentBase64 = base64.encode(fileContent);

                    // 命名圖片上傳的名稱 //未來最好在名稱中加入司機名稱，不然有可能重複。
                    var uploadtime = DateTime.now();
                    // DateFormat formatter = DateFormat('yyyy-MM-dd_HH:mm:ss');
                    // String formatted = formatter.format(uploadtime);

                    map['image'] = fileContentBase64;
                    map['name'] = uploadtime.toString() + ".png";

                    final respones = await http.post(
                        Uri.parse(
                            'http://192.168.31.167:8888/upload_image.php'),
                        body: map);
                    if (200 == respones.statusCode) {
                      print('success');
                    } else {
                      print("error");
                    }
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              heroTag: 'upload',
              tooltip: 'Upload to  a Video',
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}
