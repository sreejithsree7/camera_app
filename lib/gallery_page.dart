import 'dart:io';

import 'package:camera_app/home_page.dart';
import 'package:camera_app/view_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class gallerypage extends StatefulWidget {
  const gallerypage({super.key});

  @override
  State<gallerypage> createState() => _gallerypageState();
}

class _gallerypageState extends State<gallerypage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ValueListenableBuilder(
          valueListenable: galleryNotifier,
          builder: (context, value, child) => GridView.builder(
            itemCount: galleryNotifier.value.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Viewimage(imgIndex: index);
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  child: Image.file(
                    File(value[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

add() async {
  final imageDB = await Hive.openBox('image');
  imageDB.add(imagepath);
  await getAllImages();
}

delete(int index) async {
  final imageDB = await Hive.openBox('image');
  imageDB.deleteAt(index);
  await getAllImages();
}

getAllImages() async {
  final imageDB = await Hive.openBox('image');
  galleryNotifier.value.clear();
  galleryNotifier.value.addAll(imageDB.values);
  galleryNotifier.notifyListeners();
}
