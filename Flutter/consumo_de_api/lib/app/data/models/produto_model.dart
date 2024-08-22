// Criamos nossa classe model com as informações da Api
class ProdutoModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  // Criamos o nosso construtor com campos nomeados
  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  // Criamos um construtor nomeado chamado from map
  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'],
      description: map['description'],
      price: map['price'] * 1.0,
      rating: map['rating'] * 1.0,
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from((map['images'] as List)),
    );
  }
}
