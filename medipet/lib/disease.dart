import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medipet/petcare.dart';

import 'app_bar.dart';

class Disease extends StatelessWidget {
  final List<Map<String, String>> diseases = [
    {
      'name': 'Ringworm',
      'image': 'ringworm.png',
      'summary': 'Cat Ringworm is a common fungal infection that affects the skin, hair, and sometimes nails of cats.',
      'solution': 'If you suspect your cat has ringworm, consult with a veterinarian for proper diagnosis and treatment. '
          'Treatment may include antifungal medications, topical ointments, and, in severe cases, oral medication. '
          'It\'s important to keep the environment clean and isolate the infected cat to prevent the spread of the infection.',
    },
    {
      'name': 'Flea Dermatitis, Allergic Dermatitis',
      'image': 'flea.png',
      'summary': 'Flea Dermatitis and Allergic Dermatitis are conditions caused by an allergic reaction to flea bites.',
      'solution': 'Treatment may involve flea control for both your cat and its environment. Consult with a veterinarian for appropriate flea control measures '
          'and possible use of medications to alleviate allergic reactions. Maintaining a flea-free environment is crucial to managing these conditions.',
    },
    {
      'name': 'Feline Acne',
      'image': 'acne.png',
      'summary': 'Feline Acne is a common skin condition in cats that can result in the formation of blackheads on the chin and lip area.',
      'solution': 'Cleaning the affected area regularly and using cat-friendly acne products can help manage feline acne. Consult with a veterinarian for proper diagnosis '
          'and additional recommendations for preventing and treating feline acne.',
    },
  ];

  final Random _random = Random();

  Map<String, String> getRandomDisease() {
    return diseases[_random.nextInt(diseases.length)];
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> randomDisease = getRandomDisease();

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("PREDICTED DISEASE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  // Image
                  Image.asset(
                    'lib/assets/${randomDisease['image']}',
                    width: MediaQuery.of(context).size.width * 0.9,
                    alignment: Alignment.center,
                  ),

                  SizedBox(height: 16.0),

                  // Scientific Name
                  Text(
                    randomDisease['name'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Summary
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'SUMMARY:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              randomDisease['summary'] ?? '',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Suggested Solution
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'SUGGESTED SOLUTION:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              randomDisease['solution'] ?? '',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Additional details or recommendations can be added as needed
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Suggested PetCare button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Petcare()),
                      );
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
                      'SUGGESTED PETCARE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Download button
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for the Download button
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
                      'DOWNLOAD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
