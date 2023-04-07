class Coupon {
  late String couponName;
  late String categoryName;
  late String couponDetail;
  late String expiryDate;
  late String couponType;
  late String storeName;
  late String storeDetail;
  late String storeUrl;
  late String storeAddress;
  late String storePhone;
  late Map storeImage;
  Coupon(
      {required this.couponName,
        required this.categoryName,
        required this.couponDetail,
        required this.expiryDate,
        required this.couponType,
        required this.storeName,
        required this.storeDetail,
        required this.storeUrl,
        required this.storeAddress,
        required this.storePhone,
        required this.storeImage,
      });

  // factory Coupon.fromJson(Map<String, dynamic> json) {
  //   return Coupon(
  //       couponName: json['coupon_name'],
  //       categoryName: json['category_name'],
  //       couponDetail: json['coupon_detail'],
  //       expiryDate: json['expiry_date'],
  //       couponType: json['coupon_type'],
  //       storeName: json['store_name']!,
  //       storeDetail: json['store_detail']);
  // }
}
