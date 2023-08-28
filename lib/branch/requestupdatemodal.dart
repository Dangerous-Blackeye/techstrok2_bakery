class requestupdate {
  Data? data;
  String? message;
  bool? status;

  requestupdate({this.data, this.message, this.status});

  requestupdate.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? branchId;
  int? requestBranchId;
  String? requestNo;
  Null? date;
  String? requestedBy;
  Null? totalQty;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<RequestProducts>? requestProducts;

  Data(
      {this.id,
      this.branchId,
      this.requestBranchId,
      this.requestNo,
      this.date,
      this.requestedBy,
      this.totalQty,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.requestProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    requestBranchId = json['request_branch_id'];
    requestNo = json['request_no'];
    date = json['date'];
    requestedBy = json['requested_by'];
    totalQty = json['total_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['request_products'] != null) {
      requestProducts = <RequestProducts>[];
      json['request_products'].forEach((v) {
        requestProducts!.add(new RequestProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['request_branch_id'] = this.requestBranchId;
    data['request_no'] = this.requestNo;
    data['date'] = this.date;
    data['requested_by'] = this.requestedBy;
    data['total_qty'] = this.totalQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.requestProducts != null) {
      data['request_products'] =
          this.requestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestProducts {
  int? id;
  String? requestId;
  int? branchId;
  int? productId;
  Null? categoryId;
  String? reqStock;
  String? addLess;
  String? createdAt;
  String? updatedAt;
  Products? products;

  RequestProducts(
      {this.id,
      this.requestId,
      this.branchId,
      this.productId,
      this.categoryId,
      this.reqStock,
      this.addLess,
      this.createdAt,
      this.updatedAt,
      this.products});

  RequestProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestId = json['request_id'];
    branchId = json['branch_id'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    reqStock = json['req_stock'];
    addLess = json['add_less'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['request_id'] = this.requestId;
    data['branch_id'] = this.branchId;
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['req_stock'] = this.reqStock;
    data['add_less'] = this.addLess;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? categoryId;
  String? productType;
  String? description;
  int? status;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Products(
      {this.id,
      this.name,
      this.categoryId,
      this.productType,
      this.description,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    productType = json['product_type'];
    description = json['description'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['product_type'] = this.productType;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? status;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.name,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
