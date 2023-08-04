import 'dart:io';

import 'package:camera_app/gallery_page.dart';
import 'package:camera_app/home_page.dart';
import 'package:flutter/material.dart';

class Viewimage extends StatelessWidget {
  Viewimage({super.key, required this.imgIndex});
  int imgIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure ?'),
                    content: Text('This will delete the image.'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      ElevatedButton(
                          onPressed: () {
                            delete(imgIndex);
                            Navigator.of(context).pop();

                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'))
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                  ),
                );
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: Image.file(File(galleryNotifier.value[imgIndex])),
      ),
    );
  }
}
