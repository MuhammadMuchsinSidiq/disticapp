import 'package:disticapp/models/cart_model.dart';
import 'package:disticapp/models/tiket_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(TiketModel tiket) {
    if (tiketExist(tiket)) {
      int index = _carts.indexWhere((element) => element.tiket!.id == tiket.id);
      _carts[index].quantity! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          tiket: tiket,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity! - 1;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var tiket in _carts) {
      total += tiket.quantity!;
    }
    return total;
  }

  totalHarga() {
    double total = 0;
    for (var tiket in carts) {
      total += (tiket.quantity! * tiket.tiket!.harga!);
    }
    return total;
  }

  tiketExist(TiketModel tiket) {
    if (_carts.indexWhere((element) => element.tiket!.id == tiket.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
