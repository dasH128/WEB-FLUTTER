import 'package:meta/meta.dart';
import 'dart:convert';

WorkerEntityResponse workerEntityResponseFromJson(String str) =>
    WorkerEntityResponse.fromJson(json.decode(str));

String workerEntityResponseToJson(WorkerEntityResponse data) =>
    json.encode(data.toJson());

class WorkerEntityResponse {
  final int status;
  final List<WorkerEntity> operation;

  WorkerEntityResponse({
    required this.status,
    required this.operation,
  });

  factory WorkerEntityResponse.fromJson(Map<String, dynamic> json) =>
      WorkerEntityResponse(
        status: json["status"],
        operation: List<WorkerEntity>.from(
            json["operation"].map((x) => WorkerEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "operation": List<dynamic>.from(operation.map((x) => x.toJson())),
      };
}

class WorkerEntity {
  final String? id;
  final String nombre;
  final String apellido;
  final String dni;
  final String correo;
  final int? v;

  WorkerEntity({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.dni,
    required this.correo,
    this.v,
  });

  factory WorkerEntity.fromJson(Map<String, dynamic> json) => WorkerEntity(
        id: json["_id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        correo: json["correo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "correo": correo,
        "__v": v,
      };
}
