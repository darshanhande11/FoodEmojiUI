import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yum_yum/detailPage.dart';
import 'package:yum_yum/foodTabs.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  _buildListItem(String foodName, String locationOfImage, String prize,
      Color backgroundColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        foodName: foodName,
                        imgPath: locationOfImage,
                        pricePerItem: prize,
                        heroTag: foodName,
                      )));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Image.asset(
                    locationOfImage,
                    height: 50,
                    width: 50,
                  )),
                ),
              ),
              SizedBox(height: 25),
              Text(foodName,
                  style: GoogleFonts.notoSans(
                    fontSize: 17,
                    color: textColor,
                  )),
              Text('\Rs.' + prize,
                  style: GoogleFonts.notoSans(
                    fontSize: 17,
                    color: textColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                    color: Colors.purple[200],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'SEARCH FOR',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'RECIPES',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(
                      fontSize: 14.0,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildListItem('Fries', 'assets/fries.png', '99',
                      Colors.pink[100], Colors.deepPurple),
                  _buildListItem('Pizza', 'assets/pizza.png', '199',
                      Colors.green[100], Colors.red),
                  _buildListItem('Doughnut', 'assets/doughnut.png', '79',
                      Colors.yellow[100], Colors.orange[700]),
                  _buildListItem('HotDog', 'assets/hotdog.png', '69',
                      Colors.orange[100], Colors.orange),
                  _buildListItem('Popcorn', 'assets/popcorn.png', '49',
                      Colors.yellow[50], Colors.orange[700]),
                  _buildListItem('Sandwich', 'assets/sandwich.png', '59',
                      Colors.green[50], Colors.green),
                  _buildListItem('Taco', 'assets/taco.png', '69',
                      Colors.brown[50], Colors.brown),
                  _buildListItem('Cheese', 'assets/cheese.png', '59',
                      Colors.yellow[50], Colors.yellow[800]),
                ],
              )),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVOURITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              ))
        ],
      ),
    );
  }
}
