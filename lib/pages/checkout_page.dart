import 'package:disticapp/models/user_model.dart';
import 'package:disticapp/provider/auth_provider.dart';
import 'package:disticapp/provider/cart_provider.dart';
import 'package:disticapp/widget/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Detail Pesanan'),
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'List Items',
                  style: tripleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),

                // Container Data Penumpang
                Container(
                  width: double.infinity,
                  height: 190,
                  padding: EdgeInsets.all(
                    20,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: backgroundColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Penumpang',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              right: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'No. Hp',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Tgl Berangkat',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Pukul',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ': ${user.name}',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ': ${user.phone_number}',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ': 10 November 2022',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ': Pukul 12.00',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //Container Pembayaran
                Container(
                  width: double.infinity,
                  height: 180,
                  padding: EdgeInsets.all(
                    20,
                  ),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: backgroundColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pembayaran',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah TIket',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${cartProvider.totalItems()} Items',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Rp. 20.000',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: subTitleColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          ),
                          Text(
                            'Rp. ${cartProvider.totalHarga()}',
                            style: priceTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget customButtonNav() {
      return Container(
        width: 315,
        height: 50,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/checkout-success', (route) => false);
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BAYAR SEKARANG',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor4,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customButtonNav(),
    );
  }
}
