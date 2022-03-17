class StarChart {
  String? style;
  Observer? observer;
  View? view;

  StarChart({this.style, this.observer, this.view});

  StarChart.fromJson(Map<String, dynamic> json) {
    style = json['style'];
    observer = json['observer'] != null
        ? new Observer.fromJson(json['observer'])
        : null;
    view = json['view'] != null ? new View.fromJson(json['view']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['style'] = this.style;
    if (this.observer != null) {
      data['observer'] = this.observer!.toJson();
    }
    if (this.view != null) {
      data['view'] = this.view!.toJson();
    }
    return data;
  }
}

class Observer {
  double? latitude;
  double? longitude;
  String? date;

  Observer({this.latitude, this.longitude, this.date});

  Observer.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['date'] = this.date;
    return data;
  }
}

class View {
  String? type;
  Parameters? parameters;

  View({this.type, this.parameters});

  View.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    return data;
  }
}

class Parameters {
  String? constellation;

  Parameters({this.constellation});

  Parameters.fromJson(Map<String, dynamic> json) {
    constellation = json['constellation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['constellation'] = this.constellation;
    return data;
  }
}