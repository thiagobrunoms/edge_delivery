import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';

class SignUpRestDatasource implements SignUpDataSource {
  final Dio dio;

  SignUpRestDatasource({required this.dio});

  @override
  Future<Either<SignUpFailure, UserEntity>> signUp({SignUpParam? param}) async {
    try {
      Map<String, dynamic> dataMap = {
        'name': param!.name,
        'email': param.email,
        'password': param.password
      };

      var response = await dio.post('http://10.0.2.2:3000/signup',
          data: dataMap, options: Options(contentType: 'application/json'));

      Map<String, dynamic> data = response.data;

      return right(UserEntity.fromMap(data));
    } on DioError catch (e) {
      if (e.response!.statusCode == 409) {
        return left(SignUpFailure(message: 'Usuário com email já existente!'));
      }

      return left(SignUpFailure(message: 'Erro inesperado ao criar usuário!'));
    }
  }
}
