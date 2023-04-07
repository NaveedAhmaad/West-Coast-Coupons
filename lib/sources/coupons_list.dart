import 'package:flutter/material.dart';
//import 'package:west_coast_coupons/sources/coupon_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:west_coast_coupons/sources/coupon_details.dart';

import '../models/coupons.dart';

String? responseString;
Map mapResponse = {};
List<dynamic> listResponse = [];

class CouponList extends StatefulWidget {
  String myCoupon;
  CouponList({required this.myCoupon});
  @override
  State<CouponList> createState() =>
      _CouponListState.coupon(myRequiredCoupon: myCoupon);
}

class _CouponListState extends State<CouponList> {
  String myRequiredCoupon;
  _CouponListState.coupon({required this.myRequiredCoupon});
  List<Coupon> allCoupons = [];
  int index = 0;
  int count = 0;
  int selectedIndex = 0;
  loadCoupons() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://westcoastcoupons.co.uk/fetch-coupons/"));
    if (response.statusCode == 200) {
      setState(() {
        responseString = response.body;
        listResponse = json.decode(response.body);
        for (var data in listResponse) {
          if (data['category_name'] == myRequiredCoupon) {
            count = count+1;
            allCoupons.add(Coupon(
              couponName: data['coupon_name'],
              categoryName: data['category_name'],
              couponDetail: data['coupon_detail'],
              expiryDate: data['expiry_date'],
              couponType: data['coupon_type'],
              storeName: data['store_name'],
              storeDetail: data['store_detail'],
              storeUrl: data['store_url'],
              storeAddress: data['store_address'],
              storePhone: data['store_phone_number'],
              storeImage: data['store_image'],
            ));
          }
        }
      });
    } else {
      print("Check your Connectivity");
    }
  }

 late String selectedStoreName,
      selectedCouponName,
      selectedCouponDetail,
      selectedExpiryDate,
      selectedCouponType,
      selectedStoreDetail,
      selectedStoreUrl,
      selectedStoreAddress,
      selectedStorePhone,
   selectedStoreImage;

  Future<void> delay() async{
   await Future.delayed(Duration(milliseconds: 500));
   isLoaded = true;
  }

  @override
  void initState() {
    // TODO: implement initState
    loadCoupons();
    delay();
    super.initState();
  }
bool isLoaded= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          myRequiredCoupon,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'bitter',
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xff000000),
          ),
        ),
      ),
     body: isLoaded ?
      Material(
            // here we have to create the further Screen design in Future-Builder
            // to access the data from api and we have to show this data in our this page,
            child: Column(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 50,
                  //  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: isLoaded == true ? Text(
                    "Found $count Coupons" ,
                    //"Found ${items.length} Coupons",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ) : CircularProgressIndicator(),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: allCoupons.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                          // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xff000000),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          //  color: Color(0xffffffff),
                          child: Stack(
                            children: [
                              ListTile(
                                tileColor: Color(0xffffffff),
                                title: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    allCoupons[index].storeName,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        allCoupons[index].couponName,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            allCoupons[index].expiryDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              //fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            allCoupons[index].couponType,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Container(
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.2,
                                  child: Center(
                                    child: Image.network(
                                      allCoupons[index].storeImage['guid']
                                      as String,
                                    ),
                                  ),
                                ),
                                isThreeLine: true,
                                onTap: () async {
                                  selectedIndex = index;
                                  SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                                  sharedPreferences.setString('selectedStoreName',
                                      allCoupons[selectedIndex].storeName);
                                  sharedPreferences.setString(
                                      'selectedCouponName',
                                      allCoupons[selectedIndex].couponName);
                                  sharedPreferences.setString(
                                      'selectedCouponDetail',
                                      allCoupons[selectedIndex].couponDetail);
                                  sharedPreferences.setString(
                                      'selectedExpiryDate',
                                      allCoupons[selectedIndex].expiryDate);
                                  sharedPreferences.setString(
                                      'selectedCouponType',
                                      allCoupons[selectedIndex].couponType);
                                  sharedPreferences.setString(
                                      'selectedStoreDetail',
                                      allCoupons[selectedIndex].storeDetail);
                                  sharedPreferences.setString('selectedStoreUrl',
                                      allCoupons[selectedIndex].storeUrl);
                                  sharedPreferences.setString(
                                      'selectedStorePhone',
                                      allCoupons[selectedIndex].storePhone);
                                  sharedPreferences.setString(
                                      'selectedStoreImage',
                                      allCoupons[selectedIndex]
                                          .storeImage['guid']);
                                  sharedPreferences.setString(
                                      'selectedStoreAddress',
                                      allCoupons[selectedIndex].storeAddress);

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
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) {
                                        return CouponDetails();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
         : Center(child: CircularProgressIndicator(
       color: Color(0xff000000),
     ),)
    );



  }
}
