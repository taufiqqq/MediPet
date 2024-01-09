// home.dart
// home.dart
import 'package:flutter/material.dart';
import 'package:medipet/chat.dart';
import 'app_bar.dart';
import 'petcare.dart';
import 'scanner.dart';
import 'disease.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'MEDIPET',
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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo.png',
                height: 150, // Adjust the height as needed
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for navigation to disease page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF8F00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.45,
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                child: Text(
                  'DISEASE SCANNER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for navigation to scanner page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF8F00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.45,
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                child: Text(
                  'CHAT PAWPAL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Petcare()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF8F00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.45,
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                child: Text(
                  'NEARBY PETCARE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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