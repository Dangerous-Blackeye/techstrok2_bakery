// class secondry {
//   List<Data>? data;
//   String? message;
//   bool? status;

//   secondry({this.data, this.message, this.status});

//   secondry.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? categoryId;
//   String? productType;
//   String? description;
//   int? status;
//   Null? createdBy;
//   Null? updatedBy;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.name,
//       this.categoryId,
//       this.productType,
//       this.description,
//       this.status,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
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
//     return data;
//   }
// }
