// class PlanningEntity {
//   final String? id;
//   final String asunto;
//   final String fecha;
//   final bool? estado;
//   final List<List<String>>? call1;
//   final List<List<String>>? parlo1;
//   final List<List<String>>? call2;
//   final List<List<String>>? parlo2;

//   PlanningEntity({
//     this.id,
//     required this.asunto,
//     required this.fecha,
//     this.estado,
//     this.call1,
//     this.parlo1,
//     this.call2,
//     this.parlo2,
//   });
// }

// To parse this JSON data, do
//
//     final planningEntityResponse = planningEntityResponseFromJson(jsonString);

// import 'dart:ffi';

// import 'package:meta/meta.dart';
import 'dart:convert';

PlanningEntityResponse planningEntityResponseFromJson(String str) =>
    PlanningEntityResponse.fromJson(json.decode(str));

String planningEntityResponseToJson(PlanningEntityResponse data) =>
    json.encode(data.toJson());

class PlanningEntityResponse {
  final int status;
  final List<PlanningEntity> operation;

  PlanningEntityResponse({
    required this.status,
    required this.operation,
  });

  factory PlanningEntityResponse.fromJson(Map<String, dynamic> json) =>
      PlanningEntityResponse(
        status: json["status"],
        operation: List<PlanningEntity>.from(
            json["operation"].map((x) => PlanningEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "operation": List<dynamic>.from(operation.map((x) => x.toJson())),
      };
}

class PlanningEntity {
  final String? id;
  final String fecha;
  final String? fecha2;
  final String asunto;
  final bool? estado;
  final List<List<String>> call1;
  final List<List<String>> parlo1;
  final List<List<String>>? call2;
  final List<List<String>>? parlo2;
  final int? v;

  PlanningEntity({
    this.id,
    required this.fecha,
    this.fecha2,
    required this.asunto,
    this.estado,
    required this.call1,
    required this.parlo1,
    this.call2,
    this.parlo2,
    this.v,
  });

  factory PlanningEntity.fromJson(Map<String, dynamic> json) => PlanningEntity(
        id: json["_id"],
        fecha: json["fecha"],
        fecha2: json["fecha2"],
        asunto: json["asunto"],
        estado: json["estado"],
        call1: List<List<String>>.from(
            json["call1"].map((x) => List<String>.from(x.map((x) => x)))),
        parlo1: List<List<String>>.from(
            json["parlo1"].map((x) => List<String>.from(x.map((x) => x)))),
        call2: List<List<String>>.from(
            json["call2"].map((x) => List<String>.from(x.map((x) => x)))),
        parlo2: List<List<String>>.from(
            json["parlo2"].map((x) => List<String>.from(x.map((x) => x)))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fecha": fecha,
        "fecha2": fecha2,
        "asunto": asunto,
        "estado": estado,
        "call1": List<dynamic>.from(
            call1.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "parlo1": List<dynamic>.from(
            parlo1.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "call2": List<dynamic>.from(
            call2!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "parlo2": List<dynamic>.from(
            parlo2!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "__v": v,
      };
}
