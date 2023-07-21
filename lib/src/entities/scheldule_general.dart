class ScheduleGeneralEntity {
  final String? id;
  final String tipo;
  final String nomenclatura;
  final String bu;
  final String? iniDay;
  final String? finDay;
  final String? iniSat;
  final String? finSat;
  final String? iniDom;
  final String? finDom;
  final String? iniFes;
  final String? finFes;

  ScheduleGeneralEntity({
    this.id,
    required this.tipo,
    required this.nomenclatura,
    required this.bu,
    this.iniDay,
    this.finDay,
    this.iniSat,
    this.finSat,
    this.iniDom,
    this.finDom,
    this.iniFes,
    this.finFes,
  });
}
