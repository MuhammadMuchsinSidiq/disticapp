import 'package:disticapp/models/tiket_model.dart';
import 'package:disticapp/pages/product_page.dart';
import 'package:disticapp/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProductTile extends StatelessWidget {
  final TiketModel tiket;
  ProductTile(this.tiket);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(tiket),
          ),
        );
      },
      child: Container(
        // color: backgroundColor5,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                tiket.galeri_tiket![0].url_iamges.toString(),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                    'Destinasi 1',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    tiket.nama_tiket.toString(),
                    style: tripleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
