import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';

class GoogleSignUpDatasource implements SignUpDataSource {
  @override
  Future<UserEntity> signUp(SignUpParam param) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
