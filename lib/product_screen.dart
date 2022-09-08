import 'package:flutter/material.dart';
import 'package:state_manangement/cart_model.dart';
import 'package:state_manangement/cart_provider.dart';
import 'package:state_manangement/cart_screen.dart';
import 'package:state_manangement/data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<CartItemModel> cartItems = [];
    late CartItemNotifier cartItemNotifier;
  @override
  void initState() {
    cartItemNotifier = CartItemNotifier([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartItemScreen(
                    cartItemNotifier: cartItemNotifier,
                    cartItems: cartItems,
                    onDelete: () => cartItemNotifier.removeFromCart(cartItems),
                  ),
                ));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ValueListenableBuilder(
                    builder: (context, value, child) {
                      return Text(
                        "Cart Items: ${cartItemNotifier.cartItems.length}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      );
                    },
                    valueListenable: cartItemNotifier,
                  )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = products[index];
            return Column(
              children: [
                Image.network(
                  product.productImage!,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(product.name!),
                const SizedBox(
                  height: 5,
                ),
                Text("${product.amount!}"),
                const SizedBox(
                  height: 5,
                ),
                 ValueListenableBuilder(
                   builder: (context, value, child) {
                     return TextButton(
                            onPressed: () {
                              if(cartItemNotifier.isInCart(product.id!)){
                                cartItemNotifier.removeFromCart(product.id!);
                              }else{
                                 cartItemNotifier.addToCart(CartItemModel(
                                  id: 1, productId: product.id!, qunatity: 1));
                              }
                            },
                            child:
                             Text(cartItemNotifier.isInCart(product.id!)
                              ? 'Remove From Cart' : 'Add To Cart',
                              style: 
                              TextStyle(color:cartItemNotifier.isInCart(product.id!)
                               ? Colors.red: Colors.blue ,)));
                             
                   }, valueListenable: cartItemNotifier,
                 ),
              ],
            );
          },
        ),
      ),
    );
  }
}
