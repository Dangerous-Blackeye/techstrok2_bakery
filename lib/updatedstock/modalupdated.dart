class updatestock {
  Data1? data;
  String? message;
  bool? status;

  updatestock({this.data, this.message, this.status});

  updatestock.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
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

class Data1 {
  int? id;
  int? branchId;
  String? locationName;
  String? contactNo;
  String? updateNo;
  String? createdBy;
  Null? updatedBy;
  String? totalQty;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<UpdateProducts>? updateProducts;

  Data1(
      {this.id,
      this.branchId,
      this.locationName,
      this.contactNo,
      this.updateNo,
      this.createdBy,
      this.updatedBy,
      this.totalQty,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.updateProducts});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    locationName = json['location_name'];
    contactNo = json['contact_no'];
    updateNo = json['update_no'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    totalQty = json['total_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['update_products'] != null) {
      updateProducts = <UpdateProducts>[];
      json['update_products'].forEach((v) {
        updateProducts!.add(new UpdateProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['location_name'] = this.locationName;
    data['contact_no'] = this.contactNo;
    data['update_no'] = this.updateNo;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['total_qty'] = this.totalQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.updateProducts != null) {
      data['update_products'] =
          this.updateProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdateProducts {
  int? id;
  String? updateStockId;
  int? branchId;
  int? productId;
  Null? categoryId;
  String? previousStock;
  String? currentStock;
  Null? addLessStock;
  String? addLess;
  String? createdAt;
  String? updatedAt;

  UpdateProducts(
      {this.id,
      this.updateStockId,
      this.branchId,
      this.productId,
      this.categoryId,
      this.previousStock,
      this.currentStock,
      this.addLessStock,
      this.addLess,
      this.createdAt,
      this.updatedAt});

  UpdateProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updateStockId = json['update_stock_id'];
    branchId = json['branch_id'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    previousStock = json['previous_stock'];
    currentStock = json['current_stock'];
    addLessStock = json['add_less_stock'];
    addLess = json['add_less'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['update_stock_id'] = this.updateStockId;
    data['branch_id'] = this.branchId;
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['previous_stock'] = this.previousStock;
    data['current_stock'] = this.currentStock;
    data['add_less_stock'] = this.addLessStock;
    data['add_less'] = this.addLess;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
