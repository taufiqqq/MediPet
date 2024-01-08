import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'disease.dart';


late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToUploadPage() async{
    // Placeholder for navigation to upload page
    await pickImage();
    print('Navigating to Upload Page!');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Disease()),
    );
    // Implement navigation logic here
  }

  void navigateToScanPage() {
    // Placeholder for navigation to scan page
    print('Navigating to Scan Page!');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Disease()),
    );
    // Implement navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'lib/assets/logo.png',
                height: kToolbarHeight - 8,
              ),
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'MEDIPET',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                // Placeholder for menu functionality
                print('Menu Pressed!');
              },
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CameraPreview(controller),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom:30.0),
                child: Align(
                  
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Upload button
                      ElevatedButton(
                        onPressed: () {
                          navigateToUploadPage();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF8F00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.45, // Adjust the width as needed
                            MediaQuery.of(context).size.width * 0.15, // Adjust the height as needed
                          ),
                        ),
                        child: Text(
                          'UPLOAD',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Scan button
                      ElevatedButton(
                        onPressed: () {
                          navigateToScanPage();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF8F00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.45, // Adjust the width as needed
                            MediaQuery.of(context).size.width * 0.15, // Adjust the height as needed
                          ),
                        ),
                        child: Text(
                          'SCAN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> pickImage() async {
  final picker = ImagePicker();
  try {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // User has picked an image
      // You can handle the image file here
      print('Image picked: ${pickedFile.path}');

      // Placeholder for handling the picked image
      // For example, you can display the picked image in an ImageView or upload it
      // to a server, etc.

    } else {
      // User canceled the image picking
      print('Image picking canceled.');
    }
  } catch (e) {
    // Handle any errors that might occur during image picking
    print('Error picking image: $e');
  }
}
