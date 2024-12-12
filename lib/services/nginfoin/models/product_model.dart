class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  int? stock;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: double.tryParse(json["price"]),
        stock: int.tryParse(json["stock"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
      };

  @override
  String toString() {
    return "str_produk : (id: $id, name: $name, description: $description, price: $price)";
  }
}
