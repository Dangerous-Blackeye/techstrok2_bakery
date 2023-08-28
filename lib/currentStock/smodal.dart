class BranchS {
  Data? data;
  String? message;
  bool? status;

  BranchS({this.data, this.message, this.status});

  BranchS.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  BranchDetails? branchDetails;
  List<BranchStock>? branchStock;

  Data({this.branchDetails, this.branchStock});

  Data.fromJson(Map<String, dynamic> json) {
    branchDetails = json['branch_details'] != null
        ? new BranchDetails.fromJson(json['branch_details'])
        : null;
    if (json['branch_stock'] != null) {
      branchStock = <BranchStock>[];
      json['branch_stock'].forEach((v) {
        branchStock!.add(new BranchStock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branchDetails != null) {
      data['branch_details'] = this.branchDetails!.toJson();
    }
    // if (this.branchStock != null) {
    //   data['branch_stock'] = this.branchStock!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class BranchDetails {
  int? branchId;
  String? branchName;

  BranchDetails({this.branchId, this.branchName});

  BranchDetails.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    branchName = json['branchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['branchName'] = this.branchName;
    return data;
  }
}

class BranchStock {
  int? productId;
  String? productName;
  String? productStock;
  String? productType;
  int? categoryId;
  String? categoryName;

  BranchStock(param0,
      {this.productId,
      this.productName,
      this.productStock,
      this.productType,
      this.categoryId,
      this.categoryName});

  BranchStock.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productStock = json['productStock'];
    productType = json['productType'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productStock'] = this.productStock;
    data['productType'] = this.productType;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    return data;
  }
}
