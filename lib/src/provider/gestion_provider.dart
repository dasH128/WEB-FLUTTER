import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_web/src/entities/entities.dart';

var modalityProvider = Provider<List<ModalityEntity>>(
  (ref) => [
    ModalityEntity(id: '1', nombre: 'PRESENCIAL'),
    ModalityEntity(id: '2', nombre: 'WAHA'),
  ],
);
var optionProvider = Provider<List<OptionEntity>>(
  (ref) => [
    OptionEntity(id: '1', nombre: 'SIN OPCIÓN'),
    OptionEntity(id: '2', nombre: 'OPCIÓN 1'),
    OptionEntity(id: '3', nombre: 'OPCIÓN 2'),
    OptionEntity(id: '4', nombre: 'OPCIÓN 3'),
    OptionEntity(id: '5', nombre: 'OPCIÓN 4'),
  ],
);

var positionProvider = Provider<List<PositionEntity>>(
  (ref) => [
    PositionEntity(id: '1', nombre: 'PLATAFORMA ATENTO'),
    PositionEntity(id: '2', nombre: 'ATENTO REMOTO'),
  ],
);

var turnProvider = Provider<List<TurnEntity>>(
  (ref) => [
    TurnEntity(id: '1', nombre: 'MAÑANA', inicio: '8:00', fin: '2:00'),
    TurnEntity(id: '2', nombre: 'TARDE', inicio: '8:00', fin: '2:00'),
  ],
);

var islandProvider = Provider<List<IslandEntity>>(
  (ref) => [
    IslandEntity(
      nombre: 'FCOM CL',
    ),
    IslandEntity(
      nombre: 'FCOM PE',
    ),
    IslandEntity(
      nombre: 'FACL',
    ),
    IslandEntity(
      nombre: 'FAPE',
    ),
    IslandEntity(
      nombre: 'TOCL',
    ),
    IslandEntity(
      nombre: 'TOPE',
    ),
    IslandEntity(
      nombre: 'SOPE',
    ),
  ],
);
