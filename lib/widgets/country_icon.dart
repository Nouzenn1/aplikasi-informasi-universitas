import 'package:flutter/material.dart';

class CountryIcon extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback onTap;

  CountryIcon({required this.iconData, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Icon(iconData, size: 50.0, color: Colors.lightBlue),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
