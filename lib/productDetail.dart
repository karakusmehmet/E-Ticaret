import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/components/label.dart';

import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;
  int? selectedCapacity;

  List<Color> colors = [
    Color(0xFF0A1034),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> capacities = [64, 256, 512];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //header
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    //Urun Image
                    Center(child: Image.asset("asset/iphone3.png")),

                    SizedBox(
                      height: 30,
                    ),

                    //Renk Secenekleri

                    Text(
                      "Renk",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034)),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => colorOption(
                                color: color,
                                selected: selectedColor == color,
                                onTab: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                }))
                            .toList()),
                    //Kapasite Secenekleri
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Kapasite",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: capacities
                            .map((int number) => capacityOption(
                                capacity: number,
                                selected: selectedCapacity == number,
                                onTap: () {
                                  setState(() {
                                    selectedCapacity = number;
                                  });
                                }))
                            .toList()),
                    SizedBox(
                      height: 32,
                    ),
                    //SEPETE EKLE BUTONU
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF1F53E4),
                      ),
                      child: Text(
                        "Sepete Ekle",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
      bottomNavigationBar("search"),
    ])));
  }
}

Widget colorOption(
    {required Color color, required bool selected, required Function onTab}) {
  return GestureDetector(
    onTap: onTab(),
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFF0001FC), width: selected ? 5 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(
    {required int capacity, required bool selected, required Function onTap}) {
  return GestureDetector(
    onTap: onTap(),
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$capacity gb",
        style: TextStyle(
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
