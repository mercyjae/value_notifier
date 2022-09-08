
import 'package:flutter/material.dart';
import 'package:state_manangement/cart_model.dart';
import 'package:state_manangement/cart_provider.dart';
import 'package:state_manangement/data.dart';

class CartItemScreen extends StatefulWidget {
  const CartItemScreen({Key? key, required this.cartItems, 
  required this.onDelete, required this.cartItemNotifier
  }) : super(key: key);

  final List<CartItemModel> cartItems;
  final Function onDelete;
  final CartItemNotifier cartItemNotifier;

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
 late  CartItemNotifier cartItemNotifier;
  @override
  void initState() {
    cartItemNotifier = widget.cartItemNotifier;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: ValueListenableBuilder(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: cartItemNotifier.cartItems.length,
            itemBuilder: (context, index) {
            final product = products[index];
              return ListTile(
                leading: Image.network(product.productImage!),
                title: Text(product.name!),
                subtitle: Text("${product.amount!}"),
                trailing: InkWell(
                   onTap: () => cartItemNotifier.removeFromCart(product.id),
                    child: const Icon(Icons.delete,color: Colors.red,)
                    ),
              );
            },
          );
        }, valueListenable: cartItemNotifier,
      ),
    );
  }
}
