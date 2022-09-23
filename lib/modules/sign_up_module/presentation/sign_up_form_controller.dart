import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_form_controller.g.dart';

class SignUpFormController = _SignUpFormControllerBase
    with _$SignUpFormController;

abstract class _SignUpFormControllerBase with Store {
  SignUpUsecase usecase;

  _SignUpFormControllerBase({required this.usecase});

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String repeatPassword = "";

  @observable
  ObservableFuture<UserEntity>? requestFuture;

  @action
  void setName(String name) => this.name = name;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  @action
  void setRepeatPassword(String repeatPassword) =>
      this.repeatPassword = repeatPassword;

  @computed
  String? get checkPasswords =>
      password != repeatPassword ? "Senhas incompatíveis" : null;

  @action
  Future<void> send() async {
    print('controller send.. $name, $email, $password');
    // usecase(param: SignUpParam(name: name, email: email, password: password));

    requestFuture = ObservableFuture(usecase(
        param: SignUpParam(name: name, email: email, password: password)));

    var response = await requestFuture;

    print('USUARIO CADASTRADO ${response}');
  }
}
