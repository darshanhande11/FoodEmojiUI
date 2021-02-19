import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yum_yum/detailPage.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Cheesy Pizza', 4.5, '199', 'assets/pizza.png', '259'),
          _buildListItem('Stuffed Taco', 4.0, '69', 'assets/taco.png', '89'),
        ],
      ),
    );
  }

  _buildListItem(String foodName, double rating, String price, String imgPath,
      String originalPrice) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 210,
              child: Row(
                children: [
                  Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.green[100],
                      ),
                      child: Center(
                        child: Image.asset(
                          imgPath,
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0, fontWeight: FontWeight.w400)),
                      SmoothStarRating(
                          allowHalfRating: true,
                          onRated: (v) {},
                          starCount: rating.toInt(),
                          rating: rating,
                          color: Color(0xFFFFD143),
                          borderColor: Color(0xFFFFD143),
                          size: 15.0,
                          spacing: 0.0),
                      Row(
                        children: <Widget>[
                          Text(
                            '\Rs' + price,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            '\Rs' + '$originalPrice',
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.4))),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              foodName: foodName,
                              imgPath: imgPath,
                              pricePerItem: price,
                              heroTag: foodName,
                            )));
              },
              child: Center(child: Icon(Icons.add, color: Colors.white)),
              backgroundColor: Color(0xFFFE7D6A),
            )
          ],
        ));
  }
}
