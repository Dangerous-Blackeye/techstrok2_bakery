class requestselected {
  String? s0;
  String? message;
  bool? status;

  requestselected({this.s0, this.message, this.status});

  requestselected.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
