
class CartItemModel {
  CartItemModel({
    this.id,
    this.productId,
    this.qunatity,});

  CartItemModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    qunatity = json['qunatity'];
  }
  int? id;
  int? productId;
  int? qunatity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['qunatity'] = qunatity;
    return map;
  }

}