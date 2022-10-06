import 'package:dartz/dartz.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  SignUpRepository repository;

  SignUpUsecaseImpl({required this.repository});

  @override
  Future<Either<SignUpFailure, UserEntity>> call({SignUpParam? param}) {
    return repository.signUp(signUpParam: param!);
  }
}