// class stockdetails {
//   BData? data;
//   String? message;
//   bool? status;

//   stockdetails({this.data, this.message, this.status});

//   stockdetails.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new BData.fromJson(json['data']) : null;
//     message = json['message'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class BData {
//   int? id;
//   int? branchId;
//   String? locationName;
//   String? contactNo;
//   String? updateNo;
//   String? createdBy;
//   String? updatedBy;
//   String? totalQty;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   List<UpdateProducts>? updateProducts;
//   Branch? branch;

//   BData(
//       {this.id,
//       this.branchId,
//       this.locationName,
//       this.contactNo,
//       this.updateNo,
//       this.createdBy,
//       this.updatedBy,
//       this.totalQty,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.updateProducts,
//       this.branch});

//   BData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     branchId = json['branch_id'];
//     locationName = json['location_name'];
//     contactNo = json['contact_no'];
//     updateNo = json['update_no'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     totalQty = json['total_qty'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['update_products'] != null) {
//       updateProducts = <UpdateProducts>[];
//       json['update_products'].forEach((v) {
//         updateProducts!.add(new UpdateProducts.fromJson(v));
//       });
//     }
//     branch =
//         json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['branch_id'] = this.branchId;
//     data['location_name'] = this.locationName;
//     data['contact_no'] = this.contactNo;
//     data['update_no'] = this.updateNo;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['total_qty'] = this.totalQty;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.updateProducts != null) {
//       data['update_products'] =
//           this.updateProducts!.map((v) => v.toJson()).toList();
//     }
//     if (this.branch != null) {
//       data['branch'] = this.branch!.toJson();
//     }
//     return data;
//   }
// }

// class UpdateProducts {
//   int? id;
//   String? updateStockId;
//   int? branchId;
//   int? productId;
//   Null? categoryId;
//   String? previousStock;
//   String? currentStock;
//   String? addLessStock;
//   String? addLess;
//   String? createdAt;
//   String? updatedAt;
//   Products? products;

//   UpdateProducts(
//       {this.id,
//       this.updateStockId,
//       this.branchId,
//       this.productId,
//       this.categoryId,
//       this.previousStock,
//       this.currentStock,
//       this.addLessStock,
//       this.addLess,
//       this.createdAt,
//       this.updatedAt,
//       this.products});

//   UpdateProducts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     updateStockId = json['update_stock_id'];
//     branchId = json['branch_id'];
//     productId = json['product_id'];
//     categoryId = json['category_id'];
//     previousStock = json['previous_stock'];
//     currentStock = json['current_stock'];
//     addLessStock = json['add_less_stock'];
//     addLess = json['add_less'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     products = json['products'] != null
//         ? new Products.fromJson(json['products'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['update_stock_id'] = this.updateStockId;
//     data['branch_id'] = this.branchId;
//     data['product_id'] = this.productId;
//     data['category_id'] = this.categoryId;
//     data['previous_stock'] = this.previousStock;
//     data['current_stock'] = this.currentStock;
//     data['add_less_stock'] = this.addLessStock;
//     data['add_less'] = this.addLess;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.products != null) {
//       data['products'] = this.products!.toJson();
//     }
//     return data;
//   }
// }

// class Products {
//   int? id;
//   String? name;
//   String? categoryId;
//   String? productType;
//   String? description;
//   int? status;
//   String? createdBy;
//   String? updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   Category? category;

//   Products(
//       {this.id,
//       this.name,
//       this.categoryId,
//       this.productType,
//       this.description,
//       this.status,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.category});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     categoryId = json['category_id'];
//     productType = json['product_type'];
//     description = json['description'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['category_id'] = this.categoryId;
//     data['product_type'] = this.productType;
//     data['description'] = this.description;
//     data['status'] = this.status;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? name;
//   int? status;
//   Null? createdBy;
//   Null? updatedBy;
//   String? createdAt;
//   String? updatedAt;

//   Category(
//       {this.id,
//       this.name,
//       this.status,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['status'] = this.status;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Branch {
//   int? id;
//   int? type;
//   String? name;
//   String? location;
//   String? contactNo;
//   String? address;
//   String? seeStock;
//   Null? orderFullfillBy;
//   int? status;
//   String? createdAt;
//   String? updatedAt;

//   Branch(
//       {this.id,
//       this.type,
//       this.name,
//       this.location,
//       this.contactNo,
//       this.address,
//       this.seeStock,
//       this.orderFullfillBy,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   Branch.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     name = json['name'];
//     location = json['location'];
//     contactNo = json['contact_no'];
//     address = json['address'];
//     seeStock = json['see_stock'];
//     orderFullfillBy = json['order_fullfill_by'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     data['name'] = this.name;
//     data['location'] = this.location;
//     data['contact_no'] = this.contactNo;
//     data['address'] = this.address;
//     data['see_stock'] = this.seeStock;
//     data['order_fullfill_by'] = this.orderFullfillBy;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
