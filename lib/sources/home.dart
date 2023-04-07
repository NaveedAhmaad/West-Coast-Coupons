import 'package:flutter/material.dart';
import 'coupons_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    'Accessories',
    'Entertainment and Arts',
    'Financial Services',
    'Hair and Beauty',
    'Electronics',
    'Home Services',
    'Amazon',
    'Home and Garden',
    'Motoring',
    'Baby and Toddler',
    'Fitness and Health',
  ];

  List<ImageProvider> icons = [
    AssetImage("assets/accessories_icon.png"),
    AssetImage("assets/entertainment_and_arts_icon.png"),
    AssetImage("assets/financial_services_icon.png"),
    AssetImage("assets/hair_and_beauty_icon.png"),
    AssetImage("assets/electronics_icon.png"),
    AssetImage("assets/home_services_icon.png"),
    AssetImage("assets/amazon_icon.png"),
    AssetImage("assets/home_and_garden_icon.png"),
    AssetImage("assets/motoring_icon.png"),
    AssetImage("assets/baby_and_toddler_icon.png"),
    AssetImage("assets/fitness_and_health_icon.png")
  ];

  late String couponName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.55,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image(
                      image: AssetImage("assets/explore_background_top.png"),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 70),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bitter',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 120),
                    child: Text(
                      "Latest deals and discounts",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'san-serif'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 170, 10, 0),
                    child: Image(
                      image: AssetImage("assets/explore_banner.png"),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 435),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bitter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff000000),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            items[index],
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'san-serif'),
                          ),
                          leading: Image(
                            image: icons[index],
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return CouponList(myCoupon: couponName,);
                                },
                              ),
                            );
                            if (index == 0) {
                              couponName = 'Accessories';
                            } else if (index == 1) {
                              couponName = 'Entertainment and Arts';
                            } else if (index == 2) {
                              couponName = 'Financial Services';
                            } else if (index == 3) {
                              couponName = 'Hair and Beauty';
                            } else if (index == 4) {
                              couponName = 'Electronics';
                            } else if (index == 5) {
                              couponName = 'Home Services';
                            } else if (index == 6) {
                              couponName = 'Amazon';
                            } else if (index == 7) {
                              couponName = 'Home and Garden';
                            } else if (index == 8) {
                              couponName = 'Motoring';
                            } else if (index == 9) {
                              couponName = 'Baby and Toddler';
                            } else if (index == 10) {
                              couponName = 'Fitness and Health';
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
