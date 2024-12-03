import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String country;
  final List<String> domains;
  final List<String> webPages;
  final String alphaTwoCode;
  final String imageUrl;

  DetailPage({
    required this.name,
    required this.country,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.0,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text('Gambar gagal dimuat', style: TextStyle(color: Colors.red)),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nama: $name',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Negara: $country',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Domain:',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  ...domains.map((domain) => Text(domain, style: TextStyle(fontSize: 16.0))),
                  SizedBox(height: 8.0),
                  Text(
                    'Halaman Web:',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  ...webPages.map((webPage) => Text(webPage, style: TextStyle(fontSize: 16.0, color: Colors.blue))),
                  SizedBox(height: 8.0),
                  Text(
                    'Alpha Two Code:',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(alphaTwoCode, style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
