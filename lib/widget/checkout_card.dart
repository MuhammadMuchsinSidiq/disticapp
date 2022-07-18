import 'package:disticapp/models/cart_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage(
                      cart.tiket!.galeri_tiket![0].url_iamges.toString(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.tiket!.nama_tiket.toString(),
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Rp. ${cart.tiket!.harga}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${cart.quantity} Items',
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
