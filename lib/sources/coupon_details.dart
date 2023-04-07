import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:west_coast_coupons/sources/colors.dart';

class CouponDetails extends StatefulWidget {
  @override
  State<CouponDetails> createState() => _CouponDetailsState();
}

class _CouponDetailsState extends State<CouponDetails> {
  //declaring the all properties to store the fetched data for app usage
  //declaring as per app requirements

  String? selectedStoreName,
      selectedCouponName,
      selectedCouponDetail,
      selectedExpiryDate,
      selectedCouponType,
      selectedStoreDetail,
      selectedStoreUrl,
      selectedStoreAddress,
      selectedStorePhone;
  late String selectedStoreImage;

  //getting data from other screen to use accordingly
  getCouponDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    selectedStoreName = sharedPreferences.getString('selectedStoreName')!;
    selectedCouponName = sharedPreferences.getString('selectedCouponName')!;
    selectedCouponDetail = sharedPreferences.getString('selectedCouponDetail')!;
    selectedExpiryDate = sharedPreferences.getString('selectedExpiryDate')!;
    selectedCouponType = sharedPreferences.getString('selectedCouponType')!;
    selectedStoreDetail = sharedPreferences.getString('selectedStoreDetail')!;
    selectedStoreUrl = sharedPreferences.getString('selectedStoreUrl')!;
    selectedStoreImage = sharedPreferences.getString('selectedStoreImage')!;
    selectedStoreAddress = sharedPreferences.getString('selectedStoreAddress')!;
    selectedStorePhone = sharedPreferences.getString('selectedStorePhone')!;

    setState(() {});
  }

  //initializing the state as when the screen starts accessed data shows in the screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedStoreImage =
          "https://westcoastcoupons.co.uk/wp-content/uploads/2021/06/natracare-BxvDij4p1SY-unsplash.jpg";
      getCouponDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appbar which contains an image and description title
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 10,
          title: Row(
            children: [
              // used network image because accessing image from server(API Calling)
              Image.network(
                selectedStoreImage,
                width: 30,
                height: 30,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  selectedStoreName ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'bitter',
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff000000),
              size: 30,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      selectedCouponName ?? '',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bitter',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  isThreeLine: false,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    selectedCouponDetail ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedExpiryDate ?? '',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        selectedCouponType ?? '',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  // color: Colors.black,
                  child: Center(child: Image.network(selectedStoreImage)),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    selectedCouponDetail ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff000000),
                  ),
                  title: Text(
                    selectedStoreAddress ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.phone_iphone_outlined,
                    color: Color(0xff000000),
                  ),
                  title: Text(
                    selectedStorePhone ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.web_asset_sharp,
                    color: Color(0xff000000),
                  ),
                  title: Text(
                    selectedStoreUrl ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
                TextButton(
                  clipBehavior: Clip.none,
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff000000),
                    padding: EdgeInsets.all(10),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: () {},
                  child: Text(
                    "More Info",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'bitter',
                      fontSize: 22,
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
}
