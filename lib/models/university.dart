class University {
  final String name;
  final String country;
  final List<String> domains;
  final List<String> webPages;
  final String alphaTwoCode;
  String? imageUrl;

  University({
    required this.name,
    required this.country,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    this.imageUrl,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      domains: List<String>.from(json['domains'] ?? []),
      webPages: List<String>.from(json['web_pages'] ?? []),
      alphaTwoCode: json['alpha_two_code'] ?? '',
      imageUrl: json['image_url'] ?? 'https://via.placeholder.com/150',
    );
  }
}
