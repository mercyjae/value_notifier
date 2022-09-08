import 'package:state_manangement/model.dart';

List<ProductModel> products = List.generate(100, (index) => ProductModel(
    name: "Product ${index + 1}",
    description: "Product ${index + 1} is a very good product",
    id: index + 1,
    amount: 100 * (index + 1),
    productImage: "https://freepikpsd.com/file/2019/10/product-image-png-5-Transparent-Images.png"
));