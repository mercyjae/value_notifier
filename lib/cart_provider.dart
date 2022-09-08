
import 'package:flutter/cupertino.dart';
import 'package:state_manangement/cart_model.dart';

class CartItemNotifier extends ValueNotifier {

  CartItemNotifier(super.value);
 List<CartItemModel> _cartItems = [];
 

  List<CartItemModel> get cartItems => _cartItems;


  void addToCart(CartItemModel cart) {
    _cartItems = [..._cartItems, cart];
    notifyListeners();
    
  }

  void removeFromCart(id) {
    _cartItems = _cartItems.where((element) => element.productId != id).toList();
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _cartItems.where((cartItem) => cartItem.productId == productId).isNotEmpty;
  }

}