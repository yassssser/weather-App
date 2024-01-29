// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Data? data;
  List<Warning>? warnings;

  Weather({
    this.data,
    this.warnings,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        warnings: json["warnings"] == null
            ? []
            : List<Warning>.from(
                json["warnings"]!.map((x) => Warning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "warnings": warnings == null
            ? []
            : List<dynamic>.from(warnings!.map((x) => x.toJson())),
      };
}

class Data {
  List<Timeline>? timelines;

  Data({
    this.timelines,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        timelines: json["timelines"] == null
            ? []
            : List<Timeline>.from(
                json["timelines"]!.map((x) => Timeline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timelines": timelines == null
            ? []
            : List<dynamic>.from(timelines!.map((x) => x.toJson())),
      };
}

class Timeline {
  String? timestep;
  DateTime? startTime;
  DateTime? endTime;
  List<Interval>? intervals;

  Timeline({
    this.timestep,
    this.startTime,
    this.endTime,
    this.intervals,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        timestep: json["timestep"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        intervals: json["intervals"] == null
            ? []
            : List<Interval>.from(
                json["intervals"]!.map((x) => Interval.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestep": timestep,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "intervals": intervals == null
            ? []
            : List<dynamic>.from(intervals!.map((x) => x.toJson())),
      };
}

class Interval {
  DateTime? startTime;
  Map<String, double?>? values;

  Interval({
    this.startTime,
    this.values,
  });

  factory Interval.fromJson(Map<String, dynamic> json) => Interval(
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        values: Map.from(json["values"]!)
            .map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime?.toIso8601String(),
        "values":
            Map.from(values!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Warning {
  int? code;
  String? type;
  String? message;
  Meta? meta;

  Warning({
    this.code,
    this.type,
    this.message,
    this.meta,
  });

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        code: json["code"],
        type: json["type"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "type": type,
        "message": message,
        "meta": meta?.toJson(),
      };
}

class Meta {
  String? timestep;
  String? from;
  String? to;

  Meta({
    this.timestep,
    this.from,
    this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        timestep: json["timestep"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "timestep": timestep,
        "from": from,
        "to": to,
      };
}
