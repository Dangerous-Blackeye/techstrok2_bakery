class updateStockList {
  List<Datamaster>? data;
  String? message;
  bool? status;

  updateStockList({this.data, this.message, this.status});

  updateStockList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Datamaster>[];
      json['data'].forEach((v) {
        data!.add(new Datamaster.fromJson(v));
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

class Datamaster {
  int? updateId;
  String? updateNo;
  String? updatedDate;
  String? updatedBy;
  String? location;
  String? contact;
  String? status;

  Datamaster(
      {this.updateId,
      this.updateNo,
      this.updatedDate,
      this.updatedBy,
      this.location,
      this.contact,
      this.status});

  Datamaster.fromJson(Map<String, dynamic> json) {
    updateId = json['updateId'];
    updateNo = json['updateNo'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
    location = json['location'];
    contact = json['contact'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateId'] = this.updateId;
    data['updateNo'] = this.updateNo;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    data['location'] = this.location;
    data['contact'] = this.contact;
    data['status'] = this.status;
    return data;
  }
}
