import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';

class SignUpRestDatasource implements SignUpDataSource {
  final Dio dio;

  SignUpRestDatasource({required this.dio});

  @override
  Future<UserEntity> signUp(SignUpParam param) async {
    try {
      Map<String, dynamic> dataMap = {
        'name': param.name,
        'email': param.email,
        'password': param.password
      };

      var response = await dio.post('http://10.0.2.2:3000/signup',
          data: dataMap, options: Options(contentType: 'application/json'));

      Map<String, dynamic> data = response.data;

      return UserEntity.fromMap(data);
    } on DioError catch (e) {
      print(e.response);
      rethrow;
    }
  }
}
