class Bodies {
  Data? data;

  Bodies({this.data});

  Bodies.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? bodies;

  Data({this.bodies});

  Data.fromJson(Map<String, dynamic> json) {
    bodies = json['bodies'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bodies'] = this.bodies;
    return data;
  }
}