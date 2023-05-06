import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/components/header.dart';
import 'package:flutter_application_1/productDetail.dart';

class CategoryPage4 extends StatelessWidget {
  String categoryTitle;
  CategoryPage4(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Masaüstü Bilgisayar",
      "fotograf": "assets/image/macbook (2).png",
      "fiyat": "500"
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
      width: (MediaQuery.of(context).size.width - 60) * 0.5,
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
                "USD $price",
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
