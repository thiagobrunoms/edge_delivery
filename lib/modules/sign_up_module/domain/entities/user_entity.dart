class UserEntity {
  final String id;
  final String name;
  final String email;
  final String password;
  final String code;
  final String authToken;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.code,
      required this.authToken});

  factory UserEntity.fromMap(Map<String, dynamic> data) {
    return UserEntity(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        password: data['password'],
        code: data['code'],
        authToken: data['auth_token']);
  }

  @override
  String toString() => 'Usuario $name com email $email cadastrado com sucesso!';
}
