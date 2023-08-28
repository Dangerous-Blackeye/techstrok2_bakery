class updateDetailsList {
  List<DataS>? data;
  String? message;
  bool? status;

  updateDetailsList({this.data, this.message, this.status});

  updateDetailsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataS>[];
      json['data'].forEach((v) {
        data!.add(new DataS.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class DataS {
  int? updateProductId;
  int? productId;
  String? productName;
  String? previousStock;
  String? currentStock;
  String? effectStock;
  String? transactionType;

  DataS(
      {this.updateProductId,
      this.productId,
      this.productName,
      this.previousStock,
      this.currentStock,
      this.effectStock,
      this.transactionType});

  DataS.fromJson(Map<String, dynamic> json) {
    updateProductId = json['updateProductId'];
    productId = json['productId'];
    productName = json['productName'];
    previousStock = json['previousStock'];
    currentStock = json['currentStock'];
    effectStock = json['effectStock'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateProductId'] = this.updateProductId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['previousStock'] = this.previousStock;
    data['currentStock'] = this.currentStock;
    data['effectStock'] = this.effectStock;
    data['transactionType'] = this.transactionType;
    return data;
  }
}
