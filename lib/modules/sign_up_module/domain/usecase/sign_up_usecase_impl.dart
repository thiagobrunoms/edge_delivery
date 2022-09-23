import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  SignUpRepository repository;

  SignUpUsecaseImpl({required this.repository});

  @override
  Future<UserEntity> call({SignUpParam? param}) {
    print('usecase ${param!.email}');
    return repository.signUp(param);
  }
}
