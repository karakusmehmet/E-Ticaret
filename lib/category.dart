import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/components/header.dart';
import 'package:flutter_application_1/productDetail.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Iphone 14 Pro Max",
      "fotograf": "assets/iphone1.png",
      "fiyat": "54.000.00 TL"
    },
    {
      "isim": "iPhone 14",
      "fotograf": "assets/iphone2.png",
      "fiyat": "30.999.00 TL"
    },
    {
      "isim": "iPhone 13 Pro Max",
      "fotograf": "assets/iphone3.png",
      "fiyat": "44.799.00 TL"
    },
    {
      "isim": "iPhone 13 Mini ",
      "fotograf": "assets/iphone4.png",
      "fiyat": "27.199.00 TL"
    },
    {
      "isim": "iPhone 12 Pro Max",
      "fotograf": "assets/iphone5.png",
      "fiyat": "30.999.00 TL"
    },
    {
      "isim": "iPhone 12 Mini",
      "fotograf": "assets/iphone6.png",
      "fiyat": "18.489.99 TL"
    },
    {
      "isim": "Aoc Curved 34'1 ms Monitor",
      "fotograf": "assets/monitör1.png",
      "fiyat": "7.910.45 TL"
    },
    {
      "isim": "Gigabyte 1ms 165hz Monitor",
      "fotograf": "assets/monitor2.png",
      "fiyat": "17.931.08 TL"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          header(categoryTitle, context),
          SizedBox(
            height: 32,
          ),

          //icerikler
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContent(product["isim"], product["fotograf"],
                    product["fiyat"], context);
              }).toList(),
            ),
          )
        ]),
      ),

      //bottom navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(photoUrl),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "TL $price",
                style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
