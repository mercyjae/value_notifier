
class ProductModel {
  ProductModel({
    this.name,
    this.productImage,
    this.id,
    this.description,
    this.amount,});

  ProductModel.fromJson(dynamic json) {
    name = json['name'];
    productImage = json['product_image'];
    id = json['id'];
    description = json['description'];
    amount = json['amount'];
  }
  String? name;
  String? description;
  String? productImage;
  int? amount;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['product_image'] = description;
    map['amount'] = amount;
    map['id'] = id;
    return map;
  }

}