import 'package:dio/dio.dart';
import 'package:sistema_web/src/entities/entities.dart';

class BDRepository {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:3000/api'),
  );

  Future test() async {
    var res = await dio.get('/pokemon/');
    return [];
  }

  Future<List<WorkerEntity>> getWorkers() async {
    try {
      var response = await dio.get('/worker');
      WorkerEntityResponse res = WorkerEntityResponse.fromJson(response.data);
      List<WorkerEntity> list = res.operation;
      return list;
    } catch (e) {
      print('e: ${e.toString()}');
      return [];
    }
  }

  Future<List<WorkerEntity>> getWorkersByIsla(String filter) async {
    try {
      var response =
          await dio.get('/worker/isla', queryParameters: {'filter': filter});
      WorkerEntityResponse res = WorkerEntityResponse.fromJson(response.data);
      List<WorkerEntity> list = res.operation;
      return list;
    } catch (e) {
      print('e: ${e.toString()}');
      return [];
    }
  }

  Future<Map<String, dynamic>> createWorker(Map<String, String> data) async {
    print(data);
    Map<String, dynamic> res = {};
    try {
      Response<dynamic> f = await dio.post('/worker', data: data);
      print('fffffffffffff');
      print(f);
      res['status'] = f.data['status'];
      res['operation'] = f.data['operation'];
      res['message'] = f.data['message'] ?? '';
      print('createWorker -GOD: ${f.toString()}');
      return res;
    } catch (e) {
      print('createWorker -BAD: ${e.toString()}');
      return {"status": 200, "operation": false, "message": e.toString()};
    }
  }

  Future<bool> createPlanning(PlanningEntity planning) async {
    Map<String, dynamic> data = {
      "asunto": planning.asunto,
      "fecha": planning.fecha,
      "fecha2": planning.fecha2,
      // "estado": "creado",
      "call1": planning.call1,
      "parlo1": planning.parlo1,
    };
    try {
      Response<dynamic> res = await dio.post('/planning', data: data);
      return res.data['operation'];
    } catch (e) {
      return false;
    }
  }

  Future<bool> createProgramation(
      {required String id,
      required List<List<String>> call2,
      required List<List<String>> parlo2}) async {
    try {
      Response<dynamic> res = await dio.put('/planning/$id/programing', data: {
        "call2": call2,
        "parlo2": parlo2,
      });
      return res.data['operation'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<PlanningEntity>> getPlannings() async {
    try {
      var response = await dio.get('/planning', queryParameters: {});
      PlanningEntityResponse res =
          PlanningEntityResponse.fromJson(response.data);
      List<PlanningEntity> list = res.operation;
      return list;
    } catch (e) {
      print('e: ${e.toString()}');
      return [];
    }
  }

//   {
//   "name": "jeferson",
//   "lastname": "quinto povis",
//   "username": "jeferQPqq",
//   "email": "jeferson323@gmail.com",
//   "password": "1234567890"
// }
  Future<LoginResponse> login(correo, password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      print('init DIO');
      final response = await dio
          .post('/auth/login', data: {"email": correo, "password": password});
      print('response');
      print(response.data);
      LoginResponse res = LoginResponse.fromJson(response.data);
      print('LoginResponse');
      print(res);
      return res;
    } catch (e) {
      if (e is DioException) {
        print(e.message);
      } else {
        print(e);
      }
      return LoginResponse(auth: false, message: e.toString());
    }
    // return true;
  }
}
