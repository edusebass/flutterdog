class Breed {
  final String name;
  final String imageUrl;
  final String temperament;

  Breed(
      {required this.name, required this.imageUrl, required this.temperament});

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'],
      imageUrl: json['image']['url'],
      temperament: json['temperament'] ?? 'No information',
    );
  }
}
