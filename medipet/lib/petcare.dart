import 'package:flutter/material.dart';
import 'package:medipet/map.dart';

import 'app_bar.dart';

class VetInfo {
  final String name;
  final double rating;
  final String address;
  final String status;

  VetInfo({
    required this.name,
    required this.rating,
    required this.address,
    required this.status,
  });
}

class Petcare extends StatefulWidget {
  const Petcare({Key? key}) : super(key: key);

  @override
  _PetcareState createState() => _PetcareState();
}

class _PetcareState extends State<Petcare> {
  TextEditingController searchController = TextEditingController();
  List<VetInfo> vetList = [
    VetInfo(
        name: 'Vet Partners - Kulai',
        rating: 4.0,
        address: '2919, Jalan Merbau 3, Bandar Putra, 81000 Kulai, Johor',
        status: 'Open'),
    VetInfo(
        name: 'City Pet World',
        rating: 4.2,
        address: '2910, Jalan Merbau 3, Bandar Putra, 81000 Kulai, Johor',
        status: 'Closed, Open at 9am Tomorrow'),
    VetInfo(
        name: 'Klinik Kucing Kulaijaya',
        rating: 4.0,
        address: '3046, Jalan Merbau 3, Bandar Putra, 81000 Kulai, Johor',
        status: 'Closed, Open at 10 Tuesday'),
  ];

  List<VetInfo> filteredVetList = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all vets
    filteredVetList = vetList;
  }

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
                'NEARBY PETCARE',
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    filterVets(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Location...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 200,
                  margin: EdgeInsets.all(15),
                  child: const MapScreen()),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredVetList.length,
                  itemBuilder: (context, index) {
                    VetInfo vet = filteredVetList[index];

                    return Card(
                      elevation: 3.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Container(
                          width: double
                              .infinity, // Allow title to take the full width
                          child: Text(
                            vet.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.0),
                            Text('Rating: ${vet.rating}'),
                            SizedBox(height: 4.0),
                            Text('${vet.status}'),
                            SizedBox(height: 4.0),
                            Container(
                              width: double
                                  .infinity, // Allow address to take the full width
                              child: Text(vet.address),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterVets(String query) {
    setState(() {
      filteredVetList = vetList.where((vet) {
        return vet.name.toLowerCase().contains(query.toLowerCase()) ||
            vet.address.toLowerCase().contains(query.toLowerCase()) ||
            vet.status.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}
