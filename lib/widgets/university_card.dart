import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/university.dart';

class UniversityCard extends StatelessWidget {
  final University university;

  UniversityCard({required this.university});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: {
              'name': university.name,
              'country': university.country,
              'domains': university.domains,
              'webPages': university.webPages,
              'alphaTwoCode': university.alphaTwoCode,
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Container(
                height: 150.0,
                width: double.infinity,
                color: Colors.teal[100],
                child: Icon(
                  MdiIcons.school, // Gunakan ikon dari material_design_icons_flutter
                  size: 100.0,
                  color: Colors.teal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                university.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                university.country,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                university.domains.join(', '),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
