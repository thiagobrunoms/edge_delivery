import 'package:dartz/dartz.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';

abstract class SignUpDataSource {
  Future<Either<SignUpFailure, UserEntity>> signUp({SignUpParam? param});
}
