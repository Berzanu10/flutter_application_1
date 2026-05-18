import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List<dynamic> specifications;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.specifications,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      specifications: List<dynamic>.from(json['specifications'] as List),
    );
  }
}

const String mockProductJson = r'''
{
  "products": [
    {
      "id": 1,
      "title": "AirPods Pro (2nd Gen)",
      "description": "Active noise cancellation, adaptive transparency and superior sound quality for an immersive listening experience.",
      "price": 249.0,
      "imageUrl": "https://wantapi.com/assets/banner.png",
      "specifications": [
        "Active Noise Cancellation",
        "Adaptive Transparency",
        "MagSafe charging case",
        "Up to 6 hours of listening time"
      ]
    },
    {
      "id": 2,
      "title": "AirPods Max",
      "description": "High-fidelity audio with computational audio, spatial audio and an elegant over-ear design for rich, detailed sound.",
      "price": 549.0,
      "imageUrl": "https://wantapi.com/assets/banner.png",
      "specifications": [
        "Active Noise Cancellation",
        "Spatial audio with dynamic head tracking",
        "Memory foam ear cushions",
        "Up to 20 hours of listening time"
      ]
    },
    {
      "id": 3,
      "title": "HomePod",
      "description": "A powerful smart speaker with high-fidelity sound, intelligent Siri assistance, and room-sensing audio tuning.",
      "price": 299.0,
      "imageUrl": "https://wantapi.com/assets/banner.png",
      "specifications": [
        "High-excursion woofer",
        "Five-tweetter array",
        "Spatial awareness",
        "Siri voice control"
      ]
    },
    {
      "id": 4,
      "title": "HomePod Mini",
      "description": "Compact smart speaker with 360-degree sound, Siri intelligence, and seamless integration with your Apple devices.",
      "price": 99.0,
      "imageUrl": "https://wantapi.com/assets/banner.png",
      "specifications": [
        "360-degree audio",
        "Intercom support",
        "Voice-activated Siri",
        "Thread-enabled smart home control"
      ]
    }
  ]
}
''';

List<Product> getMockProducts() {
  final Map<String, dynamic> parsedJson =
      json.decode(mockProductJson) as Map<String, dynamic>;
  final List<dynamic> items = parsedJson['products'] as List<dynamic>;

  return items
      .map((item) => Product.fromJson(item as Map<String, dynamic>))
      .toList();
}
