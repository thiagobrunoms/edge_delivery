import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';


class SessionController {
  late UserEntity userEntity;

  setUser(UserEntity userEntity) => this.userEntity = userEntity;
}