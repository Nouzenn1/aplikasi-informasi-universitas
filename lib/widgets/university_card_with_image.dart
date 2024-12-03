import 'package:flutter/material.dart';
import '../models/university.dart';

class UniversityCardWithImage extends StatelessWidget {
  final University university;

  UniversityCardWithImage({required this.university});

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
              'imageUrl': university.imageUrl ?? 'https://via.placeholder.com/150', // Provide a default value
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
              child: Image.network(
                university.imageUrl ?? 'https://via.placeholder.com/150', // Provide a default value
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.broken_image, size: 50.0));
                },
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
