import 'package:storeapp/models/rating_model.dart';

class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: num.tryParse(json['id'].toString()),
        title: json['title']?.toString(),
        price: num.tryParse(json['price'].toString()),
        description: json['description']?.toString(),
        category: json['category']?.toString(),
        image: json['image']?.toString(),
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(Map<String, dynamic>.from(json['rating'])),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (title != null) 'title': title,
        if (price != null) 'price': price,
        if (description != null) 'description': description,
        if (category != null) 'category': category,
        if (image != null) 'image': image,
        if (rating != null) 'rating': rating?.toJson(),
      };
}
