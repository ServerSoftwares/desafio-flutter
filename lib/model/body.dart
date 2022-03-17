class Body {
  Data? data;

  Body({this.data});

  Body.fromJson(Map<String, dynamic> json) {
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
  Dates? dates;
  Observer? observer;
  Table? table;

  Data({this.dates, this.observer, this.table});

  Data.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    observer = json['observer'] != null
        ? new Observer.fromJson(json['observer'])
        : null;
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates!.toJson();
    }
    if (this.observer != null) {
      data['observer'] = this.observer!.toJson();
    }
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    return data;
  }
}

class Dates {
  String? from;
  String? to;

  Dates({this.from, this.to});

  Dates.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Observer {
  Local? location;

  Observer({this.location});

  Observer.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Local.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Local {
  double? longitude;
  double? latitude;
  int? elevation;

  Local({this.longitude, this.latitude, this.elevation});

  Local.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    elevation = json['elevation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['elevation'] = this.elevation;
    return data;
  }
}

class Table {
  List<String>? header;
  List<Rows>? rows;

  Table({this.header, this.rows});

  Table.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  List<Cells>? cells;
  Entry? entry;

  Rows({this.cells, this.entry});

  Rows.fromJson(Map<String, dynamic> json) {
    if (json['cells'] != null) {
      cells = <Cells>[];
      json['cells'].forEach((v) {
        cells!.add(new Cells.fromJson(v));
      });
    }
    entry = json['entry'] != null ? new Entry.fromJson(json['entry']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cells != null) {
      data['cells'] = this.cells!.map((v) => v.toJson()).toList();
    }
    if (this.entry != null) {
      data['entry'] = this.entry!.toJson();
    }
    return data;
  }
}

class Cells {
  String? date;
  String? id;
  String? name;
  Distance? distance;
  Position? position;
  ExtraInfo? extraInfo;

  Cells(
      {this.date,
        this.id,
        this.name,
        this.distance,
        this.position,
        this.extraInfo});

  Cells.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    name = json['name'];
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    extraInfo = json['extraInfo'] != null
        ? new ExtraInfo.fromJson(json['extraInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    if (this.extraInfo != null) {
      data['extraInfo'] = this.extraInfo!.toJson();
    }
    return data;
  }
}

class Distance {
  FromEarth? fromEarth;

  Distance({this.fromEarth});

  Distance.fromJson(Map<String, dynamic> json) {
    fromEarth = json['fromEarth'] != null
        ? new FromEarth.fromJson(json['fromEarth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fromEarth != null) {
      data['fromEarth'] = this.fromEarth!.toJson();
    }
    return data;
  }
}

class FromEarth {
  String? au;
  String? km;

  FromEarth({this.au, this.km});

  FromEarth.fromJson(Map<String, dynamic> json) {
    au = json['au'];
    km = json['km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['au'] = this.au;
    data['km'] = this.km;
    return data;
  }
}

class Position {
  Horizonal? horizonal;
  Equatorial? equatorial;

  Position({this.horizonal, this.equatorial});

  Position.fromJson(Map<String, dynamic> json) {
    horizonal = json['horizonal'] != null
        ? new Horizonal.fromJson(json['horizonal'])
        : null;
    equatorial = json['equatorial'] != null
        ? new Equatorial.fromJson(json['equatorial'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.horizonal != null) {
      data['horizonal'] = this.horizonal!.toJson();
    }
    if (this.equatorial != null) {
      data['equatorial'] = this.equatorial!.toJson();
    }
    return data;
  }
}

class Horizonal {
  Altitude? altitude;
  Altitude? azimuth;

  Horizonal({this.altitude, this.azimuth});

  Horizonal.fromJson(Map<String, dynamic> json) {
    altitude = json['altitude'] != null
        ? new Altitude.fromJson(json['altitude'])
        : null;
    azimuth =
    json['azimuth'] != null ? new Altitude.fromJson(json['azimuth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.altitude != null) {
      data['altitude'] = this.altitude!.toJson();
    }
    if (this.azimuth != null) {
      data['azimuth'] = this.azimuth!.toJson();
    }
    return data;
  }
}

class Altitude {
  String? degrees;
  String? string;

  Altitude({this.degrees, this.string});

  Altitude.fromJson(Map<String, dynamic> json) {
    degrees = json['degrees'];
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['degrees'] = this.degrees;
    data['string'] = this.string;
    return data;
  }
}

class Equatorial {
  RightAscension? rightAscension;
  Altitude? declination;

  Equatorial({this.rightAscension, this.declination});

  Equatorial.fromJson(Map<String, dynamic> json) {
    rightAscension = json['rightAscension'] != null
        ? new RightAscension.fromJson(json['rightAscension'])
        : null;
    declination = json['declination'] != null
        ? new Altitude.fromJson(json['declination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rightAscension != null) {
      data['rightAscension'] = this.rightAscension!.toJson();
    }
    if (this.declination != null) {
      data['declination'] = this.declination!.toJson();
    }
    return data;
  }
}

class RightAscension {
  String? hours;
  String? string;

  RightAscension({this.hours, this.string});

  RightAscension.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hours'] = this.hours;
    data['string'] = this.string;
    return data;
  }
}

class ExtraInfo {
  String? elongation;
  String? magnitude;

  ExtraInfo({this.elongation, this.magnitude});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    elongation = json['elongation'];
    magnitude = json['magnitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elongation'] = this.elongation;
    data['magnitude'] = this.magnitude;
    return data;
  }
}

class Entry {
  String? id;
  String? name;

  Entry({this.id, this.name});

  Entry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}