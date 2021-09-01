class ProductModel {
  String? productID;
  String? productDS;
  int? productPR;

  ProductModel({this.productID, this.productDS, this.productPR});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    productDS = json['productDS'];
    productPR = json['productPR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['productDS'] = this.productDS;
    data['productPR'] = this.productPR;
    return data;
  }
}
