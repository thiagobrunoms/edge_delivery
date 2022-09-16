import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';

abstract class SignUpDataSource {
  Future<UserEntity> signUp(SignUpParam param);
}
