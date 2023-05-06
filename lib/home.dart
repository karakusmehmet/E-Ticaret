import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/components/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //BASLIK
                  buildBaslik(),

                  // BANNER
                  buildBanner(),

                  // BUTONLAR
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //İLK ELEMAN
                        buildNavigetion(
                            text: "Kategoriler",
                            icon: Icons.menu,
                            widget: CategoriesPage(),
                            context: context),
                        buildNavigetion(
                            text: "Favoriler",
                            icon: Icons.star_border,
                            widget: CategoriesPage(),
                            context: context),
                        buildNavigetion(
                            text: "Hediyeler",
                            icon: Icons.card_giftcard,
                            widget: CategoriesPage(),
                            context: context),
                        buildNavigetion(
                            text: "En iyi Satislar",
                            icon: Icons.people,
                            widget: CategoriesPage(),
                            context: context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //SALES TİTTLE
                  Text(
                    "Ürünler",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //SALES İTEMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Akilli Telefonlar",
                        photoUrl: "assets/1.png",
                        discount: "-30%",
                        screenwidth: screenwidth,
                      ),
                      buildSalesItem(
                        text: "Monitörler",
                        photoUrl: "assets/3.png",
                        discount: "-20%",
                        screenwidth: screenwidth,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "assets/1.png",
                        discount: "-50%",
                        screenwidth: screenwidth,
                      ),
                      buildSalesItem(
                        text: "Smartphones",
                        photoUrl: "assets/8.1.png",
                        discount: "-10%",
                        screenwidth: screenwidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //BUTTOM NAVİGATİON BAR
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 24.0,
    ),
    child: Text(
      "Home",
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0XFF0001FC), borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Surface Laptop 3 ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "USD 279",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset("assets/1.png"),
        ],
      ),
    ),
  );
}

// BURAYA KESİN GELİNİCEK!!!!
Widget buildNavigetion({
  required String text,
  required IconData icon,
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0ECF8),
          ),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildSalesItem({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenwidth,
}) {
  return Container(
    width: (screenwidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        SizedBox(
          height: 22,
        ),
        Center(child: Image.asset(photoUrl)),
        SizedBox(
          height: 22,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
