import 'package:edge_delivery/modules/sign_up_module/domain/entities/social_network.dart';

class UserEntity {
  final String? id;
  final String name;
  final String email;
  final String? password;
  final String? code;
  final String? authToken;
  final SocialNetwork? socialNetwork;

  UserEntity(
      {this.id,
      required this.name,
      required this.email,
      this.password,
      this.code,
      this.authToken,
      this.socialNetwork});

  factory UserEntity.fromMap(Map<String, dynamic> data) {
    return UserEntity(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
      code: data['code'],
      authToken: data['auth_token'],
    );
  }

  factory UserEntity.fromGoogle(Map<String, dynamic> data) {
    SocialNetwork network = SocialNetwork(googleId: data['googleId']);
    return UserEntity(
        name: data['name'], email: data['email'], socialNetwork: network);
  }

  @override
  String toString() => 'Usuario $name com email $email cadastrado com sucesso!';
}
