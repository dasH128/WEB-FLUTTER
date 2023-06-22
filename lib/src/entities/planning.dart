class PlanningEntity {
  final String? id;
  final String asunto;
  final String fecha;
  final bool? estado;
  final List<List<String>>? call1;
  final List<List<String>>? parlo1;
  final List<List<String>>? call2;
  final List<List<String>>? parlo2;

  PlanningEntity({
    this.id,
    required this.asunto,
    required this.fecha,
    this.estado,
    this.call1,
    this.parlo1,
    this.call2,
    this.parlo2,
  });
}
