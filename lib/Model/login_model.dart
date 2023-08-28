
class LoginModel {
    Data? data;
    String? message;
    bool? status;

    LoginModel({this.data, this.message, this.status});

    LoginModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
        message = json["message"];
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        _data["message"] = message;
        _data["status"] = status;
        return _data;
    }
}

class Data {
    User? user;
    String? accessToken;

    Data({this.user, this.accessToken});

    Data.fromJson(Map<String, dynamic> json) {
        user = json["user"] == null ? null : User.fromJson(json["user"]);
        accessToken = json["access_token"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(user != null) {
            _data["user"] = user?.toJson();
        }
        _data["access_token"] = accessToken;
        return _data;
    }
}

class User {
    int? id;
    String? name;
    String? phone;
    String? designation;
    String? email;
    int? branchId;
    int? status;
    String? createdAt;
    String? updatedAt;
    Branch? branch;

    User({this.id, this.name, this.phone, this.designation, this.email, this.branchId, this.status, this.createdAt, this.updatedAt, this.branch});

    User.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        phone = json["phone"];
        designation = json["designation"];
        email = json["email"];
        branchId = json["branch_id"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        branch = json["branch"] == null ? null : Branch.fromJson(json["branch"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["phone"] = phone;
        _data["designation"] = designation;
        _data["email"] = email;
        _data["branch_id"] = branchId;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(branch != null) {
            _data["branch"] = branch?.toJson();
        }
        return _data;
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
    dynamic orderFullfillBy;
    int? status;
    String? createdAt;
    String? updatedAt;

    Branch({this.id, this.type, this.name, this.location, this.contactNo, this.address, this.seeStock, this.orderFullfillBy, this.status, this.createdAt, this.updatedAt});

    Branch.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        type = json["type"];
        name = json["name"];
        location = json["location"];
        contactNo = json["contact_no"];
        address = json["address"];
        seeStock = json["see_stock"];
        orderFullfillBy = json["order_fullfill_by"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["type"] = type;
        _data["name"] = name;
        _data["location"] = location;
        _data["contact_no"] = contactNo;
        _data["address"] = address;
        _data["see_stock"] = seeStock;
        _data["order_fullfill_by"] = orderFullfillBy;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}