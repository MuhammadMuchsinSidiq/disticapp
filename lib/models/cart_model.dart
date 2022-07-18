import 'package:disticapp/models/tiket_model.dart';

class CartModel {
  int? id;
  TiketModel? tiket;
  int? quantity;

  CartModel({
    this.id,
    this.tiket,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tiket = TiketModel.fromJson(json['tiket']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tiket': tiket!.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalHarga() {
    return tiket!.harga! * quantity!;
  }
}
