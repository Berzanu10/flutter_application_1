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
      "title": "iPhone 15 Pro",
      "description": "The iPhone 15 Pro is the first iPhone to feature an aerospace-grade titanium design, making it lighter and more durable than ever before.",
      "price": 999.0,
      "imageUrl": "https://wantapi.com/assets/images/iphone.png",
      "specifications": ["A17 Pro", "Titanium", "48MP Main"]
    },
    {
      "id": 2,
      "title": "iPhone 15",
      "description": "The iPhone 15 features a stunning new design with color-infused back glass and a contoured aerospace-grade aluminum enclosure.",
      "price": 799.0,
      "imageUrl": "https://wantapi.com/assets/images/iphone_pink.png",
      "specifications": ["A16 Bionic", "Aluminum", "48MP Main"]
    },
    {
      "id": 7,
      "title": "MacBook Pro 14\"",
      "description": "The MacBook Pro 14-inch is pro to the max, featuring the M3 Pro chip for serious workflow power and efficiency.",
      "price": 1599.0,
      "imageUrl": "https://wantapi.com/assets/images/macbook_silver.png",
      "specifications": ["M3 Pro", "14.2\" Display", "HDMI, SDXC"]
    },
    {
      "id": 12,
      "title": "iPad Air",
      "description": "The iPad Air combines serious performance with a thin and light design, making it a versatile tool for creativity.",
      "price": 599.0,
      "imageUrl": "https://wantapi.com/assets/images/ipad_air.png",
      "specifications": ["M1 Chip", "10.9\" Display", "5G Connectivity"]
    },
    {
      "id": 16,
      "title": "Apple Vision Pro",
      "description": "Apple Vision Pro is a revolutionary spatial computer that seamlessly blends digital content with your physical world.",
      "price": 3499.0,
      "imageUrl": "https://wantapi.com/assets/images/vision_pro.png",
      "specifications": ["visionOS", "Micro-OLED", "Eyes, hands, voice control"]
    },
    {
      "id": 17,
      "title": "AirPods Pro (2nd Gen)",
      "description": "The AirPods Pro (2nd Generation) feature the new H2 chip, delivering smarter noise cancellation and superior sound.",
      "price": 249.0,
      "imageUrl": "https://wantapi.com/assets/images/airpods.png",
      "specifications": ["H2 Chip", "Spatial Audio", "USB-C Case"]
    },
    {
      "id": 18,
      "title": "AirPods Max",
      "description": "AirPods Max reimagine over-ear headphones with an Apple-designed dynamic driver that provides high-fidelity audio.",
      "price": 549.0,
      "imageUrl": "https://wantapi.com/assets/images/airpods_max.png",
      "specifications": ["Dynamic Driver", "Active Noise Cancellation", "Mesh Canopy"]
    },
    {
      "id": 20,
      "title": "HomePod Mini",
      "description": "The HomePod Mini is jam-packed with innovation, delivering unexpectedly big sound for a speaker of its size.",
      "price": 99.0,
      "imageUrl": "https://wantapi.com/assets/images/homepod_mini.png",
      "specifications": ["3.3 inches tall", "360-degree audio", "5 colors available"]
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
