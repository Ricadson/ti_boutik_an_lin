class Produit {
  var id;
  final String? title;
  // ignore: prefer_typing_uninitialized_variables
  var price;
  final String? description;
  final String? category;
  final String? image;
  var rating;

  Produit({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  Produit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] as String?,
        price = json['price'],
        description = json['description'] as String?,
        category = json['category'] as String?,
        image = json['image'] as String?,
        rating = (json['rating'] as Map<String, dynamic>?) != null
            ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson()
      };
}

class Rating {
  var rate;
  var count;

  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : rate = json['rate'],
        count = json['count'];

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
