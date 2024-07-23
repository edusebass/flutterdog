class Breed {
  final String name;
  final String temperament;
  final String imageUrl;

  Breed(
      {required this.name, required this.temperament, required this.imageUrl});

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'] as String? ?? 'Unknown',
      temperament: json['temperament'] as String? ?? 'Unknown',
      imageUrl: json['image'] as String? ??
          '', // Assuming 'image' is the key for the URL
    );
  }
}
