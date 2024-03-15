class Product {
  final String name;
  final String image;
  final String price;

  Product({required this.name, required this.image, required this.price});

  Map<String, String> toJson() {
    var data = <String, String>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    return data;
  }
}
