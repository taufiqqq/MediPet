import 'package:flutter/material.dart';

class Disease extends StatelessWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Potential Disease: Cat Ringworm',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center content
          children: [
            // Image
            Image.asset(
              'lib/assets/logo.png',
              width: MediaQuery.of(context).size.width * 0.9,
              // Center the image
              alignment: Alignment.center,
            ),

            SizedBox(height: 16.0),

            // Scientific Name
            Text(
              'Scientific Name: Dermatophytosis',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16.0),

            // Description
            Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Cat Ringworm is a common fungal infection that affects the skin, hair, and sometimes nails of cats.',
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 16.0),

            // Solution Suggestion
            Text(
              'Solution Suggestion:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'If you suspect your cat has ringworm, consult with a veterinarian for proper diagnosis and treatment. '
              'Treatment may include antifungal medications, topical ointments, and, in severe cases, oral medication. '
              'It\'s important to keep the environment clean and isolate the infected cat to prevent the spread of the infection.',
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 16.0),

            // Additional details or recommendations can be added as needed
          ],
        ),
      ),
    );
  }
}
