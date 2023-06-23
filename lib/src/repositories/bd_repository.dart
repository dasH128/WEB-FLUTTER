import 'package:dio/dio.dart';
import 'package:sistema_web/src/entities/entities.dart';

class BDRepository {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:3000/api'),
  );

  Future test() async {
    var res = await dio.get('/pokemon/');
    print(res);
    return [];
  }

  Future getWorkers() async {
    return [];
  }
  Future createWorker() async {}
  
  Future createPlanning(PlanningEntity planning) async {
    Map<String, dynamic> data = {
      "asunto": planning.asunto,
      "fecha": planning.fecha,
      "estado": "creado",
      "call1": planning.call1,
      "parlo1": planning.parlo1,
    };
    var f = await dio.post('/planning', data: data);
    print(f);
  }

  Future<List<PlanningEntity>> getPlaninnings() async {
    return [];
  }

  Future<bool> login(correo, password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio
          .post('/auth/login', data: {"email": correo, "password": password});

      print(response.data);
      return true;
    } catch (e) {
      if (e is DioException) {
        print(e.message);
      } else {
        print(e);
      }
      return false;
    }
    // return true;
  }
}
