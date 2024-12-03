import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/university.dart';
import '../widgets/university_card.dart';

class CountryPage extends StatefulWidget {
  final String country;

  const CountryPage({super.key, required this.country});

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<University> universities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  Future<void> fetchUniversities() async {
    try {
      List<University> universities = await ApiService.fetchUniversities(widget.country);
      setState(() {
        this.universities = universities;
        isLoading = false;
      });
    } catch (e) {
      print('Gagal memuat data universitas: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.country}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : universities.isNotEmpty
              ? ListView.builder(
                  itemCount: universities.length,
                  itemBuilder: (context, index) {
                    final university = universities[index];
                    return UniversityCard(university: university);
                  },
                )
              : const Center(child: Text('Tidak ada data universitas yang ditemukan.')),
    );
  }
}
