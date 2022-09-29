import 'package:dartz/dartz.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';
import 'package:edge_delivery/shared/usecases/usecase.dart';

class SignUpParam {
  final String name;
  final String password;
  final String email;

  SignUpParam(
      {required this.name, required this.password, required this.email});
}

abstract class SignUpUsecase
    extends Usecase<Either<SignUpFailure, UserEntity>, SignUpParam?> {}
