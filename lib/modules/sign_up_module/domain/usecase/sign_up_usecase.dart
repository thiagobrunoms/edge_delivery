import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/shared/usecases/usecase.dart';

class SignUpParam {
  final String name;
  final String password;
  final String email;

  SignUpParam(this.name, this.password, this.email);
}

abstract class SignUpUsecase extends Usecase<UserEntity, SignUpParam> {}
