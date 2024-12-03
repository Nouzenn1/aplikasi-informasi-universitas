import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/beranda_page.dart';
import 'pages/detail_page.dart';
import 'pages/country_page.dart';

void main() => runApp(const UniversityApp());

class UniversityApp extends StatelessWidget {
  const UniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const BerandaPage(),
        '/country': (context) {
          final String country = ModalRoute.of(context)!.settings.arguments as String;
          return CountryPage(country: country);
        },
        '/detail': (context) {
          final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return DetailPage(
            name: args['name'] ?? 'Unknown University',
            country: args['country'] ?? 'Unknown Country',
            domains: (args['domains'] as List<dynamic>).cast<String>(),
            webPages: (args['webPages'] as List<dynamic>).cast<String>(),
            alphaTwoCode: args['alphaTwoCode'] ?? 'XX',
            imageUrl: args['imageUrl'] ?? 'https://via.placeholder.com/150',
          );
        },
      },
    );
  }
}
