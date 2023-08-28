class Received {
  List<ReceivedData1>? data;
  String? message;
  bool? status;

  Received({this.data, this.message, this.status});

  Received.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReceivedData1>[];
      json['data'].forEach((v) {
        data!.add(new ReceivedData1.fromJson(v));
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

class ReceivedData1 {
  int? id;
  int? branchId;
  int? requestBranchId;
  String? requestNo;
  Null? date;
  String? requestedBy;
  String? totalQty;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<RequestProducts>? requestProducts;
  Branch? branch;
  Branch? requestBranch;
  RequestBy? requestBy;

  ReceivedData1(
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
      this.requestProducts,
      this.branch,
      this.requestBranch,
      this.requestBy});

  ReceivedData1.fromJson(Map<String, dynamic> json) {
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
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    requestBranch = json['request_branch'] != null
        ? new Branch.fromJson(json['request_branch'])
        : null;
    requestBy = json['request_by'] != null
        ? new RequestBy.fromJson(json['request_by'])
        : null;
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
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.requestBranch != null) {
      data['request_branch'] = this.requestBranch!.toJson();
    }
    if (this.requestBy != null) {
      data['request_by'] = this.requestBy!.toJson();
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

class Branch {
  int? id;
  int? type;
  String? name;
  String? location;
  String? contactNo;
  String? address;
  String? seeStock;
  int? orderFullfillBy;
  int? status;
  String? createdAt;
  String? updatedAt;

  Branch(
      {this.id,
      this.type,
      this.name,
      this.location,
      this.contactNo,
      this.address,
      this.seeStock,
      this.orderFullfillBy,
      this.status,
      this.createdAt,
      this.updatedAt});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    location = json['location'];
    contactNo = json['contact_no'];
    address = json['address'];
    seeStock = json['see_stock'];
    orderFullfillBy = json['order_fullfill_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['location'] = this.location;
    data['contact_no'] = this.contactNo;
    data['address'] = this.address;
    data['see_stock'] = this.seeStock;
    data['order_fullfill_by'] = this.orderFullfillBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RequestBy {
  int? id;
  String? name;
  String? phone;
  String? designation;
  String? email;
  int? branchId;
  String? type;
  int? status;
  String? createdAt;
  String? updatedAt;

  RequestBy(
      {this.id,
      this.name,
      this.phone,
      this.designation,
      this.email,
      this.branchId,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  RequestBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    designation = json['designation'];
    email = json['email'];
    branchId = json['branch_id'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['branch_id'] = this.branchId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
