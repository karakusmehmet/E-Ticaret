import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/category1.dart';
import 'package:flutter_application_1/category2.dart';
import 'package:flutter_application_1/category3.dart';
import 'package:flutter_application_1/category4.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/components/header.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Bütün Ürünler",
    "Akilli Telefonlar",
    "Monitörler",
    "Akıllı Saatler",
    "kulaklıklar",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            header("Kategoriler", context),
            SizedBox(
              height: 16,
            ),
            //Kategoriler
            Expanded(
              child: ListView(
                  children: categories
                      .map((String title) => buildCategory(title, context))
                      .toList()),
            ),
          ],
        ),
      ),

      //Bottom Navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: () {
      if (title == "Bütün Ürünler") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage(title);
        }));
      }
      if (title == "Akilli Telefonlar") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage1(title);
        }));
      }
      if (title == "Monitörler") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage2(title);
        }));
      }
      if (title == "Aklıllı Saatler") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage3(title);
        }));
      }
      if (title == "Kulaklıklar") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage4(title);
        }));
      }
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034)),
      ),
    ),
  );
}
