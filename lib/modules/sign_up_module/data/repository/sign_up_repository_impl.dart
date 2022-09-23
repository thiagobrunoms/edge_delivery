import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpDataSource datasource;

  SignUpRepositoryImpl({required this.datasource});

  @override
  Future<UserEntity> signUp(SignUpParam signUpParam) async {
    return await datasource.signUp(signUpParam);
  }
}
