class Moon {
  String? format;
  Style? style;
  Observer? observer;
  View? view;

  Moon({this.format, this.style, this.observer, this.view});

  Moon.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    observer = json['observer'] != null
        ? new Observer.fromJson(json['observer'])
        : null;
    view = json['view'] != null ? new View.fromJson(json['view']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    if (this.observer != null) {
      data['observer'] = this.observer!.toJson();
    }
    if (this.view != null) {
      data['view'] = this.view!.toJson();
    }
    return data;
  }
}

class Style {
  String? moonStyle;
  String? backgroundStyle;
  String? backgroundColor;
  String? headingColor;
  String? textColor;

  Style(
      {this.moonStyle,
        this.backgroundStyle,
        this.backgroundColor,
        this.headingColor,
        this.textColor});

  Style.fromJson(Map<String, dynamic> json) {
    moonStyle = json['moonStyle'];
    backgroundStyle = json['backgroundStyle'];
    backgroundColor = json['backgroundColor'];
    headingColor = json['headingColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moonStyle'] = this.moonStyle;
    data['backgroundStyle'] = this.backgroundStyle;
    data['backgroundColor'] = this.backgroundColor;
    data['headingColor'] = this.headingColor;
    data['textColor'] = this.textColor;
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
  String? orientation;

  View({this.type, this.orientation});

  View.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    orientation = json['orientation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['orientation'] = this.orientation;
    return data;
  }
}