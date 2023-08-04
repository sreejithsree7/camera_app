import 'package:camera_app/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? image;
String? imagepath;
ValueNotifier<List> galleryNotifier = ValueNotifier([]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: CircleAvatar(
                radius: 40,
                child: IconButton(
                  onPressed: () => getImage(source: ImageSource.camera),
                  icon: Icon(Icons.camera_alt_outlined),
                  iconSize: 40,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return gallerypage();
            },
          ));
        },
        child: Icon(Icons.image_outlined),
      ),
    );
  }

  getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        imagepath = (image!.path);
        add();
      });
    } else {
      return null;
    }
  }
}
