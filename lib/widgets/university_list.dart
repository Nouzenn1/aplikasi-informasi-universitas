import 'package:flutter/material.dart';
import '../models/university.dart';

class UniversityList extends StatelessWidget {
  final List<University> universities;

  UniversityList({required this.universities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: universities.length,
      itemBuilder: (context, index) {
        final university = universities[index];
        return ListTile(
          title: Text(university.name),
          subtitle: Text(university.country),
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
        );
      },
    );
  }
}
