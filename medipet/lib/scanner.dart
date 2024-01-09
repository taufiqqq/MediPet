// scanner.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'app_bar.dart';
import 'disease.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  bool isCameraInitialized = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[1], ResolutionPreset.max);

    try {
      await controller.initialize();
      if (mounted) {
        setState(() {
          isCameraInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
      // Handle the error accordingly
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // Dispose the camera controller when leaving the Scanner page
    controller.dispose();
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Reinitialize the camera controller when dependencies change
    if (isCameraInitialized && controller.value.isInitialized) {
      controller.dispose();
      initCamera();
    }
  }

  void navigateToUploadPage() async {
    // Show loading indicator

    // Simulate a loading delay

    // Continue with the actual navigation
    await pickImage();
    print('Navigating to Upload Page!');

    showLoading();
    
    await Future.delayed(Duration(seconds: 2));
    // Hide loading indicator
    hideLoading();

    Navigator.popAndPushNamed(context, '/disease');
  }

  void navigateToScanPage() async {
    // Show loading indicator
    showLoading();

    // Simulate a loading delay
    await Future.delayed(Duration(seconds: 2));

    // Continue with the actual navigation
    print('Navigating to Scan Page!');

    // Hide loading indicator
    hideLoading();

    Navigator.popAndPushNamed(context, '/disease');
  }

  // Function to show the loading indicator
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        // Show the loading dialog
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('MediPet is confurguring...'),
            ],
          ),
        );
      },
    );

    // Automatically close the dialog after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  // Function to hide the loading indicator
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return Container(); // Or show a loading indicator
    }

    return WillPopScope( onWillPop: () async {
        // Dispose the camera controller when leaving the Scanner page
        controller.dispose();
        return true;
      },
      child: Scaffold(
        appBar: SharedAppBar(
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
                  'DISEASE SCANNER',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          context: context,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            // Add a column for optional text
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Optional:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
            
                    SizedBox(height: 10),
            
                    // TextInputField goes here
            
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'A brief description...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
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
                            backgroundColor: const Color(0xFFFF8F00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.45,
                              MediaQuery.of(context).size.width * 0.15,
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
                            backgroundColor: Color(0xFFFF8F00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.45,
                              MediaQuery.of(context).size.width * 0.15,
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
    } else {
      // User canceled the image picking
      print('Image picking canceled.');
    }
  } catch (e) {
    // Handle any errors that might occur during image picking
    print('Error picking image: $e');
  }
}
