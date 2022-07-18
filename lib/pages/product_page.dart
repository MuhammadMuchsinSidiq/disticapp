import 'package:carousel_slider/carousel_slider.dart';
import 'package:disticapp/models/tiket_model.dart';
import 'package:disticapp/provider/cart_provider.dart';
import 'package:disticapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final TiketModel tiket;
  ProductPage(this.tiket);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/buswerkudara2.png',
    'assets/buswerkudara2.png',
    'assets/buswerkudara2.png'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Icon_ceklist.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Hore :)",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Item Sukses Ditambahkan",
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 155,
                    height: 45,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart-page');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: widget.tiket.galeri_tiket!
                .map(
                  (image) => Image.asset(
                    image.url_iamges.toString(),
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.tiket.galeri_tiket!.map(
              (e) {
                index++;
                return indicator(index);
              },
            ).toList(),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 17,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              24,
            ),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tiket.nama_tiket.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          widget.tiket.items!.nama_kategori.toString(),
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/button_love.png',
                    width: 40,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: defaultMargin,
                right: defaultMargin,
                left: defaultMargin,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: backgroundColor2,
              ),
              padding: EdgeInsets.all(
                16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: primaryTextStyle,
                  ),
                  Text(
                    widget.tiket.harga.toString(),
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.tiket.deskripsi.toString(),
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // //BUTTON
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(
            //     left: defaultMargin,
            //     right: defaultMargin,
            //     bottom: 60,
            //   ),
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.pushNamed(context, '/detail-chat');
            //         },
            //         child: Container(
            //           width: 54,
            //           height: 54,
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: AssetImage('assets/button_chat.png'),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       Expanded(
            //         child: Container(
            //           height: 54,
            //           child: TextButton(
            //             onPressed: () {
            //               showSuccessDialog();
            //             },
            //             style: TextButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               backgroundColor: primaryColor,
            //             ),
            //             child: Text(
            //               'Checkout',
            //               style: primaryTextStyle.copyWith(
            //                 fontSize: 16,
            //                 fontWeight: semiBold,
            //               ),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor1,
        ),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 60,
            top: 50,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-chat');
                },
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/button_chat.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  height: 54,
                  child: TextButton(
                    onPressed: () {
                      cartProvider.addCart(widget.tiket);
                      showSuccessDialog();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor5,
      body: ListView(
        children: [
          header(),
          content(),
          // footer(),
        ],
      ),
      bottomNavigationBar: footer(),
    );
  }
}
